const express = require('express');
const Date = require('../models/dateModel');
const User = require('../models/userModel');
const Profile = require('../models/profilemodel');
const Society = require('../models/SocietiesModel');
const isLoggedIn = require('../middleware/authmiddle');

const router = express.Router();

// POST '/date'
// PRIVATE
// posts the array of first and second dating preferences for a user (should run automatically when user logs in for the first time)
router.post('/', isLoggedIn, async(req,res)=>{
    let {year,gender,societies} = await Profile.findOne({user:req.user.id});
    //gender = gender.toLowerCase();
    if(gender == 'male')
    {
        let females = await Profile.find({gender:'female'});
        const inSameYear = females.filter(female=>{
            return female.year===year
        });
        let p1 = [];
        let p2 = [];
        if(societies.length!==0)
        {
            societies.forEach(society=>{
                const soci = await Society.findOne({name:society.name});
                soci.members.forEach(member=>{
                    if (member.gender=='female' && member.year==year)
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
            inSameYear.forEach(female=>{
                let result=false;
                p1.forEach(pref=>{
                    if(pref.user.toString()==female.user.toString())
                    {
                        result = true;
                    }
                })
                if(!result)
                {
                    p2.push({
                        user:female.user,
                        marked:false
                    })
                }
            })
            new Date({
                user:req.user.id,
                firstPreference:p1,
                secondPreference:p2
            }).save().then((date)=>{
                res.json(date);
            })
        }
        else
        {
            p1 = inSameYear.map(female=>{
                return {
                    user:female.user,
                    marked:false,
                    noOfSocietiesCommon:0
                }
            })
            new Date({
                user:req.user.id,
                firstPreference:p1,
                secondPreference:[]
            }).save().then((date)=>{
                res.json(date);
            })
        }
    }
    else
    {
        let males = await Profile.find({gender:'male'});
        const inSameYear = females.filter(male=>{
            return male.year===year
        });
        let p1 = [];
        let p2 = [];
        if(societies.length!==0)
        {
            societies.forEach(society=>{
                const soci = await Society.findOne({name:society.name});
                soci.members.forEach(member=>{
                    if (member.gender=='male' && member.year==year)
                    {
                        let result = false;
                        if(p1.length!==0)
                        {
                            p1.forEach(pref=>{
                                if(pref.user.toString()==member.user.toString())
                                {
                                    pref.noOfSocietiesCommon++;
                                    result=true;
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
            inSameYear.forEach(male=>{
                let result=false;
                p1.forEach(pref=>{
                    if(pref.user.toString()==male.user.toString())
                    {
                        result = true;
                    }
                })
                if(!result)
                {
                    p2.push({
                        user:male.user,
                        marked:false
                    })
                }
            })
            new Date({
                user:req.user.id,
                firstPreference:p1,
                secondPreference:p2
            }).save().then((date)=>{
                res.json(date);
            })
        }
        else
        {
            p1 = inSameYear.map(male=>{
                return {
                    user:male.user,
                    marked:false,
                    noOfSocietiesCommon:0
                }
            })
            new Date({
                user:req.user.id,
                firstPreference:p1,
                secondPreference:[]
            }).save().then((date)=>{
                res.json(date);
            })
        }
    }
}) 

module.exports = router;