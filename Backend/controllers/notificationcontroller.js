const Notification = require('../models/Notification');

// Get Notifications
exports.getNotifications = async (req, res) => {
  try {
    const notifications = await Notification.find({ userId: req.user.id });
    res.json(notifications);
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};

// Mark Notifications as Read
exports.markAsRead = async (req, res) => {
  try {
    await Notification.updateMany({ userId: req.user.id, read: false }, { $set: { read: true } });
    res.json({ msg: 'Notifications marked as read' });
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};
