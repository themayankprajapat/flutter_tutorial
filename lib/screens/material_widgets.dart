import 'package:flutter/material.dart';
import 'package:flutter_tutorial/utils/my_shared.dart';

enum Gender { male, female, other }

class MaterialWidgets extends StatefulWidget {
  const MaterialWidgets({super.key});

  @override
  State<MaterialWidgets> createState() => _MaterialWidgetsState();
}

class _MaterialWidgetsState extends State<MaterialWidgets> {
  int selectedGender = 0;
  final genders = ['Male', "female", 'other'];
  // double _currentSliderValue = 20;

  bool light = false;
  String? time;
  String? date;

  @override
  void initState() {
    super.initState();
    MyShared.instance.getBool('light_theme').then((value) {
      setState(() {
        light = value ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light ? Colors.white : Colors.black,
      appBar: AppBar(title: const Text('Material Widgets')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Badge(
            //   label: Text('2'),
            //   child: Icon(Icons.shopping_cart_sharp),
            // ),
            // GestureDetector(
            //   onTap: () async {
            //     final pickedDate = await showDatePicker(
            //       context: context,
            //       initialDate: DateTime.now(),
            //       firstDate: DateTime.now().subtract(const Duration(days: 730)),
            //       lastDate: DateTime.now().add(const Duration(days: 730)),
            //     );
            //     if (pickedDate != null) {
            //       setState(() {
            //         date = pickedDate.toDate();
            //       });
            //     }
            //   },
            //   child: Text(date ?? 'Pick date'),
            // ),

            // GestureDetector(
            //   onTap: () async {
            //     final myTime = await showTimePicker(
            //       context: context,
            //       initialTime: TimeOfDay.now(),
            //     );
            //     if (myTime != null) {
            //       setState(() {
            //         time = myTime.toTime();
            //       });
            //     }
            //   },
            //   child: Text(time ?? 'Pick Time'),
            // ),
            // IconButton(
            //   onPressed: () {
            //     Utils.showSnack('text');
            //   },
            //   icon: const Icon(Icons.shopping_cart_sharp),
            // ),
            // // Chip(
            //   // avatar: CircleAvatar(
            //   //   backgroundColor: Colors.grey.shade800,
            //   //   child: const Text('AB'),
            //   // ),
            //   label: const Text('Aaron Burr'),
            // )

            // ...List.generate(
            //   genders.length,
            //   (index) => RadioListTile(
            //     title: Text(genders[index]),
            //     value: index,
            //     groupValue: selectedGender,
            //     onChanged: (value) {
            //       setState(() {
            //         selectedGender = value!;
            //       });
            //     },
            //   ),
            // ),
            // Slider(
            //   value: _currentSliderValue,
            //   max: 100,
            //   divisions: 10,
            //   label: _currentSliderValue.round().toString(),
            //   onChanged: (double value) {
            //     setState(() {
            //       _currentSliderValue = value;
            //     });
            //   },
            // ),
            Switch(
              // This bool value toggles the switch.
              value: light,
              // activeColor: Colors.red,
              onChanged: (bool value) {
                // This is called when the user toggles the switch.
                setState(() {
                  light = value;
                });
                MyShared.instance.setBool('light_theme', value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
