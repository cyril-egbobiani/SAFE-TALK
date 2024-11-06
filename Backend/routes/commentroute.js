const express = require('express');
const router = express.Router();
const { addComment, getComments, deleteComment } = require('../controllers/commentController');

router.post('/posts/:postId/comments', addComment);
router.get('/posts/:postId/comments', getComments);
router.delete('/comments/:commentId', deleteComment);

module.exports = router;
