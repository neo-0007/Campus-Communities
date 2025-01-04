const Banner = require("../models/banner.model");

const getBannersOfInstitute = async (req, res, next) => {
  try {
    const { instituteId } = req.params;

    const foundInstitute = await new Banner({}).findById(instituteId);
    if (!foundInstitute) {
      return res.status(404).json({
        success: false,
        message: `Institute with id "${instituteId}" not found.`,
      });
    }

    const banners = await new Banner({}).find({ institute_id: instituteId });
    res.status(200).json({
      success: true,
      message: `Banners for institute with id "${instituteId}" fetched successfully.`,
      data: banners,
    });


  } catch (error) {
    console.error("Error fetching banners:", error.message);
    res.status(500).json({
      success: false,
      message: "An error occurred while fetching banners.",
      error: error.message,
    });
  }
};

const getAllBanners = async(req,res,next) =>{
  try {
    const banners = await new Banner({}).find();

    res.status(200).json({
        success: true,
        banners,
    });

} catch (error) {
    return res.status(500).json({
        success: false,
        message: "Something went wrong!",
    });
    }
}

const addBanner = async(req,res,next) =>{
    try {
        const {institute_id,title,image_url,start_date,end_date} = req.body;

        const existingBanners = await new Banner({}).find({image_url});
        if(!existingBanners){
            res.status(400).json({
                success:false,
                message:`Banner already exists`,
            });
        }

        const newBanner = new Banner({
            institute_id,
            title,
            image_url,
            start_date,
            end_date,
        });

        const insertedBanner = await newBanner.save();
        if(!insertedBanner){
            throw new Error("Failed to add Banner.");
        }

        res.status(200).json({
            success: true,
            insertedBanner,
            message: "Banner added successfully",
        });

    } catch (error) {
        next(error);
    }
}

const getBannerById = async (req, res, next) => {
    try {
        const { bannerId } = req.params;

        const banner = await new Banner({}).findById(bannerId);

        if (!banner) {
            return res.status(404).json({
                success: false,
                message: `Institute with id "${bannerId}" not found.`,
            });
        }

        res.status(200).json({
            success: true,
            institute: banner[0],
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: "Something went wrong!",
        });
    }
};

const getActiveBanners = async(req,res,next) =>{

    try {
        const currentDate = new Date();

        const activeBanners = await Banner({}).getActiveBanners(currentDate);
    
        if (activeBanners.length === 0) {
            return res.status(404).json({
              success: false,
              message: "No active banners found.",
            });
          }
      
          res.status(200).json({
            success: true,
            message: "Active banners fetched successfully.",
            data: activeBanners,
          });

    } catch (error) {
        res.status(500).json({
            success: false,
            message: "An error occurred while fetching active banners.",
            error: error.message,
          });
    }
}

const getActiveBannersOfInstitute = async (req, res, next) => {
  try {
    const { instituteId } = req.params;
    const currentDate = new Date(); 

    const activeBanners = await Banner.getActiveBannersOfInstitute(currentDate, instituteId);

    if (activeBanners.length === 0) {
      return res.status(404).json({
        success: false,
        message: `No active banners found for institute with id "${instituteId}".`,
      });
    }

    res.status(200).json({
      success: true,
      message: `Active banners for institute with id "${instituteId}" fetched successfully.`,
      data: activeBanners,
    });

  } catch (error) {
    console.error("Error fetching active banners for institute:", error.message);
    res.status(500).json({
      success: false,
      message: "An error occurred while fetching active banners for the institute.",
      error: error.message,
    });
  }
};


module.exports = {
    getBannerById,
    addBanner,
    getBannersOfInstitute,
    getActiveBanners,
    getAllBanners,
    getActiveBannersOfInstitute
}

