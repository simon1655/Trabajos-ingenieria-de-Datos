Router.post('/', async(req,res)=>{
    try{
    const item=await Item.find();
    res.json(items);
    }catch(error){
    res.status(500).json({error: error.message});
    }
    });
    
    //consultar por ID
    Router.get('/: id', async(req,res)=>{
      try{
      const item=await Item.findById(req.params.id);
      if (item)return res.status(404);
      res.json(items);
      }catch(error){
      res.status(500).json({error: error.message});
      }
      });
      //actualizar datos del producto
    Router.put('/: id', async(req,res)=>{
    try{
    const item=await Item.findByIdandupdate(req.params.id, req.body, {});
    if (item)return res.status(404);
    res.json(items);
    }catch(error){
    res.status(500).json({error: error.message});
    }
    });
    //eliminar
    Router.get('/: id', async(req,res)=>{
        try{
        const item=await Item.findByIdAndDelete(req.params.id);
        if (item)return res.status(404);
        res.json(items);
        }catch(error){
        res.status(500).json({error: error.message});
        }
        });