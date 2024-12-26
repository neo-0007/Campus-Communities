const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const authRouter = require("./routes/auth.route");
const rootRouter = require("./routes/root.routes");

dotenv.config();
const app = express();

app.set('trust proxy', 1);
app.use(cookieParser());
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));
app.use(express.json({ limit: "50mb" }));
app.use(cors());
app.use(express.urlencoded({extended:false}));

app.use('/api/auth', authRouter);
app.use('/api/root', rootRouter);

module.exports = app;

