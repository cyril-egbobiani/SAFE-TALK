const Comment = require('../models/Comment');
const Post = require('../models/Post');

// Add a Comment
exports.addComment = async (req, res) => {
  const { content, anonymous } = req.body;
  try {
    const post = await Post.findById(req.params.postId);
    if (!post) return res.status(404).json({ msg: 'Post not found' });

    const comment = new Comment({ content, anonymous, postId: post._id });
    await comment.save();
    
    post.comments.push(comment._id);  // Assuming Post has a comments array
    await post.save();

    res.status(201).json(comment);
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};

// Get Comments for a Post
exports.getComments = async (req, res) => {
  try {
    const comments = await Comment.find({ postId: req.params.postId });
    res.json(comments);
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};

// Delete a Comment
exports.deleteComment = async (req, res) => {
  try {
    const comment = await Comment.findById(req.params.commentId);
    if (!comment) return res.status(404).json({ msg: 'Comment not found' });

    await comment.remove();
    res.json({ msg: 'Comment deleted successfully' });
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};
