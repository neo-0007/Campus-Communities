const BaseModel = require('./base.model');

class Institute extends BaseModel {
    constructor({ name, website, address, logo_url }) {
        super('institutes'); // Pass the table name to the BaseModel
        this.name = name;
        this.website = website;
        this.address = address;
        this.logo_url = logo_url;
    }
    
    // Additional Institute-specific methods can go here if needed
}

module.exports = Institute;
