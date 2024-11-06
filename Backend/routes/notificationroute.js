const express = require('express');
const router = express.Router();
const { getNotifications, markAsRead } = require('../controllers/notificationController');

router.get('/notifications', getNotifications);
router.post('/notifications/mark-as-read', markAsRead);

module.exports = router;
