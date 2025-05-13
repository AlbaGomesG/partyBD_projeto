const pool = require("../config/database");

const getCategories = async () => {
    const result = await pool.query("SELECT * FROM categories");
    return result.rows;
}

const getCategoryById = async (id) => {
    const result = await pool.query("SELECT * FROM categories WHERE id = $1", [id]);
    return result.rows[0];
}

const createCategory = async (style) => {
    const result = await pool.query(
        "INSERT INTO categories (style) VALUES ($1) RETURNING *",
        [style]
    );
    return result.rows[0];
}

const updateCategory = async (id, style) => {
    const result = await pool.query("UPDATE categories SET style = $1 WHERE id = $2 RETURNING *", [style, id]);
    return result.rows[0];
}

const deleteCategory = async (id) => {
    const result = await pool.query("DELETE FROM categories WHERE id = $1 RETURNIN *", [id])
    return result.rows[0]
}

const getGenre = async () => {
    const result = await pool.query("SELECT * FROM genres");
    return result.rows;
}

const getGenreById = async (id) => {
    const result = await pool.query("SELECT * FROM genres WHERE id = $1", [id]);
    return result.rows[0];
}

const createGenre = async (name) => {
    const result = await pool.query(
        "INSERT INTO genres (name) VALUES ($1) RETURNING *",
        [name]
    );
    return result.rows[0];
}

const updateGenre = async (id, name) => {
    const result = await pool.query("UPDATE genres SET style = $1 WHERE id = $2 RETURNING *", [name, id]);
    return result.rows[0];
}

const deleteGenre = async (id) => {
    const result = await pool.query("DELETE FROM genres WHERE id = $1 RETURNIN *", [id])
    return result.rows[0]
}

const getCards = async () => {
    const result = await pool.query("SELECT * FROM cards");
    return result.rows;
}

const getCardsById = async (id) => {
    const result = await pool.query("SELECT * FROM cards WHERE id = $1", [id]);
    return result.rows[0];
}

const createCards = async (photo, name, idade, description, id_categories, id_genres) => {
    const result = await pool.query(
        "INSERT INTO cards (photo, name, idade, description, id_categories, id_genres) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *",
        [photo, name, idade, description, id_categories, id_genres]
    );
    return result.rows[0];
}

const updateCards = async (id, photo, name, idade, description, id_categories, id_genres) => {
    const result = await pool.query("UPDATE cards SET photo = $1, name = $2, idade = $3, description = $4, id_categories = $5, id_genres = $6 WHERE id = $7 RETURNING *", [photo, name, idade, description, id_categories, id_genres, id]);
    return result.rows[0];
}

const deleteCards = async (id) => {
    const result = await pool.query("DELETE FROM cards WHERE id = $1 RETURNIN *", [id])
    return result.rows[0]
}

module.exports = {
    getCategories,
    getCategoryById,
    createCategory,
    updateCategory,
    deleteCategory,
    getGenre,
    getGenreById,
    createGenre,
    updateGenre,
    deleteGenre,
    getCards
};