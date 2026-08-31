import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class CustomImagesSliderSmooth extends StatelessWidget {
  const CustomImagesSliderSmooth({super.key, required this.images});
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ImageSlideshow(
        width: double.infinity,
        initialPage: 0,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        onPageChanged: (value) {},
        autoPlayInterval: 3000,
        isLoop: true,
        children: images
            .map(
              (element) => SizedBox(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(element, fit: BoxFit.cover),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
