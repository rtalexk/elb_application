var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', async function (_, res) {
  res.render('index', { instance_id: 'i-0f4a807825d1b6d42', az: 'us-west-1' });
});

module.exports = router;
