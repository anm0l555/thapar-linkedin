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

router.get('/usernames', async (req,res)=>{
    const users= await Profile.find()
    const usernames = users.map((user)=>{
        return ({
            [user.username]:user.user
        })
    })
    res.json(usernames)
})


module.exports = router;