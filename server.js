const express = require('express');
const path = require('path');

const app = express();
const port = process.env.PORT || 3000;

// Serve static files (HTML, CSS, JavaScript)
app.use(express.static(path.join(__dirname)));

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
