-- CreateTable
CREATE TABLE "Author" (
    "ID" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "Biography" TEXT NOT NULL,

    CONSTRAINT "Author_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "Book" (
    "ID" SERIAL NOT NULL,
    "Title" TEXT NOT NULL,
    "ISBN" INTEGER NOT NULL,
    "authorID" INTEGER NOT NULL,
    "memberID" INTEGER NOT NULL,

    CONSTRAINT "Book_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "Member" (
    "ID" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "Address" TEXT NOT NULL,

    CONSTRAINT "Member_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "Genre" (
    "ID" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,

    CONSTRAINT "Genre_pkey" PRIMARY KEY ("ID")
);

-- CreateTable
CREATE TABLE "_BookToGenre" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_BookToGenre_AB_unique" ON "_BookToGenre"("A", "B");

-- CreateIndex
CREATE INDEX "_BookToGenre_B_index" ON "_BookToGenre"("B");

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_authorID_fkey" FOREIGN KEY ("authorID") REFERENCES "Author"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_memberID_fkey" FOREIGN KEY ("memberID") REFERENCES "Member"("ID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BookToGenre" ADD CONSTRAINT "_BookToGenre_A_fkey" FOREIGN KEY ("A") REFERENCES "Book"("ID") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BookToGenre" ADD CONSTRAINT "_BookToGenre_B_fkey" FOREIGN KEY ("B") REFERENCES "Genre"("ID") ON DELETE CASCADE ON UPDATE CASCADE;
