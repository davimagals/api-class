import { z } from "zod";

export const UpdateDriverDTO = z.object({
  nome: z.string().trim().min(3).optional(),

  data_nascimento: z
    .string()
    .refine((val) => !isNaN(Date.parse(val)), {
      message: "Data inválida",
    })
    .optional(),

  rua: z.string().trim().min(1).optional(),
  numero: z.coerce.number().optional(),
  complemento: z.string().trim().optional(),
  bairro: z.string().trim().min(1).optional(),
  cidade: z.string().trim().min(1).optional(),
  estado_id: z.coerce.number().int().positive().optional(),
});
