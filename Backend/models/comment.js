// models/Comment.js
const mongoose = require('mongoose');

const commentSchema = new mongoose.Schema({
  postId: { type: mongoose.Schema.Types.ObjectId, ref: 'Post', required: true },
  content: { type: String, required: true },
  anonymous: { type: Boolean, default: true },
  votes: {
    upvotes: { type: Number, default: 0 },
    downvotes: { type: Number, default: 0 },
  },
}, { timestamps: true });

module.exports = mongoose.model('Comment', commentSchema);
