require("dotenv").config();

const express = require("express");
const cors = require("cors");
const usersRoutes = require("./src/routes/userRoutes");
const postsRoutes = require("./src/routes/postsRoutes");
const eventRoutes = require("./src/routes/eventRoutes");
const app = express();
const path = require("path");

app.use(cors());
app.use(express.json());
app.use("/api/users", usersRoutes);
app.use("/api/posts", postsRoutes);
app.use("/api/events", eventRoutes);
app.use("/uploads", express.static(path.join(__dirname, "uploads")));



const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor rodando em http://localhost:${PORT}`);
});
