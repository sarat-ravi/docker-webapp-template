// 'use strict';

const express = require('express');

// Constants
const PORT = 80;

// App
const app = express();
app.get('/', function (req, res) {
  res.send('Hello world v3\n');
});

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);