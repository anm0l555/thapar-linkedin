const mongoose = require('mongoose')

const userSchema = new mongoose.Schema(
    {
        name: {
            type: String,
            required: true
        },
        email:{
            type: String,
            unique: true,
            trim: true,
            minlength: 1
        },
        password:{
            type:String,
            trim:true,
        },

        googleId:{
            type: String,
            // unique: true,
            trim: true,
            minlength: 1
        },
        phone:{
            type:Number,
            // unique:true,
            minlength:10,
            maxlength:10
        },
        imgFolder:{
            type:String
        },
        profilePicture:{
            id:{type:String},
            link:{type:String},
            date:{type:Date , default :Date.now()}
        }

    }
)

const User = mongoose.model('users', userSchema);
module.exports = User;
