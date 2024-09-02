import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3), // Same background color as Dashboard
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Assignments',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list, size: 30),
                    onPressed: () {
                      // Handle filter icon press
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              buildAssignmentCard('Aaron Selly', '1717 Prairie Ave SW, Fairbault, Minnesota 55021', 'Install', const Color(0xFFC47777)), // Green background for Install
              const SizedBox(height: 16),
              buildAssignmentCard('Aaron Selly', '1717 Prairie Ave SW, Fairbault, Minnesota 55021', 'Dispatch', const Color(0xFFC47777)), // Red background for Dispatch
              const SizedBox(height: 16),
              buildAssignmentCard('Aaron Selly', '1717 Prairie Ave SW, Fairbault, Minnesota 55021', 'Install', const Color(0xFF749174)), // Green background for Install
              const SizedBox(height: 16),
              buildAssignmentCard('Aaron Selly', '1717 Prairie Ave SW, Fairbault, Minnesota 55021', 'Dispatch', const Color(0xFFFFFFFF)), // Grey background with black text
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAssignmentCard(String name, String address, String status, Color buttonColor) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: buttonColor, width: 1.5), // Border color based on status
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              address,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: buttonColor, // Button background color
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 14,
                    color: buttonColor == const Color(0xFFFFFFFF) ? Colors.black : Colors.white, // Black text for grey button, white for others
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
