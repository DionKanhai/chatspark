//imports the express framework into the server file
const express = require('express');
//creartes an instance of the express application
const app = express();
// PORT variable defines the port on which the server will listen
// it is set to the env variable PORT, otherwise default 3000
const PORT = process.env.PORT || 3000;

// define your routes and middleware here

// example route
app.get('/', (req, res) => {
  res.send('Hello, Express!');
});

// to start the server
app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});