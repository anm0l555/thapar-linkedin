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

module.exports = router;