import pool from "../database/index.js";

export const AddressRepository = {
  create: ({ rua, numero, complemento, bairro, cidade, estado_id }) => {
    return pool.query(
      `INSERT INTO endereco 
       (rua, numero, complemento, bairro, cidade, estado_id)
       VALUES (?, ?, ?, ?, ?, ?)`,
      [rua, numero, complemento, bairro, cidade, estado_id],
    );
  },

  update: ({
    endereco_id,
    rua,
    numero,
    complemento,
    bairro,
    cidade,
    estado_id,
  }) => {
    return pool.query(
      `UPDATE endereco
       SET rua = ?, numero = ?, complemento = ?, bairro = ?, cidade = ?, estado_id = ?
       WHERE id = ?`,
      [rua, numero, complemento, bairro, cidade, estado_id, endereco_id],
    );
  },
};
