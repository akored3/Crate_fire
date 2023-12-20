class ContentCategory {
  final String name;
  final String images;

  const ContentCategory({
    required this.name,
    required this.images,
  });
}

//How can i get the first 6 ContentCategory.name in a list and the remaining 6 ContentCategory.name into another list?
final List<ContentCategory> categories = [
  const ContentCategory(
    name: 'Lifestyle',
    images: 'assets/images/lifestyle.jpg',
  ),
  const ContentCategory(
    name: 'Social',
    images: 'assets/images/social.jpg',
  ),
  const ContentCategory(
    name: 'Technology',
    images: 'assets/images/technology.jpg',
  ),
  const ContentCategory(
    name: 'Food',
    images: 'assets/images/food.jpg',
  ),
  const ContentCategory(
    name: 'Entrepreneur',
    images: 'assets/images/entrepreneur.jpg',
  ),
  const ContentCategory(
    name: 'Education',
    images: 'assets/images/education.jpg',
  ),
  const ContentCategory(
    name: 'Travel',
    images: 'assets/images/travel.jpg',
  ),
  const ContentCategory(
    name: 'Photography',
    images: 'assets/images/photography.jpg',
  ),
  const ContentCategory(
    name: 'DIY(Do-It-Yourself)',
    images: 'assets/images/diy.jpg',
  ),
  const ContentCategory(
    name: 'Music',
    images: 'assets/images/music.jpg',
  ),
  const ContentCategory(
    name: 'Articles',
    images: 'assets/images/articles.jpg',
  ),
  const ContentCategory(
    name: 'Promotions',
    images: 'assets/images/promotions.jpg',
  ),
];

final List<String> categoryTitle =
    categories.map((category) => category.name).toList();

final List<String> categoryImage =
    categories.map((category) => category.images).toList();
