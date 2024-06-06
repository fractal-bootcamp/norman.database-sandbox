-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_memberID_fkey";

-- AlterTable
ALTER TABLE "Book" ALTER COLUMN "memberID" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_memberID_fkey" FOREIGN KEY ("memberID") REFERENCES "Member"("ID") ON DELETE SET NULL ON UPDATE CASCADE;
