const express = require('express')
const multer = require('multer')
const router = express.Router()
const User = require('../models/usermodel')
const Profile = require('../models/profilemodel')
const isLoggedIn = require('../middleware/authmiddle')
const {check,validationResult} = require('express-validator')
const {listfiles  , uploadfile , createFolder ,uploadfilevideo ,uploadfiledp} = require('../drive')
const path=require('path')


var storage = multer.diskStorage({   
    destination: function(req, file, cb) { 
       cb(null, './uploads');    
    }, 
    filename: async(req, file, cb) => {

        const profile= await Profile.findOne({user:req.user._id})
        cb(null, `${req.user._id}`)
    }
 });

 var upload = multer({ storage: storage }).single("demo_image");


 var storage2 = multer.diskStorage({   
    destination: function(req, file, cb) { 
       cb(null, './uploadvideo');    
    }, 
    filename: async(req, file, cb) => {

        const profile= await Profile.findOne({user:req.user._id})
        cb(null, `${req.user._id}`)
    }
 });

 var uploadvideo = multer({ storage: storage2 }).single("demo_video");

 var storage3 = multer.diskStorage({   
  destination: function(req, file, cb) { 
     cb(null, './uploaddp');    
  }, 
  filename: async(req, file, cb) => {

      const profile= await Profile.findOne({user:req.user._id})
      cb(null, `${req.user._id}`)
  }
});

var uploaddp = multer({ storage: storage3 }).single("demo_dp");

//=================================
//             User
//=================================


router.post("/image", isLoggedIn ,async (req, res) => {
    console.log("command here")
    upload(req, res, async (err) => {
     if(err) {
         console.log(err)
       res.status(400).send("Something went wrong!");
     }

     console.log("command here2")
    //  res.send('hello');
   });

   const user = await User.findOne({_id:req.user._id})
   const profile = await Profile.findOne({user:user._id})
   uploadfile(user.imgFolder , res , user , profile)
   res.json(profile.images)

 });

 router.post("/video", isLoggedIn ,async (req, res) => {
    console.log("command here")
    uploadvideo(req, res, async (err) => {
     if(err) {
         console.log(err)
       res.status(400).send("Something went wrong!");
     }

     console.log("command here2")
    //  res.send('hello');
   });

   const user = await User.findOne({_id:req.user._id})
   const profile = await Profile.findOne({user:user._id})
   uploadfilevideo('11ECJIBXPTqhQphf4vSE3Jz_Rw5TGKEsS' , res , user , profile)
   res.json(profile.video)

 });


 router.post("/dp", isLoggedIn ,async (req, res) => {
  console.log("command here")
  uploaddp(req, res, async (err) => {
   if(err) {
       console.log(err)
     res.status(400).send("Something went wrong!");
   }

   console.log("command here2")
  //  res.send('hello');
 });

let user = await User.findOne({_id:req.user._id})
 const profile = await Profile.findOne({user:user._id})
 uploadfiledp('1f_BcwXmFxpnc0me4Af4CCg6GR7Fw6D6L' , res , user , profile)
user = await User.findOne({_id:req.user._id})
 res.json(user)

});


module.exports = router