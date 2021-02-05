// Mă voi conecta cu db -> am nevoie de pachet: mysqli
const MySqli = require('mysqli');

let conn = new MySqli({
    host: 'localhost',
    post: 3306,
    user: 'admin-user',
    passwd: 'admin',
    db: 'database',
});
let db = conn.emit(false, '');

module.exports = {
    database: db
};
