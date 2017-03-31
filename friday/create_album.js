var awsConnect = require('./aws-connection.js');
var db = awsConnect.db;
var pgp = awsConnect.pgp;
var prompt = require('prompt-promise');
var res=[];

function init(){
  res = [];
  prompt('Artists name? ')
    .then(function(val){
      return db.one("insert into artist(id,name) values (default,$1) returning id", val);
    })
    .then(function(data){
      console.log('Created artist with id: ' + data.id);
    })
    .catch(function(err){
      console.log('Error inserting new artist: ' + err.message);
    })
    .then(function(result) {
      return prompt('Enter another(y/n)?');
    })
    .then(function(val){
      if (val === 'y'){
        init();
      } else {
        prompt.finish();
        pgp.end();
      }
    })
    .catch(function(err){
      console.log('error: ', err.message);
      prompt.finish();
    });
}

init();
