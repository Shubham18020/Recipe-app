import 'package:flutter/material.dart';
import 'package:recipeapp/Componet/custom_app_bar.dart';
import 'package:recipeapp/Componet/search_tag.dart';
import 'package:recipeapp/Componet/text_field_widget.dart';
import 'package:recipeapp/screen/all_recipe.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Search',
        back: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: h * .016, horizontal: w * .032),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextFieldWidget(),
            SizedBox(
              height: h * .04,
            ),
            Text(
              'Search Tags',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: w * .06),
            ),
            Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tags.map((label) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AllRecipe(recipe: label)));
                      },
                      child: Text(label));
                }).toList())
          ],
        ),
      ),
    );
  }
}
