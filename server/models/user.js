const mongoose = require('mongoose')
const { Schema } = mongoose;

const userSchema = new Schema({
    
    name:
        String,
    email:
        String,
    password:
        String,
    address:{
        type:String,
        default:'',
    },
    type:{
        type:String,
        default:'user'
    }
    //cart
    })

module.exports = mongoose.model("User",userSchema)