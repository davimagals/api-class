import express from "express";
import cors from "cors";
import path from "path";
import { fileURLToPath } from "url";

import driversRouter from "./routes/drivers.router.js";
import { errorHandler } from "./middlewares/error.middleware.js";

const app = express();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// CORS aberto (temporário)
app.use(
  cors({
    origin: "*",
    methods: ["GET", "POST", "PUT", "PATCH", "DELETE"],
    allowedHeaders: ["Content-Type", "Authorization"],
  }),
);

app.use(express.json());

// Health Check
app.get("/health", (req, res) => {
  res.status(200).json({ status: "ok" });
});

// Docs
app.use("/docs", express.static(path.join(__dirname, "public/docs")));

// Rotas
app.use("/api/multas/motoristas", driversRouter);

// 404 Handler
app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: "Rota não encontrada",
  });
});

// Error handler (sempre por último)
app.use(errorHandler);

export default app;
