class CategoryModel {
  final String title;
  final String image;

  const CategoryModel({required this.title, required this.image});

  static const List<CategoryModel> categoriesListdark = [
    CategoryModel(title: "General", image: "assets/images/general.png"),
    CategoryModel(title: "Business", image: "assets/images/busniess.png"),
    CategoryModel(
      title: "Entertainment",
      image: "assets/images/entertainment.png",
    ),
    CategoryModel(title: "Health", image: "assets/images/helth.png"),
    CategoryModel(title: "Science", image: "assets/images/science.png"),
    CategoryModel(title: "Technology", image: "assets/images/technology.png"),
    CategoryModel(title: "Sport", image: "assets/images/sport.png"),
  ];

  static const List<CategoryModel> categoriesListLight = [
    CategoryModel(title: "General", image: "assets/images/general_dark.png"),
    CategoryModel(title: "Business", image: "assets/images/busniess_dark.png"),
    CategoryModel(
      title: "Entertainment",
      image: "assets/images/entertainment_dark.png",
    ),
    CategoryModel(title: "Health", image: "assets/images/helth_dark.png"),
    CategoryModel(title: "Science", image: "assets/images/science_dark.png"),
    CategoryModel(
      title: "Technology",
      image: "assets/images/technology_dark.png",
    ),
    CategoryModel(title: "Sports", image: "assets/images/sport_dark.png"),
  ];
}
