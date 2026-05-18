import { PizzasRepository } from "../../repositories/pizzexpress/pizzas.repository.js";
import { IngRepository } from "../../repositories/pizzexpress/ing.repository.js";
import { AppError } from "../../errors/AppError.js";

export const PizzasService = {
  async getAll() {
    return await PizzasRepository.findAll();
  },

  async findById(id) {
    const pizza = await PizzasRepository.findById(id);

    if (!pizza) {
      throw new AppError("Pizza não encontrada", 404);
    }

    return pizza;
  },

  async findByIdWithIng(id) {
    const pizza = await PizzasRepository.findById(id);

    if (!pizza) {
      throw new AppError("Pizza não encontrada", 404);
    }

    const ingredients = await IngRepository.findByPizzaId(pizza.id);

    return {
      pizza,
      ingredients,
    };
  },
};
