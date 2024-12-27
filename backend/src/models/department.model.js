const BaseModel = require("./base.model");

class Department extends BaseModel{
    constructor({ name }) {
        super('departments'); // Pass the table name to the BaseModel
        this.name = name;
    }
}

module.exports = Department;