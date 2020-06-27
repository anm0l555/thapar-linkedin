const Dates = require('../models/dateModel');
const Profile = require('../models/profilemodel');
const Society = require('../models/SocietiesModel');

//finds the preferences for the newly registered user and stores them. Runs for the new user when they register.
const sortPrefCurrentUser = async(id,years)=>{
    let {gender,societies} = await Profile.findOne({user:id});
    //gender = gender.toLowerCase();
    let oppGender;
    if(gender=='male')
        oppGender='female';
    else if(gender=='female')
        oppGender='male';
    
    let areSocieties; 
    if(societies.length!==0)
        areSocieties=true;
    else
        areSocieties=false;

    years.forEach(async(year)=>{let persons = await Profile.find({gender:oppGender,year});
    
    let p1 = [];
    let p2 = [];
    if(areSocieties)
    {
        societies.forEach(async(society)=>{
            const soci = await Society.findOne({name:society.name});
            soci.members.forEach(async member=>{
                if ((member.gender==oppGender) && (member.year==year))
                {
                    let result = false;
                    if(p1.length!==0)
                    {
                        p1.forEach(async pref=>{
                            if(pref.user.toString()==member.user.toString())
                            {
                                pref.noOfSocietiesCommon++;
                                result=true;
                                // break;

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
    persons.forEach(async person=>{
        let result=false;
        p1.forEach(async pref=>{
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
    const currentUserDates = await Dates.findOne({user:id});
    if(currentUserDates)
    {
        currentUserDates.firstPreference.push(preferences);
        await currentUserDates.save();
    }
    else if(!currentUserDates)
    {
        await new Dates({
            user:id,
            firstPreference:preferences
        }).save();
    }
    })
}

//updates the preference array of all the other users when a new user registers. Pass in the id, year, the gender opposite to the new user in this function.
//need to create a new property in the dateModel preferences array object: 'year' which would hold the year of the preference
//needs to be called after the new user has registered and their preferences array has been formed and saved in the db
//ideal place to call - create profile route. At the end, before sending the response
const sortPrefAllOthers = async(id,year,oppGender) =>{
    const newUserDates = await Dates.findOne({user:id});
    const usersToUpdate = await Profile.find({gender:oppGender});
    usersToUpdate.forEach(async(userToUpdate)=>{
        const currentUserDates= await Dates.findOne({user:userToUpdate.user}); 
        const cuinup= newUserDates.firstPreference.find(preference=>preference.user==userToUpdate.user); //cuinup= Current user in new user's preference array
        let i = currentUserDates.firstPreference.findIndex(preference=>{
            return (preference.noOfSocietiesCommon==cuinup.noOfSocietiesCommon && preference.year==year)
        })
        currentUserDates.firstPreference.splice(i,0,{
            user:id,
            maked:false,
            noOfSocietiesCommon:cuinup.noOfSocietiesCommon,
            year
        });
        await currentUserDates.save();
    })
}

module.exports = {
    sortPrefAllOthers,
    sortPrefCurrentUser
}