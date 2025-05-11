const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello Node, This is the ECS deployenmt with node js. Thanks');
});

app.listen(8080, () => {
  console.log('Node.js app listening on port 8080');
});
