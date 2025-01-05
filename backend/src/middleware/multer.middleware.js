// const multer = require("multer");
// const path = require("path");

// // Configure multer to save files locally (or process them for cloud storage)
// const storage = multer.diskStorage({
//   destination: (req, file, cb) => {
//     cb(null, path.join(__dirname, "uploads")); // Save to "uploads" folder
//   },
//   filename: (req, file, cb) => {
//     const uniqueName = `${Date.now()}-${encodeURI(file.originalname)}`;
//     cb(null, uniqueName); // Use a unique name for the file
//   },
// });

// // File filter to accept only specific file types (e.g., images)
// const fileFilter = (req, file, cb) => {
//   const allowedTypes = ["image/jpeg", "image/png", "image/gif", "image/svg+xml"];
//   if (allowedTypes.includes(file.mimetype)) {
//     cb(null, true);
//   } else {
//     cb(new Error("Invalid file type. Only JPEG, PNG, and GIF are allowed."), false);
//   }
// };

// const upload = multer({
//   storage,
//   limits: { fileSize: 5 * 1024 * 1024 }, // 5MB size limit
//   fileFilter,
// });

// module.exports = upload;


const multer = require("multer");

// Configure Multer to use memory storage
const storage = multer.memoryStorage();

const upload = multer({ storage });

// Export the middleware for use in your routes
module.exports = upload;
