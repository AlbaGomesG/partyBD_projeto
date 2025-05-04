const pool = require("../config/database");

const getPosts = async () => {
    const result = await pool.query(
    `SELECT 
        posts.id,
        posts.user_id,
        posts.evento_id,
        posts.image,
        posts.content,
        posts.data_postagem,
        users.name AS usuario_name,
        users.photo AS usuario_photo
    FROM posts
    LEFT JOIN users ON posts.user_id = users.id;`
    );
    return result.rows;
};

const getPostById = async (id) => {
    const result = await pool.query(`
        SELECT posts.*, 
            users.name AS usuario_name 
        FROM posts 
        LEFT JOIN users ON posts.user_id = users.id 
        WHERE posts.id = $1`, [id]);
    return result.rows;
};
const createPost = async (user_id, evento_id, content, image, data_postagem) => {
    const result = await pool.query(
        `INSERT INTO posts
            (user_id, evento_id, content, image, data_postagem)
            VALUES
            ($1, $2, $3, $4, $5)
        RETURNING *`,
        [user_id, evento_id, content, image, data_postagem]
    );
    return result.rows[0];
};
const editPost = async (id, user_id, evento_id, content, image, data_postagem) => {
    const result = await pool.query(
        `UPDATE posts 
            SET user_id = $1, evento_id = $2, content = $3, image = $4, data_postagem = $5 
            WHERE id = $6 
        RETURNING *`, 
        [user_id, evento_id, content, image, data_postagem, id]
    );
    return result.rows[0];
};
const deletePost = async (id) => {
    const result = await pool.query (`DELETE FROM posts WHERE id = $1 RETURNING *`, [id])
    if (result.rowCount === 0) {
        return { error: "Post não encontrado." };
    }
    return { message: "Post deletado com sucesso." };
}


module.exports = { getPosts, getPostById, createPost, editPost, deletePost };