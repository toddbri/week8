const express = require('express');
const app = express();
var hbs = require('hbs');

app.set('view engine', 'hbs');

app.listen(8080, function(){
  console.log("Listening on port: 8080");
});

app.get('/', function(req,resp){
  resp.send('Hello, world!');
});

app.get('/cats', function(req,resp){
  resp.send('Meow');
});

app.get('/dogs', function(req,resp){
  resp.send('Woof');
});
app.get('/cats_and_dogs', function(req,resp){
  resp.send('Living together');
});

// app.get('/greet/:name',function(req,resp){
//   resp.send("hello " + req.params.name);
// });

app.get('/year',function(req,resp){
  var yearBorn = 2017 - req.query.age;
  resp.send('you were born in '+ yearBorn);
});

app.get('/greet/:name',function(req,resp){
  var yearBorn = 2017 - req.query.age;
  resp.render('hello.hbs',{name: req.params.name, yearBorn: yearBorn, title: "year Born" });
});

app.get('/fav_animals',function(req,resp){
  var animals = [
  { name: 'cats', favorite: true },
  { name: 'dogs', favorite: true },
  { name: 'tree frogs', favorite: true },
  { name: 'earth worms', favorite: false },
  { name: 'guinea pigs', favorite: true },
  ];
  resp.render('favoriteanimals.hbs',{zoo: animals});

});

app.get('/cats_and_dogs2',function(req,resp){
  resp.render('livingtogether.hbs',{});
});

app.use(express.static('public'));
