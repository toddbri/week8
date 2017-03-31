const express = require('express');
const app = express();
var hbs = require('hbs');
var awsConnect = require('./aws-connection.js');
var db = awsConnect.db;
var pgp = awsConnect.pgp;
var prompt = require('prompt-promise');

app.listen(8081, function(){
  console.log("Listening on port: 8081");
});

app.get('/', function(req,resp){
  db.one("return * from artist")
    .then(function(data){
      console.log('returned: ' + data);
    })
    .catch(function(err){
      console.log('Error querying database : ' + err.message);
    });
});
