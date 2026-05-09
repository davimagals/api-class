import express from "express";
import cors from "cors";

import driversRouter from "./routes/drivers.router.js";
import addressRouter from "./routes/address.router.js";

import { errorHandler } from "./middlewares/error.middleware.js";

const app = express();

// CORS aberto
app.use(
  cors({
    origin: "*",
    methods: ["GET", "POST", "PUT", "PATCH", "DELETE"],
    allowedHeaders: ["Content-Type", "Authorization"],
  }),
);

// JSON
app.use(express.json());

// Health Check
app.get("/health", (req, res) => {
  res.status(200).json({ status: "ok" });
});

// Rotas: Multas
app.use("/api/multas/motoristas", driversRouter);
app.use("/api/multas/enderecos", addressRouter);

// Rotas: PizzExpress

// 404 Handler
app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: "Rota não encontrada",
  });
});

// Error handler
app.use(errorHandler);

export default app;
