const pool = require("../config/database");
const bcrypt = require('bcryptjs');

const getUsers = async (name) => {
    if(!name){
        const result = await pool.query("SELECT * FROM users");
        return result.rows;
    }
    else{
        const result = await pool.query("SELECT * FROM users WHERE name ILIKE $1", [`%${name}%`]);
        return result.rows;
    }

};

const getUsersById = async (id) => {
    const result = await pool.query("SELECT * FROM users WHERE id = $1", [id]);
    return result.rows[0];
};

const deleteUsers = async (id) => {
    const result = await pool.query("DELETE FROM users WHERE id = $1 RETURNING *", [id]);

    if (result.rowCount === 0) {
        return { error: "Usuário não encontrado." };
    }
    return { message: "Usuário deletado com sucesso." };
};

const updateUsers = async (id, data) => {
    const { name, email, photo} = data;
    const result = await pool.query("UPDATE users SET name = $1, email = $2, photo = $3 WHERE id = $4 RETURNING *", [name, email, photo, id]);
    return result.rows[0];
};

const createUsers = async (name, email, photo, senha) => {
    const hashedPassword = await bcrypt.hash(senha, 10);
    const result = await pool.query(
      "INSERT INTO users (name, email, photo, senha) VALUES ($1, $2, $3, $4) RETURNING *",
    [name, email, photo, hashedPassword]
    );
    return result.rows[0];
  };
module.exports = {getUsers, getUsersById, deleteUsers, updateUsers, createUsers};