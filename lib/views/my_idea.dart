// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:crate_fire/utilities/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class MyIdea extends StatelessWidget {
  const MyIdea({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Hello'),
                Text('Testing'),
                Text('another one'),
              ],
            ),
          ),
          Stack(
            children: [
              GradientButton(
                gradient: LinearGradient(
                  colors: [blackGradient, blackGradient],
                ),
                width: 200,
                height: 50,
              ),
              GradientButton(
                gradient: LinearGradient(
                  colors: [primaryColor1, primaryColor2],
                ),
                width: 100,
                height: 50,
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Text(
                    'NEXT',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyIdeaWorks extends StatefulWidget {
  const MyIdeaWorks({super.key});

  @override
  State<MyIdeaWorks> createState() => _MyIdeaWorksState();
}

class _MyIdeaWorksState extends State<MyIdeaWorks> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _country = TextEditingController();

  @override
  void dispose() {
    _fullName.dispose();
    _dateOfBirth.dispose();
    _gender.dispose();
    _country.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultPadding + 5,
            vertical: defaultPadding * 2,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: defaultPadding * 2),
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width,
                // color: Colors.white,
                child: Text('Hello @ let\'s set up your Profile',
                    style: Theme.of(context).textTheme.labelLarge),
              ),
              UserDataInputField(
                //it throws an error that _fullName hasn't been initialized
                input: _fullName,
                hintText: 'Full name',
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: UserDataInputField(
                      //it throws an error that _fullName hasn't been initialized
                      input: _fullName,
                      hintText: 'Date of birth',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: UserDataInputField(
                      //it throws an error that _fullName hasn't been initialized
                      input: _fullName,
                      hintText: 'Gender',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              UserDataInputField(
                input: _country,
                hintText: 'Full name',
              ),
              const SizedBox(
                height: defaultPadding * 20,
              ),
              Stack(
                children: [
                  GradientButton(
                    gradient: LinearGradient(
                      colors: [blackGradient, blackGradient],
                    ),
                    width: 200,
                    height: 50,
                  ),
                  GradientButton(
                    gradient: LinearGradient(
                      colors: [primaryColor1, primaryColor2],
                    ),
                    width: 100,
                    height: 50,
                  ),
                  //how do i put this text right in the middle of the stack?
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        'NEXT',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
