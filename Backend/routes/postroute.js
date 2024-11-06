// routes/posts.js
const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');
const { createPost, getPosts, getPostById } = require('../controllers/postController');

router.post('/', auth, createPost);
router.get('/', getPosts);
router.get('/:postId', getPostById);

module.exports = router;
