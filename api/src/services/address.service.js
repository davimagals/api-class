import { AddressRepository } from "../repositories/address.repository.js";
import { AppError } from "../errors/AppError.js";

export const AddressService = {
  async create(data) {
    const [result] = await AddressRepository.create(data);

    return {
      insertId: result.insertId,
    };
  },

  async update(data) {
    const updated = await AddressRepository.update(data);

    if (!updated) {
      throw new AppError("Endereço não encontrado", 404);
    }

    return true;
  },
};
