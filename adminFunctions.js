const Dates = require('./models/dateModel');
const Profile = require('./models/profilemodel');
const Society = require('./models/SocietiesModel');

/*
const sortPreferences = async(req)=>{
    let {year,gender,societies} = await Profile.findOne({user:req.user.id});
    //gender = gender.toLowerCase();
    let oppGender;
    if(gender=='male')
        oppGender='female';
    else if(gender=='female')
        oppGender='male';
   
    let persons = await Profile.find({gender:oppGender,year});
    
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
    persons.forEach(person=>{
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

    let preferences = p1.concat(p2);

    preferences.sort(function(pref1, pref2){
        return pref2.noOfSocietiesCommon-pref1.noOfSocietiesCommon;
    })

    new Dates({
        user:req.user.id,
        firstPreference:preferences
    }).save().then((date)=>{
        res.json(date);
    })
}*/


const sortPreferences = async(req) =>{
    const currentUser = await Profile.findOne({user:req.user.id});
    let oppGen;
    if(currentUser.gender=='male')
        oppGen='female';
    else if(currentUser.gender=='female')
        oppGen='male';
   
    const usersToUpdate = await Profile.find({year:currentUser.year, gender:oppGen});
    usersToUpdate.push(currentUser);
    usersToUpdate.forEach(userToUpdate=>{
        //let {year,gender,societies} = await Profile.findOne({user:userToUpdate.user});
        //gender = gender.toLowerCase();
        let oppGender;
        if(userToUpdate.gender=='male')
            oppGender='female';
        else if(userToUpdate.gender=='female')
            oppGender='male';
   
        let persons = await Profile.find({gender:oppGender,year:userToUpdate.year});
    
        let p1 = [];
        let p2 = [];
        if(userToUpdate.societies.length!==0)
        {
            userToUpdate.societies.forEach(society=>{
                const soci = await Society.findOne({name:society.name});
                soci.members.forEach(member=>{
                    if ((member.gender==oppGender) && (member.year==userToUpdate.year))
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
        persons.forEach(person=>{
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

        let preferences = p1.concat(p2);

        preferences.sort(function(pref1, pref2){
            return pref2.noOfSocietiesCommon-pref1.noOfSocietiesCommon;
        })

        const datePrefOfUser = await Dates.findOne({user:userToUpdate.user})

        if(!datePrefOfUser)
        {
           await new Dates({
                    user:req.user.id,
                    firstPreference:preferences
                }).save()
        }
        else
        {
            datePrefOfUser.firstPreference = preferences;
            await datePrefOfUser.save()
        }    
    })
}

module.exports = {
    sortPreferences
}