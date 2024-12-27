const BaseModel = require("./base.model");

class InstituteDepartment extends BaseModel{
    constructor({ institute_id, department_id }) {
        super('institute_department'); // Pass the table name to the BaseModel
        this.institute_id = institute_id;
        this.department_id = department_id;
    }
}

module.exports = InstituteDepartment;