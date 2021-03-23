const { Pool, Client } = require('pg')
// const pool = new Pool({
//   user: 'root',
// //   host: 'database.server.com',
//   database: 'taylorTestDB',
// //   password: '5422',
// //   port: 3211,
// })
// pool.query('SELECT NOW()', (err, res) => {
//   console.log(err, res)
//   pool.end()
// })
const client = new Client({
  host: 'localhost',
  user: 'super',
  password: '', //Adjust this to the password
  database: 'catwalkdb',
})

client.connect()
client.query('SELECT NOW()', (err, res) => {
  console.log(err, res)
})

client.query('SELECT * from test_table join (select * from reviews) ', (err, res) => {
  console.log(err, res)
  client.end() // Ensure this is in the final line.
})


//`SELECT products.product_id,  products.name, products.slogan, products.description, products.category, products.default_price, JSON_ARRAYAGG( JSON_OBJECT( ‘f_id’, features.product_id, ‘f_feature’, features.feature, ‘f_value’, features.value) ) AS feature_data FROM products JOIN features ON products.product_id=features.product_id WHERE products.product_id=?`