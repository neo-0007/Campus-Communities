const Institute = require("../models/institute.model");

const addInstitute = async (req, res, next) => {
    try {
        const { name, website, address, logo_url } = req.body;

        const existingInstitutes = await new Institute({}).find({ name });

        if (existingInstitutes.length > 0) {
            return res.status(400).json({
                success: false,
                message: `Institute with the name "${name}" already exists.`,
            });
        }

        const newInstitute = new Institute({
            name,
            website,
            address,
            logo_url,
        });

        const insertedInstitute = await newInstitute.save().catch((err) => {
            throw new Error(err);
        }
        ).then((result) => {
            return result.affectedRows > 0 ? newInstitute : null;
        }
        );

        res.status(200).json({
            success: true,
            insertedInstitute,
            message: "Institute added successfully",
        });
    } catch (error) {
        next(error);
    }
};

module.exports = { addInstitute };
