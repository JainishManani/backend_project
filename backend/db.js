// require('dotenv').config();
// const mysql = require('mysql2');
// //  LOCAL DATABASE CONFIG
// //  const connection = mysql.createConnection({
// //   host: 'localhost',
// //   user: 'root',
// //   password: process.env.MYSQL_PASSWORD,
// //   database: 'book_tracker'
// // });
// // PRODUCTION DATABASE CONFIG
// const connection = mysql.createConnection({
//   host: 'mysql-256a92e-jainishmanani123-6a0c.k.aivencloud.com',
//   port: '16445',
//   user: 'avnadmin',
//   password: process.env.MYSQL_PASSWORD_DEPLOY,
//   database: 'book_tracker'
// });
// connection.connect((err) => {
//   if (err) {
//     console.error('Error connecting to MySQL:', err.message, err.stack);
//     return;
//   }
//   console.log('Connected to MySQL');
// });
// module.exports = connection;

///////////////////////

require('dotenv').config();
const mysql = require('mysql2');
const fs = require('fs');
const path = require('path');

// Create MySQL connection using environment variables
const connection = mysql.createConnection({
  host: process.env.MYSQL_HOST,
  port: process.env.MYSQL_PORT || 3306,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD_DEPLOY,  // Standardized env var (set in Vercel)
  database: process.env.MYSQL_DATABASE,
  ssl: {
    ca: fs.readFileSync(path.join(__dirname, '../ca.pem'))  // Load Aiven CA cert from project root
  }
});

// Test connection (logs on startup)
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err.message, err.stack);
    return;
  }
  console.log('Connected to MySQL');
});

module.exports = connection;