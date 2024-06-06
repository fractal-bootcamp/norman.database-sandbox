/*
  Warnings:

  - You are about to drop the column `Author` on the `Book` table. All the data in the column will be lost.
  - Added the required column `authorID` to the `Book` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
CREATE SEQUENCE author_id_seq;
ALTER TABLE "Author" ALTER COLUMN "ID" SET DEFAULT nextval('author_id_seq');
ALTER SEQUENCE author_id_seq OWNED BY "Author"."ID";

-- AlterTable
CREATE SEQUENCE book_id_seq;
ALTER TABLE "Book" DROP COLUMN "Author",
ADD COLUMN     "authorID" INTEGER NOT NULL,
ALTER COLUMN "ID" SET DEFAULT nextval('book_id_seq');
ALTER SEQUENCE book_id_seq OWNED BY "Book"."ID";

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_authorID_fkey" FOREIGN KEY ("authorID") REFERENCES "Author"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;
