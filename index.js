const express = require('express')
const connectDB = require('./config/db')

const app= express();

connectDB();

// define middleware
app.use(express.json({extended:false}));

//define routes




// setup static files


//setup server
const PORT = process.env.PORT || 5000;

app.listen(PORT ,()=>{
    console.log(`server started on port ${PORT}`)
})