import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/service/auth/bloc/auth_bloc.dart';
import 'package:crate_fire/service/auth/bloc/auth_state.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:crate_fire/utilities/widgets/responsive_container.dart';
import 'package:crate_fire/views/import_ig_friends_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ImportFriendsView extends StatefulWidget {
  const ImportFriendsView({super.key});

  @override
  State<ImportFriendsView> createState() => _ImportFriendsViewState();
}

class _ImportFriendsViewState extends State<ImportFriendsView> {
  bool isInstagramTapped = false;
  bool isFacebookTapped = false;

  late double _buttonWidth;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).brightness == Brightness.light
                ? bodyTextColorLightTheme
                : secondaryColorLightTheme,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Import friends',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            const Text(
              'Skip',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
      body: ResponsiveContainer(
        desiredHeightInPixels: screenHeight,
        desiredWidthInPixels: screenWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Which contacts do you want\nto import?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Choose as many as you like we will merge\nduplicate entries',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: (() {
                  setState(() {
                    isFacebookTapped = !isFacebookTapped;
                    isInstagramTapped = false;
                  });
                }),
                child: ResponsiveContainer(
                  desiredWidthInPixels: screenWidth,
                  desiredHeightInPixels: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey,
                      ),
                      color:
                          isFacebookTapped ? primaryColor1 : bgColorDarkTheme,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        IconButton(
                          onPressed: (() {}),
                          icon: FaIcon(
                            FontAwesomeIcons.facebook,
                            color: isFacebookTapped
                                ? secondaryColorLightTheme
                                : primaryColor2,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Facebook Friends',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: (() {
                  setState(() {
                    isInstagramTapped = !isInstagramTapped;
                    isFacebookTapped = false;
                  });
                }),
                child: ResponsiveContainer(
                  desiredWidthInPixels: screenWidth,
                  desiredHeightInPixels: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey,
                      ),
                      color:
                          isInstagramTapped ? primaryColor1 : bgColorDarkTheme,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        IconButton(
                          onPressed: (() {}),
                          icon: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: isInstagramTapped
                                ? secondaryColorLightTheme
                                : primaryColor2,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Instagram connections',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                if (state is AuthStateImportFriends) {
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
                              if (isInstagramTapped) {
                                return showDialog(
                                    context: context,
                                    builder: ((context) =>
                                        const CustomLoginDialog()));
                              }
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
              }),
            ],
          ),
        ),
      ),
    );
  }
}
