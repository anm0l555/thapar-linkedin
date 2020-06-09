const router = require('express').Router();
const User = require('../models/usermodel')
const Profile = require('../models/profilemodel')
const isLoggedIn = require('../middleware/authmiddle')
const {check,validationResult} = require('express-validator')



// @route GET all users
router.get('/', async (req,res)=>{
    try {
        const users = await User.find()
        res.json(users)
    } catch (error) {
        res.status(500).send('server error')
    }
})


module.exports = router;