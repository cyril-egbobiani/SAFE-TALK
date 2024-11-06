const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const User = require("../models/User"); // Make sure you have a User model
require("dotenv").config();

// Register a new user
exports.register = async (req, res) => {
  try {
    const { username, password } = req.body;

    // Check if username already exists
    const existingUser = await User.findOne({ username });
    if (existingUser) {
      return res.status(400).json({ message: "Username already taken" });
    }

    // Create and save the new user (no need to hash the password manually)
    const newUser = new User({ username, password });
    await newUser.save();
    
    res.status(201).json({ message: "User registered successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error registering user", error });
  }
};


// Login user and issue JWT
exports.login = async (req, res) => {
  try {
    const { username, password } = req.body;

    // Find the user by username
    const user = await User.findOne({ username });
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    // Compare the password with the stored hashed password
    const isMatch = await bcrypt.compare(password, user.password);

    // If passwords don't match, return 401
    if (!isMatch) {
      return res.status(401).json({ message: "Invalid credentials" });
    }

    // Generate the JWT token
    const token = jwt.sign(
      { id: user._id, username: user.username },
      process.env.JWT_SECRET,
      { expiresIn: "1h" }
    );

    // Send the token as response
    res.json({ token });
  } catch (error) {
    console.error("Error logging in:", error);
    res.status(500).json({ message: "Error logging in", error });
  }
};

// Retrieve user profile (requires auth middleware)
exports.profile = async (req, res) => {
  try {
    // Retrieve user from DB based on the authenticated user ID
    const user = await User.findById(req.user.id).select("-password");
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }
    res.json(user);
  } catch (error) {
    res.status(500).json({ message: "Error retrieving profile", error });
  }
};
