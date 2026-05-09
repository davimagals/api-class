import { Router } from "express";
import { AddressController } from "../controllers/address.controller.js";
import { validateBody } from "../middlewares/validate.middleware.js";

import { UpdateAddressDTO } from "../dtos/address/update-address.dto.js";

const router = Router();

router.get("/:id", AddressController.findById);

router.patch("/:id", validateBody(UpdateAddressDTO), AddressController.update);

export default router;
