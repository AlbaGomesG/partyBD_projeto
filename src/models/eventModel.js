const pool = require("../config/database");

const getEvents = async (estilo) => {
    if(!estilo){
        const result = await pool.query(`SELECT * FROM eventos`);
        return result.rows;
    } else {
        const result = await pool.query("SELECT * FROM eventos WHERE estilo ILIKE $1", [`%${estilo}%`]);
        return result.rows;
    }
};

module.exports = {getEvents};