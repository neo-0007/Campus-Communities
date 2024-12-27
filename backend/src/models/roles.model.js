const BaseModel = require("./base.model");

class Roles extends BaseModel {
    constructor({ name, description }) {
        super("roles");
    }

    roles = {
        student: 1,
        root: 2,
        admin: 3,
        teacher: 4,
    }
}

module.exports = Roles;