import express from "express";
import cors from "cors";
import driversRouter from "./routes/drivers.router.js";
import { errorHandler } from "./middlewares/error.middleware.js";

const app = express();

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

// Rotas
app.use("/api/motoristas", driversRouter);

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
