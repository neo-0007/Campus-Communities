const { registerUser } = require('../services/authService');

const register = async (req, res) => {
    try {
        const userData = req.body;
        const response = await registerUser(userData);
        res.status(201).json(response);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

module.exports = { register };
