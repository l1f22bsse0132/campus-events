const express = require("express");
const path = require("path");
const app = express();
const PORT = process.env.PORT || 1234;

// Serve the dist folder (production build)
app.use(express.static(path.join(__dirname, "dist")));

// For any unknown route, return index.html
// So navigation works (if needed)
app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "dist", "index.html"));
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
