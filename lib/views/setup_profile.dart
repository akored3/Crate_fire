import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/service/auth/auth_service.dart';
import 'package:crate_fire/service/auth/bloc/auth_bloc.dart';
import 'package:crate_fire/service/auth/bloc/auth_event.dart';
import 'package:crate_fire/service/auth/bloc/auth_state.dart';
import 'package:crate_fire/service/cloud/firestore_provider.dart';
import 'package:crate_fire/utilities/button.dart';
import 'package:crate_fire/utilities/widgets/input_widget.dart';
import 'package:crate_fire/views/get_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SetUpProfile extends StatefulWidget {
  const SetUpProfile({super.key});

  @override
  State<SetUpProfile> createState() => _SetUpProfileState();
}

String get userId => AuthService.fireBase().currentUser!.id;

class _SetUpProfileState extends State<SetUpProfile> {
  late final TextEditingController _fullName;
  late final TextEditingController _dateOfBirth;
  late final TextEditingController _gender;
  late final TextEditingController _country;
  late double _buttonWidth;
  @override
  void initState() {
    _fullName = TextEditingController();
    _dateOfBirth = TextEditingController();
    _gender = TextEditingController();
    _country = TextEditingController();
    _buttonWidth = 10;
    super.initState();
  }

  @override
  void dispose() {
    _fullName.dispose();
    _dateOfBirth.dispose();
    _gender.dispose();
    _country.dispose();
    super.dispose();
  }

  DateTime _selectedDate = DateTime(2017);

  //function to pick date
  Future<void> _pickDate(
    BuildContext context,
  ) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateOfBirth.text = _selectedDate.toString();
      });
    }
  }

//Dialog to pick gender
  Future<void> _pickGender(BuildContext context) async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Select Gender'),
              actions: [
                TextButton(
                  onPressed: () {
                    _gender.text = 'Male';
                    Navigator.of(context).pop();
                  },
                  child: const Text('Male'),
                ),
                TextButton(
                  onPressed: () {
                    _gender.text = 'Female';
                    Navigator.of(context).pop();
                  },
                  child: const Text('Female'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'Personal Details',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: FirebaseFirestoreProvider.getUserdata(userId: userId),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final userData = snapshot.data!;
                  final username = userData['username'];
                  return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: defaultPadding + 5,
                        vertical: defaultPadding * 2,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: defaultPadding * 2),
                            height: MediaQuery.of(context).size.height / 20,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.white,
                            child: Text(
                              'Hello @$username let\'s set up your Profile',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                          UserDataInputField(
                            input: _fullName,
                            hintText: 'Full name',
                          ),
                          const SizedBox(
                            height: defaultPadding * 2,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  controller: _dateOfBirth,
                                  // keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    hintText: 'Date of Birth',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () => _pickDate(context),
                                      icon: const Icon(Icons.expand_more),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: _gender,
                                  decoration: InputDecoration(
                                    hintText: 'Gender',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () => _pickGender(context),
                                      icon: const Icon(Icons.expand_more),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: defaultPadding * 2,
                          ),
                          UserDataInputField(
                            input: _country,
                            hintText: 'Country',
                          ),
                          const SizedBox(
                            height: defaultPadding * 10,
                          ),
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              if (state is AuthStateSettingUpProfile) {
                                _buttonWidth = state.buttonWidth;
                              }
                              return Stack(
                                children: [
                                  GradientButton(
                                    gradient: const LinearGradient(
                                      colors: [blackGradient, blackGradient],
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                  ),
                                  GradientButton(
                                    gradient: const LinearGradient(
                                      colors: [primaryColor1, primaryColor2],
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    width: _buttonWidth,
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: TextButton(
                                        onPressed: () async {
                                          final fullName = _fullName.text;
                                          final dateOfBirth = _dateOfBirth.text;
                                          final gender = _gender.text;
                                          final country = _country.text;

                                          context
                                              .read<AuthBloc>()
                                              .add(AuthEventSetupUserProfile(
                                                fullName,
                                                dateOfBirth,
                                                gender,
                                                country,
                                              ));
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
                                ],
                              );
                            },
                          ),
                        ],
                      ));
                } else {
                  return const GetStartedPage();
                }
              default:
                return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
