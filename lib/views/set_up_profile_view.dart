import 'package:crate_fire/constants/constants.dart';
import 'package:flutter/material.dart';

class SetProfile extends StatefulWidget {
  const SetProfile({super.key});

  @override
  State<SetProfile> createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  late final TextEditingController _fullName;
  late final TextEditingController _dateOfBirth;
  late final TextEditingController _gender;
  late final TextEditingController _country;

  @override
  void initState() {
    _fullName = TextEditingController();
    _dateOfBirth = TextEditingController();
    _gender = TextEditingController();
    _country = TextEditingController();
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

  Future<void> _pickDate(BuildContext context) async {
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
      body: Container(
        margin: const EdgeInsets.symmetric(
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
              child: Text('Let\'s set up your Profile',
                  style: Theme.of(context).textTheme.labelLarge),
            ),
            TextFormField(
              controller: _fullName,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Full name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: defaultPadding * 2,
                bottom: defaultPadding * 2,
              ),
              child: Row(
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
                      controller: _dateOfBirth,
                      // keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: 'Gender',
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
                ],
              ),
            ),
            TextFormField(
              controller: _dateOfBirth,
              // keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                hintText: 'Country',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  onPressed: () => _pickDate(context),
                  icon: const Icon(Icons.expand_more),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
