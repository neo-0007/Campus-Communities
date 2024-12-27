const jwt = require("jsonwebtoken");
const Roles = require("../models/roles.model");

const protectRoute = async (req, res, next) => {
    try {
        const { accessToken, refreshToken } = req.cookies;

        // If no access token is found, check for the refresh token
        if (!accessToken) {
            if (!refreshToken) {
                return res.status(401).json({ message: "You need to login!" });
            }

            // Verify the refresh token
            const decoded = jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET);

            // Generate a new access token
            const newAccessToken = jwt.sign(
                { decoded },
                process.env.ACCESS_TOKEN_SECRET,
                { expiresIn: "15m" }
            );

            // Set the new access token as a cookie
            res.cookie("accessToken", newAccessToken, {
                httpOnly: true, // Prevent XSS attacks
                secure: process.env.NODE_ENV === "production", // Use secure cookies in production
                sameSite: "strict", // Prevent CSRF attacks
                maxAge: 15 * 60 * 1000, // 15 minutes
            });

            req.user = decoded;
            return next();
        }

        // Verify the access token
        const decoded = jwt.verify(accessToken, process.env.ACCESS_TOKEN_SECRET);
        req.user = decoded;
        next();
    } catch (error) {
        return res.status(500).json({ message: "Something went wrong!" });
    }
};

const rootRoute = async (req, res, next) => {
    try {
        const { role } = req.user;

        // Check if the user has the root role
        if (role !== new Roles({}).roles.root) {
            return res
                .status(403)
                .json({ message: "You are not authorized to access this route!" });
        }

        next();
    } catch (error) {
        return res.status(500).json({ message: "Something went wrong!" });
    }
};

module.exports = { protectRoute, rootRoute };
