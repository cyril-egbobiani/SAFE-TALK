const mongoose = require('mongoose');
const bcrypt = require("bcryptjs");

const userSchema = new mongoose.Schema({
  username: { type: String, required: true, unique: true },
  password: { type: String },
  createdAt: { type: Date, default: Date.now },
});

// Hash password before saving using bcrypt
userSchema.pre('save', async function (next) {
  if (!this.isModified('password')) return next();

  try {
    // Hash the password using bcrypt with 10 salt rounds
    this.password = await bcrypt.hash(this.password, 10);
    next();
  } catch (err) {
    next(err);
  }
});

module.exports = mongoose.model('User', userSchema);
