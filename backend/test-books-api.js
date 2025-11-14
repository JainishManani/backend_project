require('dotenv').config();
const fetch = require('node-fetch');

const query = 'Harry Potter';
const url = `https://www.googleapis.com/books/v1/volumes?q=${encodeURIComponent(query)}&key=${process.env.GOOGLE_BOOKS_API_KEY}`;

fetch(url)
  .then(response => response.json())
  .then(data => console.log(JSON.stringify(data.items[0], null, 2)))
  .catch(err => console.error('API error:', err.message));