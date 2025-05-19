const mongoose = require('mongoose');


const userSchema = new mongoose.Schema({
    nombre:{type:String, require:true},
    cedula:Number,
    creadoEn:{type:Date,default:Date.now}
});

module.exports=mongoose.model("User", userSchema)