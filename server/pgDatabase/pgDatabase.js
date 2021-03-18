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

client.query('SELECT * from test_table', (err, res) => {
  console.log(err, res)
  client.end() // Ensure this is in the final line.
})
