const bcrypt = require("bcrypt");
const dotenv = require("dotenv");
const User = require("../models/user.model");
const { generateTokens, storeRefreshToken } = require("../utils/jwtToken");
const UserInstituteDepartment = require("../models/user.institute.department.model");
dotenv.config();

const register = async (req, res, next) => {
    try {
        const { email, password, name, username, semester, department, institute, roll_number, phone } = req.body;

        const userExists = await new User({}).find({ email });
        if (userExists.length > 0) {
            return res.status(400).json({ success: false, message: `User with the email "${email}" already exists.` });
        }

        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        const newUser = new User({
            email: email,
            password: hashedPassword,
            name: name,
            username: username,
            roll_number: roll_number,
            semester: semester,
            phone: phone,
        });

        const insertedUser = await newUser.save();
        if (!insertedUser) {
            throw new Error("Failed to register user.");
        }

        const userInstituteDepartment = await new UserInstituteDepartment({}).create({
            user_id: insertedUser.id,
            institute_id: institute,
            department_id: department,
        }).catch((error) => {
            throw new Error(error);
        }).then((results) => {
            return results.affectedRows;
        });

        if (userInstituteDepartment == 0) {
            throw new Error("Failed to register user.");
        }

        const { password: _, ...userWithoutPassword } = insertedUser

        const { accessToken, refreshToken } = await generateTokens(userWithoutPassword);
        storeRefreshToken(userWithoutPassword, refreshToken)

        return res
            .cookie("accessToken", accessToken, {
                httpOnly: true, // prevent XSS attacks
                secure: process.env.NODE_ENV === "production",
                sameSite: "strict", // prevents CSRF attack
                maxAge: 15 * 60 * 1000, // 15 minutes
            })
            .cookie("refreshToken", refreshToken, {
                httpOnly: true, // prevent XSS attacks
                secure: process.env.NODE_ENV === "production",
                sameSite: "strict", // prevents CSRF attack
                maxAge: 7 * 24 * 60 * 60 * 1000, // 7 days
            })
            .status(201).json({
                success: true,
                message: "User registered successfully.",
                refreshToken,
                user: userWithoutPassword,
            });
    } catch (error) {
        return res.status(500).json({ success: false, message: error.message });
        }
};

const login = async (req, res, next) => {
    try {
        const { roll_number, password } = req.body;

        const user = await new User({}).find({ roll_number });
        if (user.length === 0) {
            return res.status(400).json({ success: false, message: `User not found.`});
        }

        const isPasswordValid = await bcrypt.compare(password, user[0].password);
        if (!isPasswordValid) {
            return res.status(400).json({ success: false, message: `Invalid password.`});
        }

        const update_last_login = await new User({}).updateById(user[0].id, { last_login: new Date() });

        const { password: _, ...userWithoutPassword } = update_last_login

        const { accessToken, refreshToken } = await generateTokens(userWithoutPassword);
        storeRefreshToken(userWithoutPassword, refreshToken)

        return res
            .cookie("accessToken", accessToken, {
                httpOnly: true, // prevent XSS attacks
                secure: process.env.NODE_ENV === "production",
                sameSite: "strict", // prevents CSRF attack
                maxAge: 15 * 60 * 1000, // 15 minutes
            })
            .cookie("refreshToken", refreshToken, {
                httpOnly: true, // prevent XSS attacks
                secure: process.env.NODE_ENV === "production",
                sameSite: "strict", // prevents CSRF attack
                maxAge: 7 * 24 * 60 * 60 * 1000, // 7 days
            })
            .status(200).json({ success: true, message: "User logged in successfully.", refreshToken, user: userWithoutPassword });
    } catch (error) {
        return res.status(500).json({ success: false, message: error.message });
        }
}

const getUser = async (req, res, next) => {
    try {
        const { user } = req;
        const existingUser = await new User({}).findById(user.id);
        if (existingUser.length == 0) {
            return res.status(400).json({ success: false, message: "User not found." });
        }
        const { password: _, ...userWithoutPassword } = existingUser[0]
        return res.status(200).json({ success: true, user: userWithoutPassword });
    } catch (error) {
        return res.status(500).json({ success: false, message: error.message });
    }
}

const logout = async (req, res, next) => {
    try {
        res.clearCookie("accessToken");
        res.clearCookie("refreshToken");
        return res.status(200).json({ success: true, message: "User logged out successfully." });
    } catch (error) {
        return res.status(500).json({ success: false, message: error.message });
    }
}
module.exports = { register, login, logout, getUser };
