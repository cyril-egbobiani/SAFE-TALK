// middlewares/authMiddleware.js
const { verifyToken } = require('../utils/jwt');

function authMiddleware(req, res, next) {
  const token = req.header('Authorization')?.replace('Bearer ', '');

  if (!token) {
    return res.status(401).json({ message: 'Access denied' });
  }

  const decoded = verifyToken(token);
  if (!decoded) {
    return res.status(401).json({ message: 'Invalid token' });
  }

  req.user = decoded; // Attach user data to request
  next();
}

module.exports = authMiddleware;
