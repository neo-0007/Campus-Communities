const BaseModel = require("./base.model");
const mysql = require("mysql2");
const config = require("../config/mysqlConfig");
const pool = mysql.createPool(config);


class Banner extends BaseModel {
  constructor({institute_id,image_url, title, start_date, end_date,}) {
    super("banners");
    this.institute_id = institute_id;
    this.image_url = image_url;
    this.title = title;
    this.start_date = start_date;
    this.end_date = end_date;
  }


  async getActiveBanners(date){
    try {
        const formattedDate = new Date(date).toISOString().slice(0, 19).replace("T", " ");

        const query = `
        SELECT * FROM banners
        WHERE start_date <= ? AND end_date >= ?
        `;

        const [banners] = await pool.promise().query(query, [formattedDate, formattedDate]);

        return banners;
    } catch (error) {
        throw new Error(`Failed to fetch active banners: ${error.message}`);
    }
  }

  async getActiveBannersOfInstitute(date,instituteId){
    try {
      const formattedDate = new Date(date).toISOString().slice(0, 19).replace("T", " ");
      const query =`
        SELECT * FROM banners
        WHERE start_date <= ? AND end_date >= ? AND institute_id = ?
        `;

      const [banners] = await pool.promise().query(query,[formattedDate,formattedDate,instituteId]);

      return banners;
    } catch (error) {
      throw new Error(`Failed to fetch active banners: ${error.message}`);
    }
  }
}

module.exports = Banner;
