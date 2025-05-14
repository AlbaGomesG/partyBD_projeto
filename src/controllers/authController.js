const pool = require('../config/database');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
require("dotenv").config();

const login = async (req, res) => {
    console.log('Requisição recebida:', req.body);
    const { email, senha } = req.body; // Alterado de 'password' para 'senha'

    try {
        const result = await pool.query('SELECT * FROM users WHERE email = $1', [email]);
        if (result.rows.length === 0) {
            return res.status(400).json({ message: 'Usuário não encontrado' });
        }

        const user = result.rows[0];

        // Comparar a senha fornecida com o hash armazenado
        const isValid = await bcrypt.compare(senha, user.senha); // Alterado de 'password' para 'senha'
        if (!isValid) {
            return res.status(401).json({ message: 'Senha incorreta' });
        }

        // Gerar o token JWT
        const token = jwt.sign(
            { id: user.id, email: user.email },
            process.env.JWT_SECRET,
            { expiresIn: '1h' }
        );

        return res.status(200).json({ token });
    } catch (err) {
        console.error('Erro no login:', err);
        res.status(500).json({ message: 'Erro interno do servidor' });
    }
};

module.exports = { login };