import { AppError } from "../errors/AppError.js";

export const validateBody = (schema) => (req, res, next) => {
  try {
    req.body = schema.parse(req.body);
    next();
  } catch (err) {
    next(new AppError("Validation error", 400, err.errors));
  }
};
