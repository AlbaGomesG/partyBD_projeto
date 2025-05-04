const PostModel = require('../models/postsModel');

const getAllPosts = async (req, res) => {
    try {
        const posts = await PostModel.getPosts();
        res.json(posts) 
    } catch (error) {
        console.error('Erro ao buscar posts:', error);
        res.status(500).json({ error: 'Erro ao buscar posts.' });
    }
}

const getById = async (req, res) => {
    try {
        const post = await PostModel.getPostById(req.params.id);
        if (!post) {
            return res.status(404).json({ error: 'Post não encontrado.' });
        }
        res.json(post);
    } catch (error) {
        res.status(500).json({ error: 'Erro ao buscar post.' });
    }
}

const createPost = async (req, res) => {
    try {
        const { user_id, evento_id, content, image, data_postagem} = req.body;  // ainda não está feito a inclusão do photo por arquivo
        const newPost = await PostModel.createPost(user_id, evento_id, content, image, data_postagem);
        res.status(201).json(newPost);
    } catch (error) {
        res.status(500).json({ error: 'Erro ao criar post.' });
        
    }
}

const editPost = async (req, res) => {
    try {
        const { user_id, evento_id, content, image, data_postagem } = req.body;
        const post = await PostModel.editPost(req.params.id, user_id, evento_id, content, image, data_postagem); 
        if (!post) {
            return res.status(404).json({ error: 'Post não encontrado.' });
        }
        res.json(post);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Erro ao editar post.' });
    }
};
const deletePost = async (req, res) => {
    try {
        const result = await PostModel.deletePost(req.params.id);
        if (result.error) {
            return res.status(404).json(result);
        }
        res.json(result);
    } catch (error) {
        res.status(500).json({ error: 'Erro ao deletar post.' });
    }
}

module.exports = {getAllPosts, getById, createPost, editPost, deletePost};