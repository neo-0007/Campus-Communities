const BaseModel = require("./base.model");
const mysql = require("mysql2");
const config = require("../config/mysqlConfig");
const pool = mysql.createPool(config);

class UserInstituteDepartment extends BaseModel {
    constructor({ user_id, institute_id, department_id }) {
        super('user_institute_department'); // Pass the table name to the BaseModel
        this.user_id = user_id;
        this.institute_id = institute_id;
        this.department_id = department_id;
    }

    create({ user_id, institute_id, department_id }) {
        return new Promise((resolve, reject) => {
            pool.query(
                'INSERT INTO `user_institute_department` (user_id, institute_id, department_id) VALUES (?, ?, ?)',
                [user_id, institute_id, department_id],
                (error, results) => {
                    if (error) {
                        reject(error);
                    }
                    resolve(results);
                }
            );
        }
        );
    }
}

module.exports = UserInstituteDepartment;