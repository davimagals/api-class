import { DriversRepository } from "../repositories/drivers.repository.js";
import { AddressService } from "./address.service.js";
import { AppError } from "../errors/AppError.js";

export const DriversService = {
  async getAll() {
    return await DriversRepository.findAll();
  },

  async findByCnh(cnh) {
    const driver = await DriversRepository.findByCnh(cnh);

    if (!driver) {
      throw new AppError("Motorista não encontrado", 404);
    }

    return driver;
  },

  async findByCnhWithAddress(cnh) {
    const driver = await DriversRepository.findByCnh(cnh);

    if (!driver) {
      throw new AppError("Motorista não encontrado", 404);
    }

    const address = await AddressService.findById(driver.endereco_id);

    const { endereco_id, ...driverData } = driver;

    return {
      ...driverData,
      endereco: address,
    };
  },

  async create(data) {
    const addressId = await AddressService.create(data);

    const insertId = await DriversRepository.create({
      ...data,
      endereco_id: addressId,
    });

    return {
      id: insertId,
      ...data,
    };
  },

  async update(data) {
    const updated = await DriversRepository.update(data);

    if (!updated) {
      throw new AppError("Motorista não encontrado", 404);
    }

    return true;
  },
};
