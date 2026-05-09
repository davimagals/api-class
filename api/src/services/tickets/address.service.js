import { AddressRepository } from "../../repositories/tickets/address.repository.js";
import { AppError } from "../../errors/AppError.js";

export const AddressService = {
  async findById(id) {
    const address = await AddressRepository.findById(id);

    if (!address) {
      throw new AppError("Endereço não encontrado", 404);
    }

    return address;
  },

  async create(data) {
    const [result] = await AddressRepository.create(data);

    return result.insertId;
  },

  async update(data) {
    const updated = await AddressRepository.update(data);

    if (!updated) {
      throw new AppError("Endereço não encontrado", 404);
    }

    return true;
  },
};
