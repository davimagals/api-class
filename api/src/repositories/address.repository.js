import pool from "../database/index.js";

export const AddressRepository = {
  create: ({ rua, numero, complemento, bairro, cidade, estado_id }) => {
    return pool.query(
      `INSERT INTO m_endereco 
       (rua, numero, complemento, bairro, cidade, estado_id)
       VALUES (?, ?, ?, ?, ?, ?)`,
      [rua, numero, complemento, bairro, cidade, estado_id],
    );
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
