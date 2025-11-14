const bcrypt = require('bcrypt');

const password = 'Password!1'; // Choose a strong password
bcrypt.hash(password, 10, (err, hash) => {
  if (err) {
    console.error('Hash error:', err.message);
    return;
  }
  console.log('Hashed Password:', hash);
});