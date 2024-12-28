const express = require('express');
const router = express.Router();
const { addInstitute, getAllInstitutes, getDepartmentsOfInstitute, getInstituteById } = require('../controllers/institute.controller');
const { protectRoute, rootRoute } = require('../middleware/auth.middleware');

router.post('/add', protectRoute, rootRoute, addInstitute);
router.get('/all', getAllInstitutes);
router.get('/:instituteId', getInstituteById);
router.get('/:instituteId/departments', getDepartmentsOfInstitute);

module.exports = router;