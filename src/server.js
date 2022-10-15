require("dotenv").config();
const express = require("express");
const app = express();
const cors = require("cors");
const router = require("./modules");
const PORT = process.env.PORT || 7777;

app.use(express.json());
app.use(cors());
app.use(router);
app.use("/*", (_, res) => res.send("bo`lmadi || 404"));

app.listen(PORT, console.log(PORT));
