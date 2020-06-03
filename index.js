const express = require('express')
const connectDB = require('./config/db')
const passport=require('passport')
const authRoutes = require('./routes/authroute')
const passportSetup=require('./config/passportsetup')
const mongoose= require('mongoose')
const cookieSession= require('cookie-session')
const config=require('config')

const app= express();

connectDB();

// define middleware
app.use(express.json({extended:false}));

app.use(cookieSession({
    maxAge:24*60*60*1000 ,
    keys:[config.get('cookieKey')]
}))


//initialize passport
// initialize passport
app.use(passport.initialize());
app.use(passport.session());



//define routes
app.use('/auth',authRoutes);

app.get('/',(req,res)=>{
    res.send('welcome to home page');
})



// setup static files


//setup server
const PORT = process.env.PORT || 5000;

app.listen(PORT ,()=>{
    console.log(`server started on port ${PORT}`)
})