import { z } from "zod";

export const CreateDriverDTO = z.object({
  cnh: z.string().regex(/^\d{11}$/, "CNH deve ter 11 dígitos"),

  nome: z.string().trim().min(3),

  data_nascimento: z.string().refine((val) => !isNaN(Date.parse(val)), {
    message: "Data inválida",
  }),

  rua: z.string().trim().min(1),
  numero: z.coerce.number(),

  complemento: z.string().trim().optional(),

  bairro: z.string().trim().min(1),
  cidade: z.string().trim().min(1),

  estado_id: z.coerce.number().int().positive(),
});
