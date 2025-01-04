const BaseModel = require("./base.model");
const Roles = require("./roles.model");

class User extends BaseModel{
    constructor({ email, password, name, username,roll_number, semester,phone }) {
        super('users'); // Pass the table name to the BaseModel
        this.email = email;
        this.password = password;
        this.name = name;
        this.username = username;
        this.roll_number = roll_number;
        this.semester = semester;
        this.phone = phone;
        this.role = new Roles({}).roles.student;
    }
}

module.exports = User;
