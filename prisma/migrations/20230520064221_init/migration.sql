-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "avatarUrl" TEXT NOT NULL,
    "fullName" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Recipe" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "ingredients" TEXT[],
    "prepTime" TEXT NOT NULL,
    "calories" INTEGER,
    "userId" TEXT,

    CONSTRAINT "Recipe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MealPlan" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "startDate" TEXT NOT NULL,
    "endDate" TEXT NOT NULL,

    CONSTRAINT "MealPlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShoppingPlan" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "items" TEXT[],

    CONSTRAINT "ShoppingPlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_userRecipes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_userFavorites" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_recipeMealPlans" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_userMealPlans" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_userShoppingPlans" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_userRecipes_AB_unique" ON "_userRecipes"("A", "B");

-- CreateIndex
CREATE INDEX "_userRecipes_B_index" ON "_userRecipes"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_userFavorites_AB_unique" ON "_userFavorites"("A", "B");

-- CreateIndex
CREATE INDEX "_userFavorites_B_index" ON "_userFavorites"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_recipeMealPlans_AB_unique" ON "_recipeMealPlans"("A", "B");

-- CreateIndex
CREATE INDEX "_recipeMealPlans_B_index" ON "_recipeMealPlans"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_userMealPlans_AB_unique" ON "_userMealPlans"("A", "B");

-- CreateIndex
CREATE INDEX "_userMealPlans_B_index" ON "_userMealPlans"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_userShoppingPlans_AB_unique" ON "_userShoppingPlans"("A", "B");

-- CreateIndex
CREATE INDEX "_userShoppingPlans_B_index" ON "_userShoppingPlans"("B");

-- AddForeignKey
ALTER TABLE "Recipe" ADD CONSTRAINT "Recipe_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_userRecipes" ADD CONSTRAINT "_userRecipes_A_fkey" FOREIGN KEY ("A") REFERENCES "Recipe"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_userRecipes" ADD CONSTRAINT "_userRecipes_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_userFavorites" ADD CONSTRAINT "_userFavorites_A_fkey" FOREIGN KEY ("A") REFERENCES "Recipe"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_userFavorites" ADD CONSTRAINT "_userFavorites_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_recipeMealPlans" ADD CONSTRAINT "_recipeMealPlans_A_fkey" FOREIGN KEY ("A") REFERENCES "MealPlan"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_recipeMealPlans" ADD CONSTRAINT "_recipeMealPlans_B_fkey" FOREIGN KEY ("B") REFERENCES "Recipe"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_userMealPlans" ADD CONSTRAINT "_userMealPlans_A_fkey" FOREIGN KEY ("A") REFERENCES "MealPlan"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_userMealPlans" ADD CONSTRAINT "_userMealPlans_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_userShoppingPlans" ADD CONSTRAINT "_userShoppingPlans_A_fkey" FOREIGN KEY ("A") REFERENCES "ShoppingPlan"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_userShoppingPlans" ADD CONSTRAINT "_userShoppingPlans_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
