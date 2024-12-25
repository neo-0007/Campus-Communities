const mysql = require("mysql2");
const config = require("../config/mysqlConfig");
const pool = mysql.createPool(config);


// Fxn to create a table where:
// Schema -> SQL String query to create db
const createTable = (schema) =>{
    return new Promise((resolve,reject)=> {
        pool.query(schema,(err,results)=>{
            if(err){
                reject(err);
            }else{
                resolve(results);
            }
        });
    });
};


//
const checkRecordExists = (tableName, column, value) => {
    return new Promise((resolve,reject)=>{
        const query = `SELECT * FROM ${tableName} WHERE ${column} = ?`;

        pool.query(query, [value], (err, results) => {
            if(err){
                reject(err);
            }else{
                resolve(results.length ? results[0] : null);
            }
        });
    });
};


const insertRecord = (tableName, record) =>{
    return new Promise((resolve,reject)=>{
        const query = `INSERT INTO ${tableName} SET ?`;

        pool.query(query,[record],(err,results)=>{
            if(err){
                reject(err);
            }else{
                resolve(results);
            }
        });
    });
};

module.exports = {
    createTable,
    checkRecordExists,
    insertRecord,
}