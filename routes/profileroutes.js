const router = require('express').Router();
const User = require('../models/usermodel')
const Profile = require('../models/profilemodel')
const isLoggedIn = require('../middleware/authmiddle')
const {check,validationResult} = require('express-validator')
const {listfiles  , uploadfile , createFolder} = require('../admin/drive')
const Society = require('../models/SocietiesModel');
const Dates = require('../models/jobModel');
//const {sortPrefAllOthers,sortPrefCurrentUser} = require('../admin/adminFunctions')
const {sortPrefAllOthers,sortPrefCurrentUser} = require('../admin/playground')
//@route GET api/profile/me
//@desc GET indivisual Profile
//@access Private

router.get('/me',isLoggedIn , async(req,res)=>{
    try {
        const profile = await Profile.findOne({user: req.user._id}).populate ('user',[])

        if (!profile)
        {
            return res.status(400).json({ msg: 'there is no profile for this user' });
        }

        res.json(profile);

    } catch (err) {
        console.log(err.message);
        res.status(500).send('server error');
    }
})

//@route POST api/profile
//@desc create or update a profile
//@access Private

router.post ('/' , [isLoggedIn ,[
    check('gender' , "Gender is required").not().isEmpty(),
    check('year' , "Year is required").not().isEmpty(),
]], async (req,res)=>{

    const errors=validationResult(req);
    if (!errors.isEmpty())
    {
        console.log(errors)
        return res.status(400).json({ errors: errors.array() })
    }

    const {
        username ,
        bio,gender,year , branch , city , DoB , status , spouse , societies ,music,hobbies,sports,books,cars, shows,dreamDestination

    } = req.body;

    const profileFields={};
    let interests={};
    profileFields.user =  req.user._id
    if(username) profileFields.username= username.trim();
    if(bio) profileFields.bio=bio.trim()
    if(gender) profileFields.gender=gender.trim()
    if(year) profileFields.year=year.trim()
    if(branch) profileFields.branch=branch.trim()
    if(city) profileFields.city=city.trim()
    if(DoB) profileFields.DoB=DoB
    if (societies) profileFields.societies= societies
    if (music) interests.music=music
    if(hobbies) interests.hobbies=hobbies
    if(sports) interests.sports=sports
    if(books) interests.books = books
    if(cars) interests.cars=cars
    if (shows) interests.shows=shows
    if(dreamDestination) interests.dreamDestination=dreamDestination

    if(interests) profileFields.interests=interests


    if (societies)
    {
      societies.forEach(async(society)=>{
        var name=society.name;
        // console.log(name)
        let soci = await Society.findOne({name})

        if (!soci)
        {
          console.log('entered here')
          soci =new Society({name , members:[]});

          await soci.save();
          soci = await Society.findOne({name})
          console.log(soci)

        }
        // console.log(soci.members.filter(person => person.user === req.user._id ))

        const result = (soci.members.filter(person => person.user.toString() === req.user._id.toString() ).length === 0)
        // console.log(result)
        if(result)
        {
          
          const newperson = {user:req.user._id , gender:gender , year:year}
          soci.members.push(newperson)
          await soci.save();
        }

      })
    }


    profileFields.relationship={};
    if(status) profileFields.relationship.status=status.trim()
    if(bio) profileFields.relationship.spouse=spouse

    console.log(profileFields)
    try {
        let profile = await Profile.findOne({user:req.user._id})
        console.log(profile)
        if (profile)
        {
            profile= await Profile.findOneAndUpdate(
                {user:req.user._id},
                {$set:profileFields},
                {new:true}
                );
                return res.json(profile);
        }

        profile = await new Profile(profileFields).save();
        createFolder(profile.user)

        if(year==1)
        {
          const years= [1,2,3,4];
          await sortPrefCurrentUser(req.user.id,years);
        }
        else if (year==2)
        {
          const years= [2,1,3,4];
          await sortPrefCurrentUser(req.user.id,years);
        }
        else if(year==3)
        {
          const years= [3,2,4,1];
          await sortPrefCurrentUser(req.user.id,years);
        }
        else if(year==4)
        {
          const years= [4,3,2,1];
          await sortPrefCurrentUser(req.user.id,years);
        }
        
        let oppgender = profileFields.gender == 'male' ? 'female' : 'male';

        await sortPrefAllOthers(req.user.id, year, oppgender)
        //const {preferences, oppGender}=sortPrefCurrentUser(req.user.id);
        
        /*await new Dates({
          user:req.user.id,
          firstPreference:preferences
        }).save();

        sortPrefAllOthers(profileFields.year,oppGender);*/

        res.json(profile)



    } catch (error) {
        console.log(error.message)
        res.status(600).send('server error');
    }

})

// GET all profiles

router.get('/', async (req, res) => {
    try {
      let profiles = await Profile.find().populate('user', ['name'])
      res.json(profiles);
  
    } catch (err) {
      console.log(err.message);
      res.status(500).send('server error');
    }
  })


//@route  GET api/profile/user/:user_id
//@desc   GET profile by user id
//@access Public

router.get('/user/:user_id', async (req, res) => {
    try {
      let profile = await Profile.findOne({ user: req.params.user_id }).populate('user', []);
      if (!profile) {
        return res.status(400).json({ msg: 'profile not found' });
      }
  
      res.json(profile);
  
    } catch (err) {
      console.log(err.message);
      if (err.kind == 'ObjectId') {
        return res.status(500).send('profile not found');
      }
      res.status(500).send('server error');
    }
  })
  
  
router.delete('/', isLoggedIn, async (req, res) => {
    try {
      //@ todo -remove users posts
    //   await Post.deleteMany({ user: req.user.id });
  
      //remove profile
      await Profile.findOneAndRemove({ user: req.user._id });
      //remove user
      await User.findOneAndRemove({ _id: req.user._id });
  
      res.json({ msg: 'user deleted' });
  
    } catch (err) {
      console.log(err.message);
      res.status(500).send('server error');
    }
  })
  
  




module.exports = router