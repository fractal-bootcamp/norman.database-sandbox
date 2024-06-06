/*
  Warnings:

  - You are about to drop the `Movie` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Movie";

-- CreateTable
CREATE TABLE "Book" (
    "ID" INTEGER NOT NULL,
    "Title" TEXT NOT NULL,
    "Author" TEXT NOT NULL,
    "ISBN" INTEGER NOT NULL,

    CONSTRAINT "Book_pkey" PRIMARY KEY ("ID")
);
