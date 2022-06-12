const mongoose = require('mongoose')
const { Schema } = mongoose;

const productSchema = new Schema({
    name:{
        type: String,
        required: true
    },
    description:{
        type:String,
        required:true
    },
    images:[
        {
            type:String,
            required:true
        }
    ],
    quantity:{
        type:Number,
        required:true
    },
    price:{
        type:Number,
        required:true
    },
    category:{
        type:String,
        required:true
    },
    // can add userId so save the id of the admin which sold the current product
})

const Product = mongoose.model("Product", productSchema)
module.exports = Product