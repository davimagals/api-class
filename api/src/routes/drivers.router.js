import { Router } from "express";
import { DriversController } from "../controllers/drivers.controller.js";
import { validateBody } from "../middlewares/validate.middleware.js";

import { CreateDriverDTO } from "../dtos/driver/create-driver.dto.js";
import { UpdateDriverDTO } from "../dtos/driver/update-driver.dto.js";

const router = Router();

router.get("/", DriversController.getAll);

router.get("/:cnh", DriversController.findByCnh);

router.get("/:cnh/endereco", DriversController.findByCnhWithAddress);

router.post("/", validateBody(CreateDriverDTO), DriversController.create);

router.patch("/:cnh", validateBody(UpdateDriverDTO), DriversController.update);

export default router;
