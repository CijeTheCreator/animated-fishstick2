//Schema
const mySchema
//Primitives
z.string();
z.number();
z.bigint();
z.boolean();
z.date();
z.symbol();

z.undefined();
z.null();
z.void(); // accepts undefined
z.array(z.string());
z.object({
  username: z.string(),
});

mySchema.safeParse("tuna");

const result = stringSchema.safeParse("billie");
if (!result.success) {
  (result.error)
  return
}
(result.data)

type User = z.infer<typeof User>;
export type User = z.infer<typeof User>;
const result = mySchema.safeParse(data);
if (!result.success) {
  (result.error)
  return
}
(result.data)
type User = z.infer<typeof User>;
export type User = z.infer<typeof User>;
