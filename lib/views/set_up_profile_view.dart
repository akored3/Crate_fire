import 'package:crate_fire/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class SetupProfilePage extends StatefulWidget {
  const SetupProfilePage({super.key});

  @override
  State<SetupProfilePage> createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends State<SetupProfilePage> {
  final TextEditingController _dateOfBirthController = TextEditingController();
  @override
  void dispose() {
    _dateOfBirthController.dispose();
    super.dispose;
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
            const MyTextInput(labelText: 'Full name'),
            DatePicker(
                controller: _dateOfBirthController, labelText: 'Date of birth')
          ],
        ),
      ),
    );
  }
}

//Can i have a date of birth picker in an input field like this?
class MyBeautifulTextInput extends StatelessWidget {
  final String hintText;
  final IconData icon;

  const MyBeautifulTextInput(
      {super.key, required this.hintText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(defaultPadding - 10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          icon: Icon(
            icon,
            color: Theme.of(context).accentColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class MyTextInput extends StatefulWidget {
  final String labelText;
  const MyTextInput({
    super.key,
    required this.labelText,
  });

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  late final TextEditingController _fullName;

  @override
  void initState() {
    _fullName = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fullName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _fullName,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

// Write this to use the scroll_date_picker package instead
// class CustomDateOfBirthFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   const CustomDateOfBirthFormField(
//       {super.key, required this.controller, required this.labelText});
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: TextInputType.datetime,
//       decoration: InputDecoration(
//         labelText: labelText,
//         hintText: 'DD/MM/YYYY',
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         prefixIcon: const Icon(Icons.calendar_today),
//       ),
//       validator: (value) {
//         if (value!.isEmpty) {
//           return 'Date of birth is required';
//         }
//         return null;
//       },
//     );
//   }
// }

class DatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  const DatePicker({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _selectedDate = DateTime(2000);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        hintText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: const Icon(Icons.expand_more),
      ),
      validator: (value) => value!.isEmpty ? 'Date of birth is required' : null,
      onTap: () async {
        final selectedDate = await showDialog(
          context: context,
          builder: (_) => ScrollDatePicker(
            selectedDate: _selectedDate,
            onDateTimeChanged: (newDate) {
              setState(() {
                _selectedDate = newDate;
              });
            },
          ),
        );
        if (selectedDate != null) {
          widget.controller.text =
              '${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year.toString()}';
        }
      },
    );
  }
}

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
            TextFormField(
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
            )
          ],
        ),
      ),
    );
  }
}
