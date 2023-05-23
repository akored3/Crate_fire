class ContentCategory {
  final String name;
  final String images;

  const ContentCategory({
    required this.name,
    required this.images,
  });
}

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
];
