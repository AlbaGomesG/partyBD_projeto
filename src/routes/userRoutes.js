const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const upload = require("../config/upload");

router.get('/', userController.getAllUsers);
router.get('/:id', userController.getUserById);
router.post('/', upload.single("photo"), userController.register);
router.put('/:id', userController.updateUser);
router.delete('/:id', userController.deleteUser);


module.exports = router;