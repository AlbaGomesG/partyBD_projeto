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

const getEvent = async (id) => {
    const result = await pool.query("SELECT * FROM eventos WHERE id = $1", [id]);
    return result.rows[0];
};

module.exports = {getEvents, getEvent};