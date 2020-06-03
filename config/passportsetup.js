const passport= require('passport')
const GoogleStrategy = require('passport-google-oauth20').Strategy
const config = require('config')
const google = config.get('google')
const mongoose = require('mongoose');
const User = require('../models/usermodel')

// console.log(google.clientId)

passport.use(new GoogleStrategy({
    clientID: google.clientId,
    clientSecret: google.clientsecret,
    callbackURL: "/auth/google/redirect"
  },
  async  function(accessToken, refreshToken, profile, done) {

    console.log(profile)
    const user = await User.findOne({googleId:profile.id})

    if (user)
    {
        console.log(user);
        done(null ,user)
    }
    else{
        const nuser = await new User ({
            name:profile.displayName,
            googleId:profile.id,
        }).save()
        console.log(profile)
        done(null ,nuser)
    }

  }
));

passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser((id, done) => {
    User.findById(id).then((user) => {
        done(null, user);
    });
});