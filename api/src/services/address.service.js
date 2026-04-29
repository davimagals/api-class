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
    if (!data.endereco_id) {
      throw new AppError("endereco_id é obrigatório para atualização", 400);
    }

    const [result] = await AddressRepository.update(data);

    if (result.affectedRows === 0) {
      throw new AppError("Endereço não encontrado", 404);
    }

    return true;
  },
};
