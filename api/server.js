const express = require('express');
const cors = require('cors');
const path = require('path');
const auth = require('./authServices'); // rename if you save as authController.js

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Auth routes
app.post('/auth/register', auth.register);
app.post('/auth/login', auth.login);

// Serve video thumbnail
app.get('/video/:filename', (req, res) => {
  const file = req.params.filename;
  const filePath = path.join(__dirname, 'video', file);
  res.sendFile(filePath, err => {
    if (err) res.status(404).send('Thumbnail not found');
  });
});

// Serve user photo
app.get('/user/:filename', (req, res) => {
  const file = req.params.filename;
  const filePath = path.join(__dirname, 'user', file);
  res.sendFile(filePath, err => {
    if (err) res.status(404).send('User photo not found');
  });
});

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
