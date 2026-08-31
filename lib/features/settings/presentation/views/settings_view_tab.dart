import 'package:e_commerce_nti_project/core/utils/app_styles.dart';
import 'package:e_commerce_nti_project/features/settings/images_smooth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SettingsViewTab extends StatelessWidget {
  const SettingsViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 80.h,
            decoration: BoxDecoration(color: Colors.red),
            child: Row(
              children: [
                Icon(Icons.location_on, size: 30.h, color: Colors.white),
                Text("Snacks & Beverages", style: AppStyles.style18),
                Spacer(),
                Icon(Icons.shopping_cart, size: 30.h, color: Colors.white),
                Icon(Icons.search, size: 30.h, color: Colors.white),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Recipe.recipes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage: AssetImage(
                          Recipe.recipes[index].imageUrl,
                        ),
                      ),
                      Text(
                        Recipe.recipes[index].title,
                        style: AppStyles.style12,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          CustomImagesSliderSmooth(images: Recipe.recipesImages),
          Expanded(child: CustomListRecipesItems()),
        ],
      ),
    );
  }
}

class Recipe {
  final String imageUrl, title;

  Recipe({required this.imageUrl, required this.title});
  static List<Recipe> recipes = [
    Recipe(imageUrl: "assets/images/1.jpg", title: "Fish & Seafood"),
    Recipe(imageUrl: "assets/images/2.jpg", title: "chicken & Meat"),
    Recipe(imageUrl: "assets/images/3.jpg", title: "Meet & Poultry"),
    Recipe(imageUrl: "assets/images/4.jpg", title: "Snacks & Beverages"),
    Recipe(imageUrl: "assets/images/5.jpg", title: "Dairy & Eggs"),
    Recipe(imageUrl: "assets/images/6.jpg", title: "Fruits & Vegetables"),
    Recipe(imageUrl: "assets/images/7.jpg", title: "Bakery & Bread"),
  ];
  static List<String> recipesImages = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
  ];
}

class CustomListRecipesItems extends StatelessWidget {
  const CustomListRecipesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        itemCount: Recipe.recipes.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Recipe.recipes[index].imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Gap(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: Colors.red),
                    ),
                    child: CircleAvatar(radius: 1),
                  ),
                  Text(Recipe.recipes[index].title),
                  Text(Recipe.recipes[index].title),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("\$1000 "),
                          Text("\$1000", style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(child: Gap(1)),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 13,
                          child: Center(child: Icon(Icons.minimize)),
                        ),
                      ),
                      Gap(10),
                      Text("0", style: TextStyle(color: Colors.green)),
                      Gap(10),
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 13,
                          child: Center(child: Icon(Icons.add)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
