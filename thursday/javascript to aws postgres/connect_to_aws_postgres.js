var pgp = require('pg-promise')();

var db = pgp({
  host: '54.218.30.85',
  database: 'postgres',
  user: 'postgres',
  password: 'DanglyintheCloud$5'
});

db.any("select * from family")
  .then(function(result) {
    console.log(result);
    pgp.end();
  })
  .catch(function(err) {
    console.log(err.message);
  });
