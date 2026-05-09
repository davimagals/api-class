import pool from "../database/index.js";

export const DriversRepository = {
  async findAll() {
    const [rows] = await pool.query("SELECT * FROM m_motorista");
    return rows;
  },

  async findByCnh(cnh) {
    const [rows] = await pool.query("SELECT * FROM m_motorista WHERE cnh = ?", [
      cnh,
    ]);
    return rows[0] || null;
  },

  async create({ cnh, nome, data_nascimento, endereco_id }) {
    const [result] = await pool.query(
      `INSERT INTO m_motorista 
       (cnh, nome, data_nascimento, endereco_id)
       VALUES (?, ?, ?, ?)`,
      [cnh, nome, data_nascimento, endereco_id],
    );

    return result.insertId;
  },

  async update({ cnh, nome, data_nascimento }) {
    const [result] = await pool.query(
      `UPDATE m_motorista
       SET nome = ?, data_nascimento = ?
       WHERE cnh = ?`,
      [nome, data_nascimento, cnh],
    );

    return result.affectedRows > 0;
  },
};
