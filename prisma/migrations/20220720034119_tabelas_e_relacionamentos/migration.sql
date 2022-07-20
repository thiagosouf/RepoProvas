/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `users` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- CreateTable
CREATE TABLE "categories" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tests" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "pdfUrl" TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL,
    "teacherDisciplineId" INTEGER NOT NULL,

    CONSTRAINT "tests_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacherDisciplines" (
    "id" SERIAL NOT NULL,
    "teacheriD" TEXT NOT NULL,
    "disciplineId" INTEGER NOT NULL,

    CONSTRAINT "teacherDisciplines_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "disciplines" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "termId" INTEGER NOT NULL,

    CONSTRAINT "disciplines_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "terms" (
    "id" SERIAL NOT NULL,
    "number" INTEGER NOT NULL,

    CONSTRAINT "terms_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teachers" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "teachers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_categoriesTotests" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_teacherDisciplinesTotests" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_teacherDisciplinesToteachers" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_disciplinesToteacherDisciplines" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_disciplinesToterms" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_categoriesTotests_AB_unique" ON "_categoriesTotests"("A", "B");

-- CreateIndex
CREATE INDEX "_categoriesTotests_B_index" ON "_categoriesTotests"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_teacherDisciplinesTotests_AB_unique" ON "_teacherDisciplinesTotests"("A", "B");

-- CreateIndex
CREATE INDEX "_teacherDisciplinesTotests_B_index" ON "_teacherDisciplinesTotests"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_teacherDisciplinesToteachers_AB_unique" ON "_teacherDisciplinesToteachers"("A", "B");

-- CreateIndex
CREATE INDEX "_teacherDisciplinesToteachers_B_index" ON "_teacherDisciplinesToteachers"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_disciplinesToteacherDisciplines_AB_unique" ON "_disciplinesToteacherDisciplines"("A", "B");

-- CreateIndex
CREATE INDEX "_disciplinesToteacherDisciplines_B_index" ON "_disciplinesToteacherDisciplines"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_disciplinesToterms_AB_unique" ON "_disciplinesToterms"("A", "B");

-- CreateIndex
CREATE INDEX "_disciplinesToterms_B_index" ON "_disciplinesToterms"("B");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- AddForeignKey
ALTER TABLE "_categoriesTotests" ADD CONSTRAINT "_categoriesTotests_A_fkey" FOREIGN KEY ("A") REFERENCES "categories"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_categoriesTotests" ADD CONSTRAINT "_categoriesTotests_B_fkey" FOREIGN KEY ("B") REFERENCES "tests"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_teacherDisciplinesTotests" ADD CONSTRAINT "_teacherDisciplinesTotests_A_fkey" FOREIGN KEY ("A") REFERENCES "teacherDisciplines"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_teacherDisciplinesTotests" ADD CONSTRAINT "_teacherDisciplinesTotests_B_fkey" FOREIGN KEY ("B") REFERENCES "tests"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_teacherDisciplinesToteachers" ADD CONSTRAINT "_teacherDisciplinesToteachers_A_fkey" FOREIGN KEY ("A") REFERENCES "teacherDisciplines"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_teacherDisciplinesToteachers" ADD CONSTRAINT "_teacherDisciplinesToteachers_B_fkey" FOREIGN KEY ("B") REFERENCES "teachers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_disciplinesToteacherDisciplines" ADD CONSTRAINT "_disciplinesToteacherDisciplines_A_fkey" FOREIGN KEY ("A") REFERENCES "disciplines"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_disciplinesToteacherDisciplines" ADD CONSTRAINT "_disciplinesToteacherDisciplines_B_fkey" FOREIGN KEY ("B") REFERENCES "teacherDisciplines"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_disciplinesToterms" ADD CONSTRAINT "_disciplinesToterms_A_fkey" FOREIGN KEY ("A") REFERENCES "disciplines"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_disciplinesToterms" ADD CONSTRAINT "_disciplinesToterms_B_fkey" FOREIGN KEY ("B") REFERENCES "terms"("id") ON DELETE CASCADE ON UPDATE CASCADE;
