import pool from "../../database/index.js";

export const AddressRepository = {
  async findById(id) {
    const [rows] = await pool.query("SELECT * FROM m_endereco WHERE id = ?", [
      id,
    ]);
    return rows[0] || null;
  },

  async create({ rua, numero, complemento, bairro, cidade, estado_id }) {
    const [result] = await pool.query(
      `INSERT INTO m_endereco 
       (rua, numero, complemento, bairro, cidade, estado_id)
       VALUES (?, ?, ?, ?, ?, ?)`,
      [rua, numero, complemento, bairro, cidade, estado_id],
    );

    return result.insertId;
  },

  async update({ id, rua, numero, complemento, bairro, cidade, estado_id }) {
    const [result] = await pool.query(
      `UPDATE m_endereco
       SET rua = ?, numero = ?, complemento = ?, bairro = ?, cidade = ?, estado_id = ?
       WHERE id = ?`,
      [rua, numero, complemento, bairro, cidade, estado_id, id],
    );

    return result.affectedRows > 0;
  },
};
