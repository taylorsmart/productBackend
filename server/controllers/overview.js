const models = require('../models');
// const axios = require('axios');
// const config = require('../env/config.js');

const query = models.overview.queries;
// const apiUrl = 'https://app-hrsei-api.herokuapp.com/api/fec2/hr-bld/';

module.exports = {
  get: (req, res) => {
    console.log(`Received Get request`);
    query.getProducts((err, results) => {
      if (err) {
        console.log(err);
        console.log(err)
        res.status(404).send(err);
      } else {
        // console.log(results)
        res.status(200).send(results);
      }
    });
  },
  getProduct: (req, res) => {
    const id = req.params.id;
    console.log(`Received getProduct request for ${id}`);
    query.getProductInfo(id,(err, results) => {
      if (err) {
        console.log(err);
        res.status(404).send(err);
      } else {
        console.log(results)
        res.status(200).send(results);
      }
    }); 
  },
  getStyles: (req, res) => {
    const id = req.params.id;
    console.log(`Received getStyles request for ${id}`);
    query.getStyle(id,(err, results) => {
      if (err) {
        console.log(err);
        res.status(404).send(err);
      } else {
        // console.log(results);
        res.status(200).send(results);
      }
    });
  },
  addToCart: (req, res) => {
    console.log(`Received addToCart request`);
    query.getProducts((err, results) => {
      if (err) {
        console.log(err);
        console.log(err)
        res.status(404).send(err);
      } else {
        console.log(results)
        res.status(200).send(results);
      }
    });
  }
}