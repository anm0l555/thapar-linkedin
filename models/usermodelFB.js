const mongoose=require('mongoose');
const Schema=mongoose.Schema();

const userschemaFB= new Schema({
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
        facebookId:{
            type: String,
            unique: true,
            trim: true,
            minlength: 1
        },
        phone:{
            type:Number,
            unique:true,
            minlength:10,
            maxlength:10
        }
})

const UserFB=mongoose.model('fbuser',userSchemaFB);

module.exports=UserFB;
