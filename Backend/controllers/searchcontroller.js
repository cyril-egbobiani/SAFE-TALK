const Post = require('../models/Post');
const Comment = require('../models/Comment');

exports.search = async (req, res) => {
  const { query, type } = req.query;
  try {
    let results = [];
    if (type === 'posts') {
      results = await Post.find({ content: { $regex: query, $options: 'i' } });
    } else if (type === 'comments') {
      results = await Comment.find({ content: { $regex: query, $options: 'i' } });
    }
    res.json(results);
  } catch (err) {
    res.status(500).json({ msg: err.message });
  }
};
