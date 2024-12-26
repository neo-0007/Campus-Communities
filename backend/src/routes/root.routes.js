const express = require('express');
const router = express.Router();
const { addInstitute } = require('../controllers/root.controller');

router.post('/institute/add', addInstitute);

module.exports = router;