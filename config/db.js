const mongoose = require('mongoose')
const config = require('config')

const db = config.get('mongoURI');

mongoose.Promise = global.Promise

const connectDB= async ()=> {
     try {
         await mongoose.connect(db);
         console.log('Mongo db connected')

     } catch (error) {
         console.log(e.message)
         process.exit(1);
     }
}

module.exports = connectDB;