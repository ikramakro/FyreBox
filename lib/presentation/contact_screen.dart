import 'package:flutter/material.dart';

class ContactFyreBoxScreen extends StatelessWidget {
  const ContactFyreBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Subject:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter subject',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Priority:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
              ),
              hint: const Text('-- Select Priority --'),
              items: ['High', 'Medium', 'Low'].map((String priority) {
                return DropdownMenuItem<String>(
                  value: priority,
                  child: Text(priority),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle the selected value
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter description',
              ),
            ),
            const SizedBox(height: 24.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the submission
                },
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  // primary: Colors.blueGrey, // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}