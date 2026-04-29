export function errorHandler(err, req, res, next) {
  console.error(err);

  const statusCode = err.statusCode || 500;

  const response = {
    success: false,
    message: err.message || "Internal Server Error",
  };

  if (err.details) {
    response.details = err.details;
  }

  res.status(statusCode).json(response);
}
