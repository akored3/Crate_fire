import 'package:crate_fire/constants.dart';
import 'package:crate_fire/utils/button.dart';
import 'package:crate_fire/views/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // I extended this scaffold behind the appBar and made it transparent ,
        // therefore the transparent appbar is blocking the "skip to login" button
        //How can i make it not block the button?
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/womanie.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    blackGradient.withOpacity(0.2),
                    primaryColor2.withOpacity(0.3),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: defaultPadding * 2,
                horizontal: defaultPadding,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // This TextButton doesn't work , why?
                    TextButton(
                      onPressed: () {
                        print('Testing');
                      },
                      child: const Text(
                        'Skip To Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding * 8,
                          vertical: defaultPadding,
                        ), // increase the padding
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

























// Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/womanie.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 blackGradient.withOpacity(0.2),
//                 primaryColor2.withOpacity(0.3),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           // child: Container(
//           //   color: Colors.white,
//           //   margin: const EdgeInsets.symmetric(
//           //     vertical: defaultPadding * 5,
//           //     horizontal: defaultPadding,
//           //   ),
//           //   width: MediaQuery.of(context).size.width,
//           //   height: MediaQuery.of(context).size.height,
//           //   child: Center(
//           //     child: Column(
//           //       children: [
//           //         //When this inkwell gets clicked it doesn't go to the route
//           //         InkWell(
//           //           onTap: () {
//           //             Navigator.pushNamed(context, signInRoute);
//           //           },
//           //           child: Text(
//           //             'Skip to Login',
//           //             style: Theme.of(context).textTheme.bodyMedium,
//           //           ),
//           //         )
//           //       ],
//           //     ),
//           //   ),
//           // ),
//         ),
//       ),