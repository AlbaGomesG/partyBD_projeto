const express = require('express');
const router = express.Router();
const postController = require("../controllers/postsController");
const upload = require("../config/upload");
const { verifyToken } = require('../config/auth');

router.get("/", postController.getAllPosts);
router.get("/:id", verifyToken, postController.getById);
router.post("/", upload.single("image"), postController.createPost);
router.put("/:id", postController.editPost);
router.delete("/:id", postController.deletePost);

module.exports = router;