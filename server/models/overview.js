const axios = require('axios');
const config = require('../env/config.js');

const apiUrl = 'https://app-hrsei-api.herokuapp.com/api/fec2/hr-bld/';
const { Pool, Client } = require('pg')

//Connect to db
const client = new Client({
  host: 'localhost',
  user: 'super',
  password: '', //Adjust this to the password
  database: 'product_information',
})

client.connect()
// client.query('SELECT NOW()', (err, res) => {
//   console.log(err, res)
// })

// client.query('SELECT * from test_table join (select * from reviews) ', (err, res) => {
//   console.log(err, res)
//   client.end() // Ensure this is in the final line.
// })

const queries = {
  getProducts: (data,callback) => {
    console.log(`Executing getProducts info for data ${data}`)
    client.query(' \
        SELECT \
          pt.id,\
          pt.name, \
          pt.slogan, \
          pt.description, \
          pt.category, \
          pt.default_price \
        from product as pt \
        offset $1 limit $2; \
      ',data , (err, res) => {
        if (err) {
          callback(err,null);
        } else {
          callback(null,res);
        }
      })
  },
  getProductInfo: (id,callback) => {
    console.log(`Executing product info for id ${id}`)
    client.query(
          `SELECT \
            pt.id as id, \
            pt.name as name, \
            pt.slogan as slogan, \
            pt.description as description, \
            pt.category as category, \
            pt.default_price as default_price, \
            subft.features \
            from product as pt \
            join ( \
              select ft.product_id, \
                jsonb_agg ( \
                  json_build_object( \
                    'feature', ft.name, \
                    'value', ft.value \
                  ) \
                ) as features \
              from feature as ft \
              where ft.product_id= $1 \
              group by ft.product_id \
            ) as subft \
            on pt.id=subft.product_id \
            where pt.id =$1;`
          ,[id] , (err, res) => {
        if (err) {
          callback(err,null);
        } else {
          callback(null,res);
        }
      })
  },
  getStyle:  (id,callback) => {
    console.log(`Executing getStyle info for id ${id}`)

    client.query('SELECT so.results from style_optimized as so where product_id=$1;', [id], (err, res) => {
        if (err) {
          callback(err,null);
        } else {
          callback(null,res);
        }
      })
  },
  getProductsTemplate: (id,callback) => {
    const options = {
      method: 'get',
      url: `${apiUrl}products`,
      headers: {
        'User-Agent': 'request',
        Authorization: `${config.TOKEN}`,
        'Content-Type': 'application/json',
        Connection: 'keep-alive',
      },
    };

    axios(options).then((response) => {
      callback(null, response.data);
    })
      .catch((error) => {
        console.log(error, null);
      });
  }
}

module.exports.queries = queries;
