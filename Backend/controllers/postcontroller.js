// controllers/postController.js
const Post = require('../models/Post');

// Create Post
exports.createPost = async (req, res) => {
  const { content, category, anonymous } = req.body;
  try {
    const post = new Post({ content, category, anonymous });
    await post.save();
    res.status(201).json(post);
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};

// Get All Posts
exports.getPosts = async (req, res) => {
  try {
    const posts = await Post.find().sort({ createdAt: -1 });
    res.json(posts);
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};

// Get Post by ID
exports.getPostById = async (req, res) => {
  try {
    const post = await Post.findById(req.params.postId);
    if (!post) return res.status(404).json({ msg: 'Post not found' });
    res.json(post);
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};
