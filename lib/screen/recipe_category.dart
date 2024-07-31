import 'package:flutter/material.dart';
import 'package:recipeapp/Componet/recipe_category_view.dart';
import 'package:recipeapp/constant/catergory_list.dart';
import 'package:recipeapp/screen/all_recipe.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: h * .06,
            ),
            Text(
              'For You',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .06),
            ),
            SizedBox(
              height: h * .01,
            ),
            SizedBox(
              height: h * .106,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeCategoryView(image: image[0], name: name[0]),
                  RecipeCategoryView(image: image[1], name: name[1]),
                  RecipeCategoryView(image: image[2], name: name[2]),
                  RecipeCategoryView(image: image[3], name: name[3]),
                ],
              ),
            ),
            SizedBox(
              height: h * .01,
            ),
            Text(
              'Your Favourite',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .055),
            ),
            SizedBox(
              height: h * .45,
              child: GridView.builder(
                  itemCount: categoryImage.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: h * .01,
                    mainAxisSpacing: w * .021,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AllRecipe(recipe: categories[index])));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: h * .043,
                                width: w * .08,
                                child: Image.asset(categoryImage[index]),
                              ),
                              SizedBox(
                                height: h * .003,
                              ),
                              Text(
                                categories[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Text(
              'Your Preference',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .055),
            ),
            SizedBox(
              height: h * .13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeCategoryView(image: image[0], name: 'Easy'),
                  RecipeCategoryView(image: image[1], name: 'Quick'),
                  RecipeCategoryView(image: image[2], name: 'Meat'),
                  RecipeCategoryView(image: image[3], name: 'Low fat'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
