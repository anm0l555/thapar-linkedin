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
          type:Boolean,
          default:false

        },
        noOfSocietiesCommon:{
          type:Number,
          default:0
        }
    }],
    send:{
      type:Number, 
      default:0
    },
    readytodate:[Schema.Types.ObjectId],
    mutualconnection:[Schema.Types.ObjectId],
    swiped:{
      type:Number,
      default:0
    },
    swipedby:{
      type:Number,
      default:0
    }
})

const Dates = mongoose.model('date',dateSchema);

module.exports = Dates;
;