import { Router } from "express";
import { PizzasController } from "../../controllers/pizzexpress/pizzas.controller.js";
import { validateBody } from "../../middlewares/validate.middleware.js";

const router = Router();

router.get("/", PizzasController.getAll);

router.get("/:id", PizzasController.findById);

router.get("/:id/ingredientes", PizzasController.findByIdWithIng);

export default router;
