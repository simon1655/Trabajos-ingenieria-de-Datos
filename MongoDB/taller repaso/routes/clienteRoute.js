const express=require("express")
const router=express.Router();
const User= require("../models/Cliente")

//Registrar un producto
router.post("/", async(req,res)=>{
    
try{
const user = new User(req.body);
await user.save();
   res.status(201).json(user);
}catch(error){
    res.status(400).json({error:error.message})
}
});

//Consultar todos los productos

router.get("/", async(req,res)=>{
try{
    const user = await User.find();
    res.json(user);


}catch(error){
    res.status(500).json({error:error.message})
}

});

//Consultar producto por id
router.get("/:id", async(req,res)=>{

try{
    const user = await User.findById(req.params.id);
    if (!user ) return res.status(404).json({error : "Producto No Encontrado"})
    res.json(user);


}catch(error){
    res.status(500).json({error:error.message})
}

});
//modificar datos del producto


router.put("/:id", async(req,res)=>{

try{
    const user = await User.findByIdAndUpdate(req.params.id, req.body, {new:true});
    if (!user ) return res.status(404).json({error : "Producto No Encontrado"})
    res.json(user);


}catch(error){
    res.status(500).json({error:error.message})
}

});
//eliminar un producto



router.delete("/:id", async(req,res)=>{

try{
    const user = await User.findByIdAndDelete(req.params.id);
    if (!user ) return res.status(404).json({error : "Producto No Encontrado"})
    res.json(user);


}catch(error){
    res.status(500).json({error:error.message})
}

});



module.exports=router;