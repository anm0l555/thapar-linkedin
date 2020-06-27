const express = require('express');
const router = express.Router();
const isLoggedIn = require("../middleware/authmiddle");
const User = require('../models/usermodel');
const { check, validationResult } = require('express-validator');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const dotenv = require ('dotenv');
dotenv.config()



//@route  GET api/auth/
//@desc   Test route
//@access Public

router.get('/', isLoggedIn , async (req, res) => {
  try {
    //another way to leave of the password
    const user = await User.findById(req.user._id).select('-password');
    res.json(user);
  } catch (err) {
    console.log(err.message);
    res.status(500).send('Server error');
  }
});



//@route  POST api/auth/
//@desc   Authenticate user and get token
//@access Public
//login

router.post(
  '/',
  [//name removeed as not needed while signin
    check('email', 'please include a valid email').isEmail(),
    check('password', 'password is required').exists()//instead of checking the length we will check whether it exists or not
  ],
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { email, password } = req.body;

    try {
      //see if the user exits
      let user = await User.findOne({ email: email });
      //now check if the user does not exist 
      if (!user) {
        return res
          .status(400)
          .json({ errors: [{ msg: 'invalid credentials' }] }); // this format uses to have the error message in the same format as above
      }
      //Get users garvatar

      //now we  dont need the avatar

      // now we don;t need to create a user but not save it

      //verify the password
      const isMatch = await bcrypt.compare(password, user.password);
      if (!isMatch) {
        return res
          .status(400)
          .json({ errors: [{ msg: 'invalid credentials' }] });
      }
      //Return jsonwebToken
      const payload = {
        user: {
          _id: user._id
        }
      }
      jwt.sign(payload, process.env.JWTTOKEN, (err, token) => {
        if (err) throw err;
        else {
          res.json({ token });
        }
      }); //generally kept 3600 ie 1hr but as now testing it is kept more change it before deployment


    } catch (err) {
      console.log(err.message);
      res.status(500).send('server error');
    }

  }
);








//@route  POST api/users/
//@desc   Register user
//@access Public
//register

router.post(
    '/create',
    [
      check('name', 'Name is required')
        .not()
        .isEmpty(),
      check('email', 'please include a valid email').isEmail(),
      check('password', 'please include a valid password').isLength({ min: 6 })
    ],
    async (req, res) => {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
      }
  
      const { name, email, password } = req.body;
  
      try {
        //see if the user exits
        let user = await User.findOne({ email: email });
        if (user) {
          return res
            .status(400)
            .json({ errors: [{ msg: 'user already exists' }] }); // this format uses to have the error message in the same format as above
        }

        // create a user but not save it
        user = new User({
          name: name,
          email: email,
          password: password
        });
        //Encrypt password
        const salt = await bcrypt.genSalt(10);
        user.password = await bcrypt.hash(password, salt);
        //save the user
        await user.save();
        //Return jsonwebToken
        const payload = {
          user: {
            _id: user._id
          }
        }
        jwt.sign(payload, process.env.JWTTOKEN, (err, token) => {
          if (err) throw err;
          else {
            res.json({ token });
          }
        }); //generally kept 3600 ie 1hr but as now testing it is kept more change it before deployment
  
  
      } catch (err) {
        console.log(err);
        res.status(500).send('server error');
      }
  
    }
  );
  







module.exports = router;