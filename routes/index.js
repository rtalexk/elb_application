const express = require('express');
const router = express.Router();
const fetch = require('node-fetch');

// Instance local link URL
const url = 'http://169.254.169.254/latest/meta-data';

/**
 * @param { Promise } p
 */
const handle = p => p.then(r => [r.text()]).catch(e => [undefined, e]);

/* GET home page. */
router.get('/', async function (_, res) {
  const failedToFetch = 'Failed to fetch';

  const [instance_id, instanceIdError] = await handle(fetch(`${url}/instance-id`));
  const [az, azError] = await handle(fetch(`${url}/placement/availability-zone`));

  if (instanceIdError || azError) {
    return res.render('index', { instance_id: failedToFetch, az: failedToFetch });
  }

  res.render('index', { instance_id, az });
});

module.exports = router;
