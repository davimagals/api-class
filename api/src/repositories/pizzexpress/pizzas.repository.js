import pool from "../../database/index.js";

export const PizzasRepository = {
  async findAll() {
    const [rows] = await pool.query("SELECT * FROM p_pizza");
    return rows;
  },

  async findById(id) {
    const [rows] = await pool.query("SELECT * FROM p_pizza WHERE id = ?", [id]);
    return rows[0] || null;
  },

  async create({ nome, preco, foto }) {
    const [result] = await pool.query(
      `INSERT INTO p_pizza 
       (nome, preco, foto)
       VALUES (?, ?, ?)`,
      [nome, preco, foto],
    );

    return result.insertId;
  },

  async update({ id, nome, preco, foto }) {
    const [result] = await pool.query(
      `UPDATE p_pizza
       SET nome = ?, preco = ?, foto = ?
       WHERE id = ?`,
      [nome, preco, foto, id],
    );

    return result.affectedRows > 0;
  },
};
