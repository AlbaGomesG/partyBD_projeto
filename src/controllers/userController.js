const UserModel = require('../models/userModel');
const pool = require("../config/database");

const getAllUsers = async (req, res) => {
    try {
        const {name} = req.query;
        const users = await UserModel.getUsers(name);
        res.json(users);
    } catch (error) {
        res.status(500).json({ error: 'Erro ao buscar usuários.' });
    }
};

const getUserById = async (req, res) => {
    const { id } = req.params;
    try {
        const user = await UserModel.getUsersById(id);
        if (!user) {
            return res.status(404).json({ error: 'Usuário não encontrado.' });
        }
        res.json(user);
    } catch (error) {
        res.status(500).json({ error: 'Erro ao buscar usuário.' });
    }
}

const deleteUser = async (req, res) => {
    try {
        const result = await UserModel.deleteUsers(req.params.id);
        if (result.error) {
            return res.status(404).json(result);
        }
        res.json(result);

    } catch (error) {
        res.status(500).json({ error: 'Erro ao deletar usuário.' });
    }
}

const updateUser = async (req, res) => {
    try {
        const user = await UserModel.updateUsers(req.params.id, req.body);
        if (!user) {
            return res.status(404).json({ message: "usuário não encontrado." });
        }
        res.json(user);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Erro ao atualizar o usuário." });
    }
}


const register = async (req, res) => {
    const { name, email, senha } = req.body;
    const photo = req.file ? req.file.filename : null;

    try {
      // Verifica se o email já existe
      const check = await pool.query('SELECT * FROM users WHERE email = $1', [email]);
    if (check.rows.length > 0) {
        return res.status(400).json({ message: 'Email já cadastrado' });
    }


    const newUser = await UserModel.createUsers(name, email, photo, senha);
    res.status(201).json(newUser);
    } catch (error) {
        console.error('Erro ao registrar usuário:', error);
        res.status(500).json({ message: 'Erro interno no servidor' });
    }
};


module.exports = {getAllUsers, getUserById, deleteUser, updateUser, register};