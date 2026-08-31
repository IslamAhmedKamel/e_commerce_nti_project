class OnboardingModel {
  final String title, description, image;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
  static List<OnboardingModel> onboardinList = [
    OnboardingModel(
      title: "Discover the Latest\nFashion Trends",
      description:
          "Explore our curated collection of\npremium clothing for every style.",
      image: "assets/images/onboarding1.png",
    ),
    OnboardingModel(
      title: "Discover the Latest\nFashion Trends",
      description:
          "Explore our curated collection of\npremium clothing for every style.",
      image: "assets/images/onboarding2.png",
    ),
    OnboardingModel(
      title: "Discover the Latest\nFashion Trends",
      description:
          "Explore our curated collection of\npremium clothing for every style.",
      image: "assets/images/onboarding3.png",
    ),
  ];
}
