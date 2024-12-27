const InstituteDepartment = require("../models/institute.deparment.model");
const Institute = require("../models/institute.model");
const Department = require("../models/department.model");

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

        const insertedInstitute = await newInstitute.save()
        if (!insertedInstitute) {
            throw new Error("Failed to add institute.");
        }

        res.status(200).json({
            success: true,
            insertedInstitute,
            message: "Institute added successfully",
        });
    } catch (error) {
        next(error);
    }
};

const getAllInstitutes = async (req, res, next) => {
    try {
        const institutes = await new Institute({}).find();

        res.status(200).json({
            success: true,
            institutes,
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: "Something went wrong!",
        });
        }
};

const getInstituteById = async (req, res, next) => {
    try {
        const { instituteId } = req.params;

        const institute = await new Institute({}).findById(instituteId);

        if (!institute) {
            return res.status(404).json({
                success: false,
                message: `Institute with id "${instituteId}" not found.`,
            });
        }

        res.status(200).json({
            success: true,
            institute: institute[0],
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: "Something went wrong!",
        });
    }
};

const getDepartmentsOfInstitute = async (req, res, next) => {
    try {
        const { instituteId } = req.params;

        // Find the institute
        const foundInstitute = await new Institute({}).findById(instituteId);
        if (!foundInstitute) {
            return res.status(404).json({
                success: false,
                message: `Institute with id "${instituteId}" not found.`,
            });
        }

        // Get the relationships between the institute and its departments
        const instituteDepartments = await new InstituteDepartment({}).find({ institute_id: instituteId });

        // Fetch department details
        const departments = await Promise.all(
            instituteDepartments.map(async (instituteDepartment) => {
                const department = await new Department({}).findById(instituteDepartment.department_id);
                return department[0]; 
            })
        );

        // Send the response
        res.status(200).json({
            success: true,
            departments, // This will now be an array
        });
    } catch (error) {
        return res.status(500).json({
            success: false,
            message: "Something went wrong!",
        });
    }
};


module.exports = { addInstitute, getAllInstitutes, getDepartmentsOfInstitute, getInstituteById };
