const mongoose = require('mongoose')
const Schema = mongoose.Schema

// .Types.interests and prefferences still left to add

const ProfileSchema = new Schema({
    user:{
        type: Schema.Types.ObjectId,
        ref:'users'
    },
    username:{
        type:String,
        unique:true
    },
    bio: {
        type: String
    },
    gender: {
        type: String,
        required:true
    },
    year:{
        type:Number,
        required:true
    },
    branch: {
        type: String
    },
    city: {
        type: String
    },
    DoB: {
        type: Date
    },

    relationship:{

        status:{type:String ,  required:true},

        spouse:{
            type:Schema.Types.ObjectId,
            ref:'users'
        }

    },

    images:[
        {
            id:{type : String},
            link:{ type : String},
            date:{type:Date , default:Date.now()},
            caption:{type:String}
        }
    ],
    societies:[
        {
            name:{ type : String},
            Position:{ type : String},
        }
    ]

});

module.exports = Profile = mongoose.model('profile', ProfileSchema);