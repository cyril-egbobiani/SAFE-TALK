const express = require('express');
const router = express.Router();
const { voteOnPost, voteOnComment } = require('../controllers/voteController');

router.post('/posts/:postId/vote', voteOnPost);
router.post('/comments/:commentId/vote', voteOnComment);

module.exports = router;
