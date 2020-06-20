const express = require('express');
const Dates = require('../models/dateModel');
const User = require('../models/userModel');
const Profile = require('../models/profilemodel');
const Society = require('../models/SocietiesModel');
const isLoggedIn = require('../middleware/authmiddle');
const { serializeUser } = require('passport');

const router = express.Router();

router.get('/pref', isLoggedIn, async(req,res)=>{
    const user = await Dates.findOne({user: req.user.id});
    const topFiftyPrefs = user.firstPreference.slice(user.send,user.send+50);
    user.send+=50;
    await user.save();
    res.json(topFiftyPrefs);
})

router.get('/datehistory',isLoggedIn,async (req,res)=>{
    const date = await Dates.find ({user : req.user._id})

    res.json( date )
})

router.post('/check' , isLoggedIn , async(req,res)=>{
    const {result} = req.body;

    const userdate= await Dates.findOne({user:req.user._id})
    userdate.swiped++;
    await userdate.save();

    const datesdata = await Dates.findOne({user:result.id})
    datesdata.swipedby++;
    await datesdata.save();
    let ans=false;


    if (result.answer)
    {
        ans = checkDate(req.user._id,result.id , result.answer)
        if (ans)
        {
           return res.json({success:ans })
        }

        else{
            return res.json({success:false})
        }
    }
        res.json({success:false})


})




const checkDate = async (userid , dateid , result) =>{

    //add dateid in the user's ready to date array above
    //if the user has marked the date yes then
    const res=false;
    const userdate= await Dates.findOne({user:userid})

    const datesdata = await Dates.findOne({user:dateid})

    userdate.readytodate.push(dateid);
    await userdate.save();

    if(datesdata.readytodate.indexOf(userid) !== (-1))
    {
        res = true;
        userdate.mutualconnection.push(dateid);
        datesdata.mutualconnection.push(userid);
        await userdate.save();
        await datesdata.save();

        // send notification

    }
    return res

}

module.exports = router;