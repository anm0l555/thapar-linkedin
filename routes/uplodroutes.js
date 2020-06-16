const express = require('express')
const multer = require('multer')
const router = express.Router()
const User = require('../models/usermodel')
const Profile = require('../models/profilemodel')
const isLoggedIn = require('../middleware/authmiddle')
const {check,validationResult} = require('express-validator')
const {listfiles  , uploadfile , createFolder} = require('../drive')
const path=require('path')

// var storage = multer.diskStorage({
//     destination: (req, file, cb) => {
//         cb(null, 'uploads/')
//     },
//     filename: async(req, file, cb) => {

//         const profile= await Profile.findOne({user:req.user._id})
//         cb(null, `${req.user._id}_${profile.images.length() +1}`)
//     },
//     fileFilter: (req, file, cb) => {
//         const ext = path.extname(file.originalname)
//         if (ext !== '.jpg' ||ext !== '.png') {
//             return cb(res.status(400).end('only jpg, png, mp4 is allowed'), false);
//         }
//         cb(null, true)
//     }
// })
// var upload = multer({ storage: storage }).single("file")


// router.post('/image' ,isLoggedIn, async(req,res)=>{


//     console.log('command here',req.user)
//         upload(req, res, err => {
//         if (err) {
//             console.log(err);
//             return res.json({ success: false, err })
//         }
//         // const user = await User.findOne({_id:req.user._id})
//         // const Profile = await Profile.findOne({user:user._id})
//         // uploadfile(user.imgFolder , res , user , profile)

//         return res.json({ success: true, filePath: res.req.file.path, fileName: res.req.file.filename })
//     })

// })




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
module.exports = router