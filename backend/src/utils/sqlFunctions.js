const mysql = require("mysql2");
const config = require("../config/mysqlConfig");
const pool = mysql.createPool(config);


/*Fxn to create a new table:
Parameters: Schema -> SQL String query to create db
Syntax for use : await createTable(`CREATE TABLE IF NOT EXISTS table_name(data)`)
*/
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


/* 
Fxn to check if an record exist in an table
Parameters: tableName-> name of table to search 
            column-> column name
            value-> value which we need to search
Syntax: const record = await checkRecordExists('table_name','column_name','value');
*/              
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

/*
Fxn to insert a new record in a table
Parameters: tableName-> table_name , record-> object with key:value pairs
Syntax: await insertRecord(tableName,{col1:val1,col2:val2,col3:val3});
*/
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

/*
Fxn to Update a existing record
Parameters: tableName, updates-> column:value pair, condition: column:value pair
Syntax: await updateRecord('users', { name: 'John Doe' }, { column: 'id', value: 1 });
*/
const updateRecord = (tableName,updates,condition)=>{
    return new Promise((resolve,reject)=>{
        const query = `UPDATE ${tableName} SET ? WHERE ${condition.column}`

        pool.query(query,[updates,condition.value],(err,results)=>{
            if(err){
                reject(err);
            }else{
                resolve(results);
            }
        });
    });
};

/*
Fxn to Delete a Record(deletes a whole row with some condition)
Parameters: tableName, condition-> column:value pair
await deleteRecord('users', { column: 'id', value: 1 });
*/
const deleteRecord = (tableName,condition)=>{
    return new Promise((resolve,reject)=>{
        const query = `DELETE FROM ${tableName} WHERE ${condition.column} = ?`;

        pool.query(query,[condition.value],(err,results)=>{
            if(err){
                reject(err);
            }else{
                resolve(results);
            }
        });
    });
};

/*
Fxn to fetch all records
Parameters: tableName
Syntax: const users = await fetchAllRecords('users');
*/
const fetchAllRecords = (tableName) => {
    return new Promise((resolve, reject) => {
        const query = `SELECT * FROM ${tableName}`;
        pool.query(query, (err, results) => {
            if (err) {
                reject(err);
            } else {
                resolve(results);
            }
        });
    });
};

/*
Fxn to fetch a record
Parameters: tableName, condition-> column:value
Syntax:const user = await fetchRecordsWithCondition('users', { column: 'email', value: 'test@example.com' });
*/
const fetchRecord = (tableName, condition) => {
    return new Promise((resolve, reject) => {
        const query = `SELECT * FROM ${tableName} WHERE ${condition.column} = ?`;
        pool.query(query, [condition.value], (err, results) => {
            if (err) {
                reject(err);
            } else {
                resolve(results);
            }
        });
    });
};



module.exports = {
    createTable,
    checkRecordExists,
    insertRecord,
    updateRecord
}