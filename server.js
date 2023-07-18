const express = require('express');
const app = express();
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