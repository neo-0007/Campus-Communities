const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const connectDB = require("./config/mysqlDb");

dotenv.config();
const port = process.env.PORT;
const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended:false}));

connectDB();

app.listen(port,() =>{
    console.log(`Server running on port : ${port}`);
});