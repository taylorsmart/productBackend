const models = require('../models');
// const axios = require('axios');
// const config = require('../env/config.js');

const query = models.questions.queries;
// const apiUrl = 'https://app-hrsei-api.herokuapp.com/api/fec2/hr-bld/';

module.exports = {
  get: (req, res) => {
    query.getProducts((err, results) => {
      if (err) {
        console.log(err);
        res.status(404).send(err);
      } else {
        res.status(200).send(results);
      }
    });
  },
}