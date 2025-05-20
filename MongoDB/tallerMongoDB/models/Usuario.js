const mongoose = require('mongoose');


const userSchema = new mongoose.Schema({
    Nombre:{type:String, require:true},
    Edad:{type:Number, requiere:true},
    Correo:{type:String, require:true},
    creadoEn:{type:Date,default:Date.now}
});

module.exports=mongoose.model("User", userSchema)