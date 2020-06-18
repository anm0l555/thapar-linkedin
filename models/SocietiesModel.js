const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const SocietySchema = new Schema({
    AdventureClub:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    CCS:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    Owasp:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    Saturnalia:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    Virsa:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    Spades:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    Urja:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    ToastMasters:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    ThaparModelUnitedNations:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    MSC:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    LiterarySociety:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    Mudra:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    ECON:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    EDC:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    Enactus:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    FineArtsPhotographySociety:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    IETE:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    IndianSocietyForTechnicalEducation:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    TAAS:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    Pratigya:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    ParyavaranWelfareSociety:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    SocietyOfMechanicalAndIndustrialEngineers:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }],
    SpicMacay:[{
        user:{
            type: Schema.Types.ObjectId,
            ref:'users'
        },
        year:{
            type:Number
        },
        gender:{
            type:String
        }
    }]
})

const Society = mongoose.model('society',SocietySchema);

module.exports = Society;
