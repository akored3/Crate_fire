import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/model/content_categories.dart';
import 'package:crate_fire/service/auth/auth_service.dart';
import 'package:crate_fire/service/cloud/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectContentCategoriesPage extends StatefulWidget {
  const SelectContentCategoriesPage({super.key});

  @override
  State<SelectContentCategoriesPage> createState() =>
      _SelectContentCategoriesPageState();
}

String get _userId => AuthService.fireBase().currentUser!.id;

class _SelectContentCategoriesPageState
    extends State<SelectContentCategoriesPage> {
  final List<String> _selectedCategories = [];

  void _selectCategories(String category) {
    setState(() {
      // _isTapped = !_isTapped;
      // if (_isTapped) {
      //   _selectedCategories.add(category);
      //   print(_selectedCategories);
      // }
      // if (!_isTapped) {
      //   _selectedCategories.remove(category);
      // }
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
    });
  }

  bool _isCategorySelected(String category) {
    return _selectedCategories.contains(category);
  }

  Future<void> _addUserCategories(
    List<String> category,
  ) async {
    await FirestoreService.fireStore().createContentCategory(
      userId: _userId,
      categories: _selectedCategories,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: defaultPadding + 1),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).brightness == Brightness.light
                ? bodyTextColorLightTheme
                : secondaryColorLightTheme,
          ),
        ),
        title: Text(
          'interests',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: defaultPadding * 2,
          left: defaultPadding + 5,
          right: defaultPadding + 5,
        ),
        // color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Let us know the categories of content you are interested in',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Select at least five categories from the options\nbelow. Slide left or right for more options',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: const Icon(
                  Icons.search,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _cat.length,
                itemBuilder: (context, index) {
                  final category = _cat[index];
                  final categoryName = category.name;
                  final categoryImage = category.images;

                  final isSelected = _isCategorySelected(categoryName);

                  return InkWell(
                    onTap: () => _selectCategories(categoryName),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      elevation: 5.0,
                      shadowColor: Colors.black,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                categoryImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              color: isSelected
                                  ? Colors.purple.withOpacity(0.2)
                                  : null,
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 45,
                              bottom: 0,
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: [
                                      TextSpan(text: categoryName),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<ContentCategory> _cat = [
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
