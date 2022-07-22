/*
  Warnings:

  - You are about to drop the `_disciplinesToteacherDisciplines` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_teacherDisciplinesToteachers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_teacherDisciplinesTotests` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `teacherDisciplines` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_disciplinesToteacherDisciplines" DROP CONSTRAINT "_disciplinesToteacherDisciplines_A_fkey";

-- DropForeignKey
ALTER TABLE "_disciplinesToteacherDisciplines" DROP CONSTRAINT "_disciplinesToteacherDisciplines_B_fkey";

-- DropForeignKey
ALTER TABLE "_teacherDisciplinesToteachers" DROP CONSTRAINT "_teacherDisciplinesToteachers_A_fkey";

-- DropForeignKey
ALTER TABLE "_teacherDisciplinesToteachers" DROP CONSTRAINT "_teacherDisciplinesToteachers_B_fkey";

-- DropForeignKey
ALTER TABLE "_teacherDisciplinesTotests" DROP CONSTRAINT "_teacherDisciplinesTotests_A_fkey";

-- DropForeignKey
ALTER TABLE "_teacherDisciplinesTotests" DROP CONSTRAINT "_teacherDisciplinesTotests_B_fkey";

-- DropTable
DROP TABLE "_disciplinesToteacherDisciplines";

-- DropTable
DROP TABLE "_teacherDisciplinesToteachers";

-- DropTable
DROP TABLE "_teacherDisciplinesTotests";

-- DropTable
DROP TABLE "teacherDisciplines";

-- CreateTable
CREATE TABLE "teachersDisciplines" (
    "id" SERIAL NOT NULL,
    "teacherId" TEXT NOT NULL,
    "disciplineId" INTEGER NOT NULL,

    CONSTRAINT "teachersDisciplines_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_teachersDisciplinesTotests" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_disciplinesToteachersDisciplines" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_teachersToteachersDisciplines" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_teachersDisciplinesTotests_AB_unique" ON "_teachersDisciplinesTotests"("A", "B");

-- CreateIndex
CREATE INDEX "_teachersDisciplinesTotests_B_index" ON "_teachersDisciplinesTotests"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_disciplinesToteachersDisciplines_AB_unique" ON "_disciplinesToteachersDisciplines"("A", "B");

-- CreateIndex
CREATE INDEX "_disciplinesToteachersDisciplines_B_index" ON "_disciplinesToteachersDisciplines"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_teachersToteachersDisciplines_AB_unique" ON "_teachersToteachersDisciplines"("A", "B");

-- CreateIndex
CREATE INDEX "_teachersToteachersDisciplines_B_index" ON "_teachersToteachersDisciplines"("B");

-- AddForeignKey
ALTER TABLE "_teachersDisciplinesTotests" ADD CONSTRAINT "_teachersDisciplinesTotests_A_fkey" FOREIGN KEY ("A") REFERENCES "teachersDisciplines"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_teachersDisciplinesTotests" ADD CONSTRAINT "_teachersDisciplinesTotests_B_fkey" FOREIGN KEY ("B") REFERENCES "tests"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_disciplinesToteachersDisciplines" ADD CONSTRAINT "_disciplinesToteachersDisciplines_A_fkey" FOREIGN KEY ("A") REFERENCES "disciplines"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_disciplinesToteachersDisciplines" ADD CONSTRAINT "_disciplinesToteachersDisciplines_B_fkey" FOREIGN KEY ("B") REFERENCES "teachersDisciplines"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_teachersToteachersDisciplines" ADD CONSTRAINT "_teachersToteachersDisciplines_A_fkey" FOREIGN KEY ("A") REFERENCES "teachers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_teachersToteachersDisciplines" ADD CONSTRAINT "_teachersToteachersDisciplines_B_fkey" FOREIGN KEY ("B") REFERENCES "teachersDisciplines"("id") ON DELETE CASCADE ON UPDATE CASCADE;
