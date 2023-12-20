import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/model/content_categories.dart';
import 'package:crate_fire/service/auth/bloc/auth_bloc.dart';
import 'package:crate_fire/service/auth/bloc/auth_event.dart';
import 'package:crate_fire/service/auth/bloc/auth_state.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:crate_fire/utilities/widgets/responsive_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectContentCategoriesPage extends StatefulWidget {
  const SelectContentCategoriesPage({
    super.key,
  });

  @override
  State<SelectContentCategoriesPage> createState() =>
      _SelectContentCategoriesPageState();
}

class _SelectContentCategoriesPageState
    extends State<SelectContentCategoriesPage> {
  final List<String> selectedCategories = [];

  void _selectCategory(String categoryName) {
    setState(() {
      if (selectedCategories.contains(categoryName)) {
        selectedCategories.remove(categoryName);
      } else {
        selectedCategories.add(categoryName);
      }
    });
  }

  bool _isCategorySelected(String categorName) {
    return selectedCategories.contains(categorName);
  }

  late double _buttonWidth;

  late final PageController _categoryGridController;
  int _currentGrid = 0;

  @override
  void initState() {
    _categoryGridController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _categoryGridController.dispose();
    super.dispose();
  }

  void _nextGrid() {
    if (_currentGrid < 1) {
      _categoryGridController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    }
    setState(() {
      _currentGrid++;
    });
  }

  void _previousGrid() {
    if (_currentGrid > 0) {
      _categoryGridController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceOut,
      );
    }
    setState(() {
      _currentGrid--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

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
          'Interests',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          desiredWidthInPixels: screenWidth,
          desiredHeightInPixels: screenHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
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
                  height: 30,
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
                LayoutBuilder(builder: ((context, constraint) {
                  if (screenHeight >= 600) {
                    return ResponsiveContainer(
                      desiredWidthInPixels: screenWidth,
                      desiredHeightInPixels: 310,
                      child: PageView(
                        controller: _categoryGridController,
                        onPageChanged: (int grid) {
                          setState(() {
                            _currentGrid = grid;
                          });
                        },
                        children: [
                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              childAspectRatio: 1.8,
                              mainAxisSpacing: 1.5,
                            ),
                            itemCount: categories.sublist(0, 6).length,
                            itemBuilder: ((context, index) {
                              final categoryTitleX =
                                  categoryTitle.sublist(0, 6)[index];
                              final categoryImageX =
                                  categoryImage.sublist(0, 6)[index];
                              final isSelected =
                                  _isCategorySelected(categoryTitleX);

                              return InkWell(
                                onTap: () {
                                  _selectCategory(categoryTitleX);
                                },
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
                                            categoryImageX,
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
                                            child: Center(
                                              child: RichText(
                                                text: TextSpan(
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: categoryTitleX,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              childAspectRatio: 1.8,
                              mainAxisSpacing: 1.5,
                            ),
                            itemCount: categories.sublist(0, 6).length,
                            itemBuilder: ((context, index) {
                              final categoryTitleX =
                                  categoryTitle.sublist(6, 12)[index];
                              final categoryImageX =
                                  categoryImage.sublist(6, 12)[index];
                              final isSelected =
                                  _isCategorySelected(categoryTitleX);

                              return InkWell(
                                onTap: () {
                                  _selectCategory(categoryTitleX);
                                },
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
                                            categoryImageX,
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
                                            child: Center(
                                              child: RichText(
                                                text: TextSpan(
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: categoryTitleX,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ResponsiveContainer(
                      desiredWidthInPixels: screenWidth,
                      desiredHeightInPixels: 240,
                      child: PageView(
                        controller: _categoryGridController,
                        onPageChanged: (int grid) {
                          setState(() {
                            _currentGrid = grid;
                          });
                        },
                        children: [
                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              childAspectRatio: 1.8,
                              mainAxisSpacing: 1.5,
                            ),
                            itemCount: categories.sublist(0, 6).length,
                            itemBuilder: ((context, index) {
                              final categoryTitleX =
                                  categoryTitle.sublist(0, 6)[index];
                              final categoryImageX =
                                  categoryImage.sublist(0, 6)[index];
                              final isSelected =
                                  _isCategorySelected(categoryTitleX);

                              return InkWell(
                                onTap: () {
                                  _selectCategory(categoryTitleX);
                                },
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
                                            categoryImageX,
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
                                            child: Center(
                                              child: RichText(
                                                text: TextSpan(
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: categoryTitleX,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              childAspectRatio: 1.8,
                              mainAxisSpacing: 1.5,
                            ),
                            itemCount: categories.sublist(0, 6).length,
                            itemBuilder: ((context, index) {
                              final categoryTitleX =
                                  categoryTitle.sublist(6, 12)[index];
                              final categoryImageX =
                                  categoryImage.sublist(6, 12)[index];
                              final isSelected =
                                  _isCategorySelected(categoryTitleX);

                              return InkWell(
                                onTap: () {
                                  _selectCategory(categoryTitleX);
                                },
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
                                            categoryImageX,
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
                                            child: Center(
                                              child: RichText(
                                                text: TextSpan(
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: categoryTitleX,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    );
                  }
                })),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: ResponsiveContainer(
                    desiredWidthInPixels: 150,
                    desiredHeightInPixels: 20,
                    // color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => _previousGrid(),
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        IconButton(
                          onPressed: () => _nextGrid(),
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthStateSelectContentCategories) {
                      _buttonWidth = state.buttonWidth;
                    }
                    return Stack(
                      children: [
                        const GradientButton(
                          gradient: LinearGradient(
                            colors: [blackGradient, blackGradient],
                          ),
                          height: 50,
                        ),
                        GradientButton(
                          gradient: const LinearGradient(
                            colors: [primaryColor1, primaryColor2],
                          ),
                          height: 50,
                          width: _buttonWidth,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Center(
                              child: TextButton(
                                onPressed: () async {
                                  context.read<AuthBloc>().add(
                                        AuthEventChooseContentCategories(
                                          selectedCategories,
                                        ),
                                      );
                                },
                                child: RichText(
                                  text: TextSpan(
                                      style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: const [
                                        TextSpan(text: 'NEXT'),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
