import pool from "../../database/index.js";

export const IngRepository = {
  async findAll() {
    const [rows] = await pool.query("SELECT * FROM p_ingrediente");
    return rows;
  },

  async findByPizzaId(id) {
    const [rows] = await pool.query(
      `SELECT i.*
      FROM p_ingrediente AS i
      INNER JOIN p_piz_ing AS pi
      ON i.id = pi.ing_id
      WHERE i.id = ?`,
      [id],
    );
    return rows[0] || null;
  },

  async create({ nome }) {
    const [result] = await pool.query(
      `INSERT INTO p_ingrediente 
       (nome)
       VALUES (?)`,
      [nome],
    );

    return result.insertId;
  },

  async update({ id, nome }) {
    const [result] = await pool.query(
      `UPDATE p_ingrediente
       SET nome = ?
       WHERE id = ?`,
      [nome, id],
    );

    return result.affectedRows > 0;
  },
};
