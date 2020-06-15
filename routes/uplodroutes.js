const express = require('express')
const multer = require('multer')
const router = express.Router()
const User = require('../models/usermodel')
const Profile = require('../models/profilemodel')
const isLoggedIn = require('../middleware/authmiddle')
const {check,validationResult} = require('express-validator')
const {listfiles  , uploadfile , createFolder} = require('../drive')

var storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads/')
    },
    filename: async(req, file, cb) => {

        const profile= await Profile.findOne({user:req.user._id})
        cb(null, `${req.user._id}_${profile.images.length() +1}`)
    },
    fileFilter: (req, file, cb) => {
        const ext = path.extname(file.originalname)
        if (ext !== '.mp4') {
            return cb(res.status(400).end('only jpg, png, mp4 is allowed'), false);
        }
        cb(null, true)
    }
})
var upload = multer({ storage: storage }).single("file")


router.post('/image' ,isLoggedIn, (req,res)=>{

        upload(req, res, err => {
        if (err) {
            console.log(err);
            return res.json({ success: false, err })
        }

        const user = await User.findOne({_id:req.user._id})
        const Profile = await Profile.findOne({user:user._id})
        uploadfile(user.imgFolder , res , user , profile)

        return res.json({ success: true, filePath: res.req.file.path, fileName: res.req.file.filename })
    })

})
