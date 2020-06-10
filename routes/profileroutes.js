const router = require('express').Router();
const User = require('../models/usermodel')
const Profile = require('../models/profilemodel')
const isLoggedIn = require('../middleware/authmiddle')
const {check,validationResult} = require('express-validator')

//@route GET api/profile/me
//@desc GET indivisual Profile
//@access Private

router.get('/me',isLoggedIn , async(req,res)=>{
    try {
        const profile = await Profile.findOne({user: req.user._id}).populate ('user',[])

        if (!profile)
        {
            return res.status(400).json({ msg: 'there is no profile for this user' });
        }

        res.json(profile);

    } catch (err) {
        console.log(err.message);
        res.status(500).send('server error');
    }
})

//@route POST api/profile
//@desc create or update a profile
//@access Private

router.post ('/' , [isLoggedIn ,[
    check('gender' , "Gender is required").not().isEmpty(),
    check('year' , "Year is required").not().isEmpty(),
]], async (req,res)=>{

    const errors=validationResult(req);
    if (!errors.isEmpty())
    {
        console.log(errors)
        return res.status(400).json({ errors: errors.array() })
    }

    const {
        username ,
        bio,gender,year , branch , city , DoB , status , spouse , societies

    } = req.body;

    const profileFields={};
    profileFields.user =  req.user._id
    if(username) profileFields.username= username.trim();
    if(bio) profileFields.bio=bio.trim()
    if(gender) profileFields.gender=gender.trim()
    if(year) profileFields.year=year.trim()
    if(branch) profileFields.branch=branch.trim()
    if(city) profileFields.city=city.trim()
    if(DoB) profileFields.DoB=DoB
    if (societies) profileFields.societies= societies

    profileFields.relationship={};
    if(status) profileFields.relationship.status=status.trim()
    if(bio) profileFields.relationship.spouse=spouse

    console.log(profileFields)
    try {
        let profile = await Profile.findOne({user:req.user._id})
        console.log(profile)
        if (profile)
        {
            profile= await Profile.findOneAndUpdate(
                {user:req.user._id},
                {$set:profileFields},
                {new:true}
                );
                return res.json(profile);
        }

        profile = await new Profile(profileFields).save();
        res.json(profile)



    } catch (error) {
        console.log(error.message)
        res.status(600).send('server error');
    }

})

// GET all profiles

router.get('/', async (req, res) => {
    try {
      let profiles = await Profile.find().populate('user', ['name'])
      res.json(profiles);
  
    } catch (err) {
      console.log(err.message);
      res.status(500).send('server error');
    }
  })


//@route  GET api/profile/user/:user_id
//@desc   GET profile by user id
//@access Public

router.get('/user/:user_id', async (req, res) => {
    try {
      let profile = await Profile.findOne({ user: req.params.user_id }).populate('user', ['name']);
      if (!profile) {
        return res.status(400).json({ msg: 'profile not found' });
      }
  
      res.json(profile);
  
    } catch (err) {
      console.log(err.message);
      if (err.kind == 'ObjectId') {
        return res.status(500).send('profile not found');
      }
      res.status(500).send('server error');
    }
  })
  
  
router.delete('/', isLoggedIn, async (req, res) => {
    try {
      //@ todo -remove users posts
    //   await Post.deleteMany({ user: req.user.id });
  
      //remove profile
      await Profile.findOneAndRemove({ user: req.user._id });
      //remove user
      await User.findOneAndRemove({ _id: req.user._id });
  
      res.json({ msg: 'user deleted' });
  
    } catch (err) {
      console.log(err.message);
      res.status(500).send('server error');
    }
  })
  
  




module.exports = router