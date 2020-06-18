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
        }
    }],
    secondPreference:[{
        user:{
          type:Schema.Types.ObjectId,
          ref:'users'
        }
    }]
})

const Date = mongoose.model('date',dateSchema);

module.exports = Date;
