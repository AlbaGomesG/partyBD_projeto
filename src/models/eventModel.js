
const { rows } = require("pg/lib/defaults");
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

const getEvent = async (id) => {
    const result = await pool.query("SELECT * FROM eventos WHERE id = $1", [id]);
    return result.rows[0];
};

const createEvent = async (name_evento, localization, atracao, estilo, horario_inicio, horario_fim) => {
    const result = await pool.query("INSERT INTO eventos (name_evento, localization, atracao, estilo, horario_inicio, horario_fim) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *", [name_evento, localization, atracao, estilo, horario_inicio, horario_fim]);
    return result.rows[0];
};

const deleteEvent = async (id) => {
    const result = await pool.query("DELETE FROM eventos WHERE id = $1 RETURNING *", [id]);
    return result.rows[0];
};

const updateEvent = async (id, name_evento, localization) => {
    const result = await pool.query("UPDATE eventos SET name_evento = $1, localization = $2 WHERE id = $3 RETURNING *", [name_evento, localization, id]);
    return result.rows[0];
};



module.exports = {getEvents, getEvent, createEvent, deleteEvent, updateEvent};

