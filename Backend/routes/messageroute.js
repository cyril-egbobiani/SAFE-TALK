const express = require('express');
const router = express.Router();
const { sendMessage, getConversations, deleteMessage } = require('../controllers/messageController');

router.post('/messages', sendMessage);
router.get('/messages/conversations', getConversations);
router.delete('/messages/:messageId', deleteMessage);

module.exports = router;
