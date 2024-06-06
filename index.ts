const { PrismaClient } = require('@prisma/client');
//import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {

    const author = await prisma.book.create({
      data: { Title: 'book2', ISBN: 8888, authorID: 3 }
    })

    const book = await prisma.book.update({
      where: { ID: 5 },
      data: { memberID: null },
    })

    const allbooks = await prisma.book.findMany()
    console.log(allbooks)
  }

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })



