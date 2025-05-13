const CompleteCategory = require('../models/completeCategoryModel')

getCategories = async (req, res) =>
    {
        try {
            const categories = await CompleteCategory.getCategories();
            res.status(200).json(categories);
        } catch (error) {
            console.error(error)
            res.status(500).json({message: "erro ao buscar categorias"})
        }
}

getCategoryById = async (req, res) => {
    try {
        const categories = await CompleteCategory.getCategoryById(req.params.id)
        res.status(200).json(categories)
    } catch (error) {
        console.error(error)
res.status(500).json({message: "erro ao buscar categoria"})
    }
}

createCategory = async (req, res) => {
    try {
        const {style} = req.body
        const category = await CompleteCategory.createCategory(style)
        res.status(201).json(category)
    } catch (error) {
        console.error(error)
        res.status(500).json({message: "erro ao criar categoria"})
    }
}

updateCategory = async (req, res) => {
    try {
        const {style} = req.body
        const category = await CompleteCategory.updateCategory(req.params.id, style)
        res.status(200).json(category)
    } catch (error) {
        console.error(error);
        res.status(500).json({message: "erro ao atualizar categoria"})
    }
}

deleteCategory = async (req, res) => { 
    try {
        constcategory = await CompleteCategory.deleteCategory(req.params.id)
        res.status(200).json(category)
    } catch (error) {
        console.error(error)
        res.status(500).json({message: "erro ao deletar categoria"})
        
    }
}