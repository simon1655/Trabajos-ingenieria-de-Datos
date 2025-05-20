const express=require("express")
const router=express.Router();
const User= require("../models/Usuario")

//Registrar un usuario
router.post("/", async(req,res)=>{
    
try{
const user = new User(req.body);
await user.save();
   res.status(201).json(user);
}catch(error){
    res.status(400).json({error:error.message})
}
});

//Consultar todos los usuarios

router.get("/", async(req,res)=>{
try{
    const user = await User.find();
    res.json(user);


}catch(error){
    res.status(500).json({error:error.message})
}

});

//Consultar usuario por id
router.get("/:id", async(req,res)=>{

try{
    const user = await User.findById(req.params.id);
    if (!user ) return res.status(404).json({error : "Producto No Encontrado"})
    res.json(user);


}catch(error){
    res.status(500).json({error:error.message})
}

});
//modificar datos del usuario


router.put("/:id", async(req,res)=>{

try{
    const user = await User.findByIdAndUpdate(req.params.id, req.body, {new:true});
    if (!user ) return res.status(404).json({error : "Producto No Encontrado"})
    res.json(user);


}catch(error){
    res.status(500).json({error:error.message})
}

});
//eliminar un usuario



router.delete("/:id", async(req,res)=>{

try{
    const user = await User.findByIdAndDelete(req.params.id);
    if (!user ) return res.status(404).json({error : "Producto No Encontrado"})
    res.json(user);


}catch(error){
    res.status(500).json({error:error.message})
}

});


// Ruta con parámetro de edad mínimo
router.get("/edad/:Edad", async (req, res) => {
  try {
    const Edad = parseInt(req.params.Edad);
    if (isNaN(Edad)) {
      return res.status(400).json({ error: "La edad mínima no es válida" });
    }

    const users = await User.find({ Edad: { $gte: Edad } });
    res.status(200).json(users);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Añade el campo activo: true a todos los usuarios con edad mayor o igual 
router.put("/activar-mayores/:Edad", async (req, res) => {
  try {
    const edad = parseInt(req.params.Edad);
    const resultado = await User.updateMany(
      { edad: { $gte: edad } },     // Filtro
      { $set: { activo: true } }  // Campo a agregar o actualizar
    );

    res.json({
      mensaje: "Usuarios actualizados correctamente",
      modificados: resultado.modifiedCount
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


module.exports=router;