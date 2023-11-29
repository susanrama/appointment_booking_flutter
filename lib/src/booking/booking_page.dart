import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BoookingPage extends StatefulWidget {
  const BoookingPage({super.key});

  @override
  State<BoookingPage> createState() => _BoookingPageState();
}

class _BoookingPageState extends State<BoookingPage> {
  static const List<String> locations = <String>[
    'Espoo',
    'Espoo Matinkylä',
    'Espoo Niittykumpu',
    'Espoo Tapiola'
  ];
  static const List<String> services = <String>[
    'General Practitioner',
    'Dr. Olivia Whitman',
    'Dr. Marcus Turner',
    'Gynecologist',
    'Dr. Jasmine Patel',
    'Physiotherapist',
    'Dr. James Smith',
  ];

  DateTime selectedDate = DateTime.now();
  String selectedLocation = locations.first;
  String selectedService = services.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookingPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownMenu(
                initialSelection: selectedLocation,
                label: const Text('Location'),
                trailingIcon: const SizedBox.shrink(),
                selectedTrailingIcon: const Icon(Icons.highlight_off),
                enableSearch: true,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    selectedLocation = value!;
                  });
                },
                width: MediaQuery.of(context).size.width * 0.8,
                dropdownMenuEntries:
                    locations.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList()),
            const SizedBox(height: 20),
            DropdownMenu(
                initialSelection: selectedService,
                label: const Text('Service'),
                trailingIcon: const SizedBox.shrink(),
                selectedTrailingIcon: const Icon(Icons.highlight_off),
                enableSearch: true,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    selectedLocation = value!;
                  });
                },
                width: MediaQuery.of(context).size.width * 0.8,
                dropdownMenuEntries:
                    services.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList()),
            const SizedBox(height: 20),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: InkWell(
                    onTap: () async {
                      final newDateTime = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 90)));
                      setState(() {
                        selectedDate = newDateTime!;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(DateFormat('dd/MM/yyyy').format(selectedDate)),
                          const Icon(Icons.calendar_month)
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: -12,
                  child: Container(
                      color: const Color.fromRGBO(254, 247, 255, 1),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        'Date',
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
