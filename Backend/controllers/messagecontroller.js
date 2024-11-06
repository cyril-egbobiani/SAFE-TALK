const Message = require('../models/Message');

// Send a Message
exports.sendMessage = async (req, res) => {
  const { recipientId, message, anonymous } = req.body;
  try {
    const newMessage = new Message({
      senderId: req.user.id,
      recipientId,
      message,
      anonymous,
    });
    await newMessage.save();
    res.status(201).json(newMessage);
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};

// Get All Conversations
exports.getConversations = async (req, res) => {
  try {
    const conversations = await Message.find({ $or: [{ senderId: req.user.id }, { recipientId: req.user.id }] });
    res.json(conversations);
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};

// Delete a Message
exports.deleteMessage = async (req, res) => {
  try {
    const message = await Message.findById(req.params.messageId);
    if (!message) return res.status(404).json({ msg: 'Message not found' });

    await message.remove();
    res.json({ msg: 'Message deleted successfully' });
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};
