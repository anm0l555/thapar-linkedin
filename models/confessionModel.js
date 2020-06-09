const mongoose=require('mongoose');
const Schema=mongoose.Schema;

const confessionSchema=new Schema({
    user:{
        type: Schema.Types.ObjectId,
        ref:'users'
    },
    name:{
        type:String,
    },
    text:{
        type:String,
        required:true,
    },
    avatar:{
        type:String
    },
    likes:[{
        user:{
          type:Schema.Types.ObjectId,
          ref:'users'
        }
      }],
    comments:[{
        user:{
          type:Schema.Types.ObjectId,
          ref:'users'
        },
        text:{
          type:String,
          required:true
        },
        name:{
          type:String
        },
        avatar:{
          type:String
        },
        date:{
          type:Date,
          default:Date.now()
        },
        likes:[{
            user:{
              type:Schema.Types.ObjectId,
              ref:'users'
            }
          }]
      }],
    date:{
        type:Date,
        default:Date.now()
      }
})

const Confession=mongoose.model('confession',confessionSchema);

module.exports=Confession;