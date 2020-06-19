const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const dateSchema = new Schema({
    user:{
        type:Schema.Types.ObjectId,
        ref:'users'
    },
    firstPreference:[{
        user:{
          type:Schema.Types.ObjectId,
          ref:'users'
        },
        marked:{
          type:Boolean
        },
        noOfSocietiesCommon:{
          type:Number
        }
    }]
})

const Date = mongoose.model('date',dateSchema);

module.exports = Date;
