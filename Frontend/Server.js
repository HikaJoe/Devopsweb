const express = require('express');
const app = express();
const PORT = 3000;

app.use(express.static('public'));

app.get('/content/:section', (req, res) => {
  const section = req.params.section;
  // Fetch content from the database based on the section.
  // In a real application, you would use a database library (e.g., MongoDB, MySQL) to fetch data.
  const content = getContentFromDatabase(section);
  res.json({ section, content });
});

function getContentFromDatabase(section) {
  // Mock function to simulate fetching content from the database.
  // In a real application, you would query your database.
  const mockDatabase = {
    Home: 'Welcome to the Home page!',
    Movies: 'Explore our movie collection.',
    'TV Shows': 'Discover popular TV shows.',
    Contact: 'Get in touch with us.'
  };
  return mockDatabase[section] || 'Content not found';
}

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
