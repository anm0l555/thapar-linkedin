const router = require('express').Router();
const User = require('../models/usermodel')
const Profile = require('../models/profilemodel')
const Society = require('../models/SocietiesModel');




router.get('/all',async(req,res)=>{

    try {
        
    const data = await  Society.find();
    res.json(data);
    } catch (error) {
        res.status(500).json(error.message)
    }
})


module.exports = router
