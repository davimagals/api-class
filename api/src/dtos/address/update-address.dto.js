import { z } from "zod";

export const UpdateAddressDTO = z.object({
  estado_id: z.number().int().min(1).max(27),

  cidade: z.string().trim().min(1).max(50),

  bairro: z.string().trim().min(1).max(50),

  rua: z.string().trim().min(1).max(100),

  numero: z.string().trim().max(10),

  complemento: z.string().trim().max(100),
});
