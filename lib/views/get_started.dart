import 'package:crate_fire/constants.dart';
import 'package:crate_fire/views/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//How can i add a text button at the top of this page that navigates to another page
class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/womanie.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
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
          // child: Container(
          //   color: Colors.black,
          //   margin: const EdgeInsets.symmetric(
          //     vertical: defaultPadding * 5,
          //     horizontal: defaultPadding,
          //   ),
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   child: Center(
          //     child: Column(
          //       children: [
          //         //When this inkwell gets clicked it doesn't go to the route
          //         InkWell(
          //           onTap: () {
          //             Navigator.pushNamed(context, signInRoute);
          //           },
          //           child: Text(
          //             'Skip to Login',
          //             style: Theme.of(context).textTheme.bodyMedium,
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
