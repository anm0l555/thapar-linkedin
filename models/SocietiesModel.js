const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const SocietySchema = new Schema({
    name:{
        type:String,
        required:true
    },
    members:[
        {
            user:{
                type:Schema.Types.ObjectId,
                ref:'users'
            },
            gender:{
                type:String
            },
            year:{
                type:Number
            }
        }
    ]
})

const Society = mongoose.model('society',SocietySchema);

module.exports = Society;
