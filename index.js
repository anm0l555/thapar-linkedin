const express = require('express')
const connectDB = require('./config/db')
const passport=require('passport')
const cors = require('cors')
const authRoutes = require('./routes/authroute')
const profileRoutes= require('./routes/profileroutes')
const userRoutes= require('./routes/userroutes')
const uploadRoutes = require('./routes/uplodroutes')
const confessionRoutes=require('./routes/confessionRoutes');
const societyRoutes = require('./routes/societyroutes')
const passportSetup=require('./config/passportsetup')

//Fb passport setup
const passportSetupFB=require('./config/passportsetupFB');
const cookieSession= require('cookie-session')
const app= express();
require('dotenv').config()
app.use(cors())
connectDB();

// define middleware
app.use(express.json({extended:false}));

app.use(cookieSession({
    maxAge:24*60*60*1000 ,
    keys:[`${process.env.COOKIEKEY}`]
}))


//initialize passport
// initialize passport
app.use(passport.initialize());
app.use(passport.session());


//define routes
app.use('/auth',authRoutes);
app.use('/profile',profileRoutes);
app.use('/user',userRoutes);
app.use('/confess',confessionRoutes);
app.use('/upload',uploadRoutes);
app.use('/society',societyRoutes);


app.get('/',(req,res)=>{
    res.send('welcome to home page');
})



// setup static files


//setup server
const PORT = process.env.PORT || 5000;

app.listen(PORT ,()=>{
    console.log(`server started on port ${PORT}`)
})