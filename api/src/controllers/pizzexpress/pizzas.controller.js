import { PizzasService } from "../../services/pizzexpress/pizzas.service.js";

const asyncHandler = (fn) => (req, res, next) =>
  Promise.resolve(fn(req, res, next)).catch(next);

export const PizzasController = {
  getAll: asyncHandler(async (req, res) => {
    const data = await PizzasService.getAll();

    res.status(200).json({
      success: true,
      data,
    });
  }),

  findById: asyncHandler(async (req, res) => {
    const data = await PizzasService.findById(req.params.id);

    res.status(200).json({
      success: true,
      data,
    });
  }),

  findByIdWithIng: asyncHandler(async (req, res) => {
    const data = await PizzasService.findByIdWithIng(req.params.id);

    res.status(200).json({
      success: true,
      data,
    });
  }),
};
