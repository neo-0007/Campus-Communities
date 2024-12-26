const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { checkRecordExists, insertRecord, updateRecord, fetchRecord } = require("../utils/sqlFunctions");
const dotenv = require("dotenv");
const User = require("../models/User");
dotenv.config();
const secretKey = process.env.JWT_SECRET;


const registerUser = async(userData)=>{
    const { email, password, name, username, semester,roll_number,phone } = userData;

    const userExists = await checkRecordExists('users','email',email);
    if (userExists) throw new Error('User already exists');

    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = new User({
        email:email,
        password: hashedPassword,
        name:name,
        username:username,
        rollNumber:roll_number,
        semester:semester,
        phone:phone
    });

    await insertRecord('users', newUser);

    return { message: 'User registered successfully' };
};


module.exports = { registerUser };