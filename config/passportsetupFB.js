const passport=require('passport');
const FacebookStrategy=require('passport-facebook');
const UserFB=require('../models/usermodelFB');
const dotenv=require('dotenv');

dotenv.config()

passport.serializeUser((user,cb)=>{
    cb(null,user.id)
})

passport.deserializeUser((id,cb)=>{
    UserFB.findById(id).then((user)=>{
        cb(null,user);
    })
})

passport.use(new FacebookStrategy({
    clientID: process.env.FB_CLIENTID,
    clientSecret: process.env.FB_CLIENTSECRET,
    callbackURL: "http://localhost:5000/auth/facebook/callback",
    profileFields: ['id', 'displayName', 'email']
  },(accessToken, refreshToken, profile, cb)=>{
    UserFB.findOne({facebookId:profile.id}).then((currentUser)=>{
        if(currentUser)
        {
            console.log('user retrieved from db: '+currentUser);
            cb(null, currentUser);
        }
        else
        {
            new UserFB({
                name:profile.displayName,
                facebookId:profile.id,
                email:profile._json.email
            }).save().then((newUser)=>{
                console.log('new user saved to db: '+newUser)
                cb(null, newUser)
            })
        }
    })
}))
