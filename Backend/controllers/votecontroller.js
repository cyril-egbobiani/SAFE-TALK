const Post = require('../models/Post');
const Comment = require('../models/Comment');

// Vote on a Post
exports.voteOnPost = async (req, res) => {
  const { voteType } = req.body;
  try {
    const post = await Post.findById(req.params.postId);
    if (!post) return res.status(404).json({ msg: 'Post not found' });

    if (voteType === 'upvote') post.votes.upvotes += 1;
    if (voteType === 'downvote') post.votes.downvotes += 1;

    await post.save();
    res.json(post);
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};

// Vote on a Comment
exports.voteOnComment = async (req, res) => {
  const { voteType } = req.body;
  try {
    const comment = await Comment.findById(req.params.commentId);
    if (!comment) return res.status(404).json({ msg: 'Comment not found' });

    if (voteType === 'upvote') comment.votes.upvotes += 1;
    if (voteType === 'downvote') comment.votes.downvotes += 1;

    await comment.save();
    res.json(comment);
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};
