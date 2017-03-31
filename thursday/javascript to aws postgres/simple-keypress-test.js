var prompter = require('keypress-prompt');

prompter.prompt("choice(1/2/3)?",[1,2,3,'y'])
  .then(function(choice){
    console.log("you selected: " + choice);
    done();
  })
  .catch(function(err){
    console.log(err.message);
  });
