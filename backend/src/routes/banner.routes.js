const express = require('express');
const router = express.Router();
const {protectRoute,rootRoute} = require('../middleware/auth.middleware');
const {getAllBanners, getBannersOfInstitute, addBanner, getBannerById, getActiveBannersOfInstitute, getActiveBanners} = require('../controllers/banner.controller');

router.get('/all',getAllBanners);
router.get('/institute/:instituteId',getBannersOfInstitute);
router.post('/add',addBanner);
router.get('/active',getActiveBanners);
router.get('/:bannerId',getBannerById);
router.get('/active/institute/:instituteId',getActiveBannersOfInstitute);


module.exports = router;