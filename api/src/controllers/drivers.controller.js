import { DriversService } from "../services/drivers.service.js";

const asyncHandler = (fn) => (req, res, next) =>
  Promise.resolve(fn(req, res, next)).catch(next);

export const DriversController = {
  getAll: asyncHandler(async (req, res) => {
    const data = await DriversService.getAll();

    res.status(200).json({
      success: true,
      data,
    });
  }),

  findByCnh: asyncHandler(async (req, res) => {
    const data = await DriversService.findByCnh(req.params.cnh);

    res.status(200).json({
      success: true,
      data,
    });
  }),

  create: asyncHandler(async (req, res) => {
    const result = await DriversService.create(req.body);

    res.status(201).json({
      success: true,
      data: result,
    });
  }),

  update: asyncHandler(async (req, res) => {
    const result = await DriversService.update({
      ...req.body,
      cnh: req.params.cnh,
    });

    res.status(200).json({
      success: true,
      data: result,
    });
  }),
};
