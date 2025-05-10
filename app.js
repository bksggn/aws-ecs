const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello Node');
});

app.listen(8080, () => {
  console.log('Node.js app listening on port 8080');
});
