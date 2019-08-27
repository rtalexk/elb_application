const express = require('express');
const router = express.Router();
const fetch = require('node-fetch');

// Instance local link URL
const url = 'http://169.254.169.254/latest/meta-data';

/**
 * @param { Promise } p
 */
const handle = p => p.then(r => [r]).catch(e => [undefined, e]);

/* GET home page. */
router.get('/', async function (_, res) {
  const [instance_id, error] = await handle(fetch(`${url}/instance-id`));
  console.log(error);
  console.log(instance_id);
  res.render('index', { instance_id: 'i-0f4a807825d1b6d42', az: 'us-west-1' });
});

module.exports = router;
