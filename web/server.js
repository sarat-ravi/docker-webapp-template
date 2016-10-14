// 'use strict';

var express = require('express');
var router = express.Router();

// Constants
const PORT = 8080;

var app = express();

function reqLogger(req, res, next) {
    var currentDate = new Date().toISOString();
    console.log("", currentDate , req.method, req.originalUrl);
    next();
};

router.use(reqLogger);

router.get('/', function (req, res) {
  res.send('Hello world v7\n');
});

router.get('/status', function (req, res) {
  res.send('good\n');
});

app.use(router)
app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
