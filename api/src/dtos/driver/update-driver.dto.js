import { z } from "zod";

export const UpdateDriverDTO = z.object({
  nome: z.string().trim().min(1).max(50),

  data_nascimento: z.coerce.date(),
});
