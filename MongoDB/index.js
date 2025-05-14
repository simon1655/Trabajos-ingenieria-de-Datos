const express = requiere('express');
const app = express();

const port = 3000;


app.get('/', (req, res) => {
    res.send('Hola mundo');
});

app.listen(port, () => {
    console.log(`servidor corriendo http://localhost:${port}`)
});




const { Router } = require('express');
const { MongoClient } = require('mongodb');

const uri = 'mongodb://localhost:27017';
const client = new MongoClient(uri);

async function main() {
  try {
    await client.connect();
    const db = client.db('tallerMongoDB');

    // Parte 1: Usuarios
    const usuarios = db.collection('usuarios');
    await usuarios.insertMany([
      { nombre: 'Juan Pérez', edad: 30, correo: 'juan.perez@urosario.com' },
      { nombre: 'Ana López', edad: 25, correo: 'ana.lopez@urosario.com' },
      { nombre: 'Luis Torres', edad: 35, correo: 'luis.torres@urosario.com' }
    ]);

    console.log(await usuarios.find().toArray());
    console.log(await usuarios.findOne({ nombre: 'Ana López' }));
    console.log(await usuarios.find({ edad: { $gte: 30 } }).toArray());

    await usuarios.updateOne({ nombre: 'Juan Pérez' }, { $set: { edad: 31 } });
    await usuarios.updateMany({ edad: { $gte: 30 } }, { $set: { activo: true } });

    await usuarios.deleteOne({ nombre: 'Luis Torres' });
    await usuarios.deleteMany({ edad: { $lt: 30 } });

    // Parte 2: Productos
    const productos = db.collection('productos');
    await productos.insertMany([
      { nombre: 'Smartphone', precio: 800, categoria: 'Electrónica' },
      { nombre: 'Camiseta', precio: 25, categoria: 'Ropa' },
      { nombre: 'Televisor', precio: 450, categoria: 'Electrónica' },
      { nombre: 'Licuadora', precio: 120, categoria: 'Hogar' },
      { nombre: 'Zapatos', precio: 75, categoria: 'Ropa' }
    ]);

    console.log(await productos.find({ precio: { $gt: 100 } }).toArray());
    console.log(await productos.find().sort({ precio: -1 }).toArray());

    await productos.updateMany({}, { $set: { en_stock: true } });
    await productos.updateMany({ precio: { $gt: 500 } }, { $set: { en_stock: false } });

    await productos.deleteMany({ precio: { $lt: 50 } });

  } finally {
    await client.close();
  }
}



main().catch(console.error);






