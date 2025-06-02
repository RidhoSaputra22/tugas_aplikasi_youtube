const db = require('./db'); // Make sure this is your mysql2 connection
const bcrypt = require('bcryptjs');
const { v4: uuidv4 } = require('uuid');

const JWT_SECRET = 'your_secret_key'; // Replace with env var in production

// REGISTER
exports.register = async (req, res) => {
  const { nama, tanggal_lahir, gender, email, password, photo } = req.body;
  if (!nama || !email || !password || !tanggal_lahir || !gender || !photo) {
    return res.status(400).json({ message: 'All fields are required' });
  }

  const hashedPassword = await bcrypt.hash(password, 10);
  const uid = uuidv4();

  const query = `
    INSERT INTO users (uid, nama, tanggal_lahir, gender, email, password, photo)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;

  db.query(
    query,
    [uid, nama, tanggal_lahir, gender, email, hashedPassword, photo],
    (err, result) => {
      if (err) {
        if (err.code === 'ER_DUP_ENTRY') {
          return res.status(400).json({ message: 'Email already registered' });
        }
        return res.status(500).json({ error: err });
      }

      res.json({ message: 'Registration successful', uid });
    }
  );
};

// LOGIN
exports.login = (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) return res.status(400).json({ message: 'Missing email or password' });

  db.query('SELECT * FROM users WHERE email = ?', [email], async (err, results) => {
    if (err) return res.status(500).json({ error: err });

    if (results.length === 0) return res.status(401).json({ message: 'User not found' });

    const user = results[0];
    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) return res.status(401).json({ message: 'Incorrect password' });


    res.json({
      message: 'Login successful',
      user: {
        uid: user.uid,
        nama: user.nama,
        tanggal_lahir: user.tanggal_lahir,
        gender: user.gender,
        email: user.email,
        photo: user.photo
      }
    });
  });
};
