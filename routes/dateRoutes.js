const express = require('express');
const Dates = require('../models/dateModel');
const User = require('../models/userModel');
const Profile = require('../models/profilemodel');
const Society = require('../models/SocietiesModel');
const isLoggedIn = require('../middleware/authmiddle');

const router = express.Router();

// POST '/date'
// PRIVATE
// posts the array of first and second dating preferences for a user (should run automatically when user logs in for the first time)
router.get('/', isLoggedIn, async(req,res)=>{
    let {year,gender,societies} = await Profile.findOne({user:req.user.id});
    //gender = gender.toLowerCase();
    let oppGender;
    if(gender=='male')
        oppGender='female';
    else if(gender=='female')
        oppGender='male';
   
        let persons = await Profile.find({gender:oppGender});
        const inSameYear = persons.filter(person=>{
            return person.year===year
        });
        let p1 = [];
        let p2 = [];
        if(societies.length!==0)
        {
            societies.forEach(society=>{
                const soci = await Society.findOne({name:society.name});
                soci.members.forEach(member=>{
                    if ((member.gender==oppGender) && (member.year==year))
                    {
                        let result = false;
                        if(p1.length!==0)
                        {
                            p1.forEach(pref=>{
                                if(pref.user.toString()==member.user.toString())
                                {
                                    pref.noOfSocietiesCommon++;
                                    result=true;
                                    break;
                                }
                            })
                        }
                        if(!result)
                        {
                            p1.push({
                                user: member.user,
                                marked:false,
                                noOfSocietiesCommon:1
                            })
                        }
                    }
                })
            })
        }
            inSameYear.forEach(person=>{
                let result=false;
                p1.forEach(pref=>{
                    if(pref.user.toString()==person.user.toString())
                    {
                        result = true;
                    }
                })
                if(!result)
                {
                    p2.push({
                        user:person.user,
                        marked:false,
                        noOfSocietiesCommon:0
                    })
                }
            })

            var preferences = p1.concat(p2);

            new Date({
                user:req.user.id,
                firstPreference:preferences
            }).save().then((date)=>{
                res.json(date);
            })
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