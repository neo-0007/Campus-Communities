const express = require('express');
const router = express.Router();
const { addInstitute, getAllInstitutes, getDepartmentsOfInstitute, getInstituteById } = require('../controllers/institute.controller');

router.post('/add', addInstitute);
router.get('/all', getAllInstitutes);
router.get('/:instituteId', getInstituteById);
router.get('/:instituteId/departments', getDepartmentsOfInstitute);

module.exports = router;