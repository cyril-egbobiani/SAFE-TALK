const express = require('express');
const connectDB = require('./config/db');
require('dotenv').config();

const app = express();

// Connect to the database
connectDB();

// Middleware to parse incoming JSON requests
app.use(express.json());

// Routes
app.use('/auth', require('./routes/authroute'));               // Authentication Routes
app.use('/posts', require('./routes/postroute'));             // Post Routes
app.use('/votes', require('./routes/voteroute'));             // Voting Routes
app.use('/comments', require('./routes/commentroute'));       // Comment Routes
app.use('/messages', require('./routes/messageroute'));       // Private Messaging Routes
app.use('/search', require('./routes/searchroute'));           // Search Routes
app.use('/notification', require('./routes/notificationroute'));  // Notification Routes

// Handling invalid routes
app.all('*', (req, res) => {
  res.status(404).json({ msg: 'Route not found' });
});


const PORT = process.env.PORT || 5000;

// Start the server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
