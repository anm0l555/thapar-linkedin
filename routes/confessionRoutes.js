const express=require('express');
const {check,validationResult}=require('express-validator');
const isLoggedIn = require('../middleware/authmiddle')
const User = require('../models/usermodel')
const Confession = require('../models/confessionModel');

const router=express.Router();

//@route  Confess /api/confess
//@access Private
//@desc   Create a confession
router.post('/',[isLoggedIn,[
  check('text','Text is required').not().isEmpty()
  ]],async(req,res)=>{
  const errors=validationResult(req);
  if(!errors.isEmpty())
  {
    return res.status(400).json({errors:errors.array()});
  }
  try{
  const user=await User.findById(req.user.id);//.select('-password');
  const newConfession=new Confession({                         //                                                   
    text:req.body.text,
    name:user.name,
    user:req.user.id
  })
  await newConfession.save();
  res.json(newConfession);
  }catch(err){
    console.error(err);
    res.status(500).send('Server Error');
  }
})

//@access Private
//@route  Get /api/confess
//@desc   Retrieve all confessions
router.get('/',isLoggedIn,async(req,res)=>{
  try{
    const user=await User.findById(req.user.id);                             //
    const confessions=await Confession.find().sort({date:-1});                                 //
    res.json(confessions);
  }catch(err){
    console.error(err);
    res.status(500).send('Server Error');
  }
})

//@access Private
//@desc  Get confessions by id
//@route Get /api/confess/:id
router.get('/:id',isLoggedIn,async(req,res)=>{
  try{
    const confession=await Confession.findById(req.params.id);
    if(!confession)
    {
      return res.status(404).json({msg:'No post found'});
    }
    res.json(confession);
  }catch(err){
    console.error(err);
    if(err.kind==='ObjectId')
    {
      return res.status(404).json({msg:'No post found'});
    }
    res.status(500).send('Server Error');
  }
})

//@access Private
//@desc Delete confession using its id
//@@route Delete /api/confess/:id
router.delete('/:id',isLoggedIn,async(req,res)=>{
  try{
    const confession=await Confession.findById(req.params.id);
    if(!confession)
    {
      return res.status(404).json({msg:'No post found'});
    }
    if(confession.user.toString()!==req.user.id)
    {
      return res.status(401).json({msg:'User not authorised'});
    }
    await confession.remove();
    res.json({msg:'The confession has been removed'});
  }catch(err){
    console.error(err);
    if(err.kind==='ObjectId')
    {
      return res.status(404).json({msg:'No post found'});
    }
    res.status(500).send('Server Error');
  }
})

//@access Private
//@route  PUT /api/confess/like/:id
//@desc   Like a confession
router.put('/like/:id',isLoggedIn,async(req,res)=>{
  try{
    const confession=await Confession.findById(req.params.id);
    if(confession.likes.filter(like=>like.user.toString()===req.user.id).length>0)
    {
      return res.status(500).json({msg:'Post already liked'});
    }
    confession.likes.unshift({user:req.user.id});
    await confession.save();
    res.json(confession.likes);
  }catch(err){
    console.error(err.message);
    res.status(500).send('Server Error');
  }
})

//@route   Put /api/confess/unlike/:id
//@access  Private
//@desc    Unlike a confession
router.put('/unlike/:id',isLoggedIn,async(req,res)=>{
  try{
    const confession=await Confession.findById(req.params.id);
    if(confession.likes.filter(like=>like.user.toString()===req.user.id).length===0)
    {
      return res.status(400).json({msg:'The post has not been liked yet'})
    }
    const removeIndex=confession.likes.map(like=>like.user).indexOf(req.user.id);
    confession.likes.splice(removeIndex,1);
    await confession.save();
    res.json(confession.likes);
  }catch(err){
    console.error(err.message);
    res.status(500).send('Server Error');
  }
})

//@desc   Comment on a confession
//@access Private
//@route  Put /api/confess/comment/:id
router.post('/comment/:id', [isLoggedIn, [
    check('text', 'text is required').not().isEmpty()
  ]], async (req, res) => {
  
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      console.log(errors)
      return res.status(400).json({ errors: errors.array() })
    }
  
    try {
  
      var user = await User.findById(req.user.id);
      var confession = await Confession.findById(req.params.id);
  
      const newComment = { //
        text: req.body.text,
        name: user.name,
        user: req.user.id
      }
      confession.comments.unshift(newComment)
  
      await confession.save();
      res.json(confession.comments);
  
    } catch (error) {
      console.log(error.message);
      res.status(500).send('Server Error');
  
    }
  
  
  });

//@desc     Delete comment
//@route    Delete /api/confess/comment/:id/:comment_id
//@access   Private
router.delete('/comment/:id/:comment_id',isLoggedIn,async(req,res)=>{
  try{
    const confession=await Confession.findById(req.params.id);
    const comment=confession.comments.find(comment=>comment.id.toString()===req.params.comment_id);
    if(comment.user.toString()!==req.user.id)
    {
      return res.status(401).json({msg:'User not authorised'});
    }
    const removeIndex=confession.comments.map(comment=>comment.id).indexOf(req.params.comment_id);
    confession.comments.splice(removeIndex,1);
    await confession.save();
    res.json(confession.comments);
  }catch(err){
    console.error(err);
    res.status(500).send('Server Error');
  }
})

//Route to like a comment on a confession

//Route to unlike a comment on a confession

module.exports=router;
