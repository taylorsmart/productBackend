const models = require('../models');
// const axios = require('axios');
// const config = require('../env/config.js');

const query = models.overview.queries;
// const apiUrl = 'https://app-hrsei-api.herokuapp.com/api/fec2/hr-bld/';

module.exports = {
  get: (req, res) => {
    const offset = 0;
    const page = 10;
    if(req.params.page && req.params.count) {
      offset = req.params.page * req.params.count; //This should yield a page skip
      page = req.params.count
    }
    const data = [offset,page] ;
    console.log(`Received Get request`);
    query.getProducts(data, (err, results) => {
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
    query.getProductInfo(id, (err, results) => {
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
    query.getStyle(id, (err, results) => {
      if (err) {
        console.log(err);
        res.status(404).send(err);
      } else {
        console.log(results);
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