import { AddressService } from "../../services/tickets/address.service.js";

const asyncHandler = (fn) => (req, res, next) =>
  Promise.resolve(fn(req, res, next)).catch(next);

export const AddressController = {
  findById: asyncHandler(async (req, res) => {
    const data = await AddressService.findById(req.params.id);

    res.status(200).json({
      success: true,
      data,
    });
  }),

  create: asyncHandler(async (req, res) => {
    const result = await AddressService.create(req.body);

    res.status(201).json({
      success: true,
      data: result,
    });
  }),

  update: asyncHandler(async (req, res) => {
    const result = await AddressService.update({
      ...req.body,
      id: req.params.id,
    });

    res.status(200).json({
      success: true,
      data: result,
    });
  }),
};
