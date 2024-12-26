const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const connectDB = require("./config/mysqlDb");
const router = require("./routes/authRoutes");

dotenv.config();
const port = process.env.PORT;
const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended:false}));

connectDB();
app.use('/api/auth', router);

//Test Api
app.get("/",(req,res) =>{
    res.status(200).json({success: true , message: "Welcome to Campus Communities!"})
})

app.listen(port,() =>{
    console.log(`Server running on port : ${port}`);
});