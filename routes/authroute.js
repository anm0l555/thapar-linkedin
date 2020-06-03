const router = require('express').Router();
const passport = require('passport');


const isLoggedIn = (req, res, next) => {
    if (req.user) {
        next();
    } else {
        res.sendStatus(401);
    }
}

router.get('/login',(req,res)=>{
    res.send('login Page')
})

router.get('/logout',(req,res)=>{
    req.logout();
    res.redirect('/');
})


router.get('/good', isLoggedIn, (req, res) => res.send(`Welcome mr ${req.user.name}!`))


// auth with google +
router.get('/google', passport.authenticate('google', { scope: ['profile', 'email'] }));

// callback route for google to redirect to
// hand control to passport to use code to grab profile info
router.get('/google/callback', passport.authenticate('google', { failureRedirect: '/failed' }),
  function(req, res) {
    // Successful authentication, redirect home.
    res.redirect('/auth/good');
  }
);
module.exports = router;