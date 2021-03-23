const router = require('express').Router();
const controller = require('./controllers');

// Enable Routing
// router.get("/", (req, res) => {
//     res.setHeader("Access-Control-Allow-Origin", "*")
//     res.setHeader("Access-Control-Allow-Credentials", "true");
//     res.setHeader("Access-Control-Max-Age", "1800");∏
//     res.setHeader("Access-Control-Allow-Headers", "content-type");
//     res.setHeader( "Access-Control-Allow-Methods", "PUT, POST, GET, DELETE, PATCH, OPTIONS" );
//      });

// Connect controller methods to their corresponding routes
router.get('/overview/products/:id', controller.overview.getProduct);
router.get('/overview/styles/:id', controller.overview.getStyles);
router.post('/overview', controller.overview.addToCart);
// router.put('/overview', controller.overview.put);
// router.delete('/overview', controller.overview.delete);


module.exports = router;
