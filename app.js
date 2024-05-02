const express = require('express');
const app = express();
const port = 3000;

app.get('/api/data', (req, res) => {
    res.json({ message: 'Data from the Backend!' });
});

app.listen(port, () => {
    console.log(`Backend server listening on port ${port}`);
});
