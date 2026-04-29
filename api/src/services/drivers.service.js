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

  async create(data) {
    const address = await AddressService.create(data);

    const insertId = await DriversRepository.create({
      ...data,
      endereco_id: address.insertId,
    });

    return {
      id: insertId,
      ...data,
    };
  },

  async update(data) {
    const {
      rua,
      numero,
      complemento,
      bairro,
      cidade,
      estado_id,
      ...driverData
    } = data;

    if (Object.keys(driverData).length > 1) {
      const updated = await DriversRepository.update({
        cnh: data.cnh,
        ...driverData,
      });

      if (!updated) {
        throw new AppError("Motorista não encontrado", 404);
      }
    }

    if (rua || numero || complemento || bairro || cidade || estado_id) {
      await AddressService.update(data);
    }

    return { cnh: data.cnh, ...data };
  },
};
