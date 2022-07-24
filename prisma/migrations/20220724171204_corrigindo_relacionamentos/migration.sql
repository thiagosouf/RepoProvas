/*
  Warnings:

  - You are about to drop the `_categoriesTotests` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_disciplinesToteachersDisciplines` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_disciplinesToterms` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_teachersDisciplinesTotests` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_teachersToteachersDisciplines` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_categoriesTotests" DROP CONSTRAINT "_categoriesTotests_A_fkey";

-- DropForeignKey
ALTER TABLE "_categoriesTotests" DROP CONSTRAINT "_categoriesTotests_B_fkey";

-- DropForeignKey
ALTER TABLE "_disciplinesToteachersDisciplines" DROP CONSTRAINT "_disciplinesToteachersDisciplines_A_fkey";

-- DropForeignKey
ALTER TABLE "_disciplinesToteachersDisciplines" DROP CONSTRAINT "_disciplinesToteachersDisciplines_B_fkey";

-- DropForeignKey
ALTER TABLE "_disciplinesToterms" DROP CONSTRAINT "_disciplinesToterms_A_fkey";

-- DropForeignKey
ALTER TABLE "_disciplinesToterms" DROP CONSTRAINT "_disciplinesToterms_B_fkey";

-- DropForeignKey
ALTER TABLE "_teachersDisciplinesTotests" DROP CONSTRAINT "_teachersDisciplinesTotests_A_fkey";

-- DropForeignKey
ALTER TABLE "_teachersDisciplinesTotests" DROP CONSTRAINT "_teachersDisciplinesTotests_B_fkey";

-- DropForeignKey
ALTER TABLE "_teachersToteachersDisciplines" DROP CONSTRAINT "_teachersToteachersDisciplines_A_fkey";

-- DropForeignKey
ALTER TABLE "_teachersToteachersDisciplines" DROP CONSTRAINT "_teachersToteachersDisciplines_B_fkey";

-- DropTable
DROP TABLE "_categoriesTotests";

-- DropTable
DROP TABLE "_disciplinesToteachersDisciplines";

-- DropTable
DROP TABLE "_disciplinesToterms";

-- DropTable
DROP TABLE "_teachersDisciplinesTotests";

-- DropTable
DROP TABLE "_teachersToteachersDisciplines";

-- AddForeignKey
ALTER TABLE "tests" ADD CONSTRAINT "tests_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tests" ADD CONSTRAINT "tests_teacherDisciplineId_fkey" FOREIGN KEY ("teacherDisciplineId") REFERENCES "teachersDisciplines"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teachersDisciplines" ADD CONSTRAINT "teachersDisciplines_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES "teachers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teachersDisciplines" ADD CONSTRAINT "teachersDisciplines_disciplineId_fkey" FOREIGN KEY ("disciplineId") REFERENCES "disciplines"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "disciplines" ADD CONSTRAINT "disciplines_termId_fkey" FOREIGN KEY ("termId") REFERENCES "terms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
