const passport=require('passport');
const FacebookStrategy=require('passport-facebook');
const UserFB=require('../models/usermodelFB');
const dotenv=require('dotenv');

dotenv.config({
    path:'./.env'
})

passport.use(new FacebookStrategy({
    clientID: process.env.FB_CLIENTID,
    clientSecret: process.env.FB_CLIENTSECRET,
    callbackURL: "http://localhost:5000/auth/facebook/callback"
},(accessToken, refreshToken, profile, cb)=>{
    
}))
