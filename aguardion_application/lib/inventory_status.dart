import 'package:flutter/material.dart';

class InventoryStatusPage extends StatelessWidget {
  const InventoryStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Inventory',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  buildInventoryCard(
                    title: 'AMS - Base Station',
                    serial: '1001026',
                    status: 'Broken',
                    location: 'In Inventory',
                  ),
                  buildInventoryCard(
                    title: 'AMS - Base Station',
                    serial: '1003203',
                    status: 'Repair',
                    location: 'Installed',
                  ),
                  buildInventoryCard(
                    title: 'AMS - Base Station',
                    serial: '1009251',
                    status: 'Retired',
                    location: 'Installed',
                  ),
                  buildInventoryCard(
                    title: 'AMS - Base Station',
                    serial: '1010149',
                    status: 'Inactive',
                    location: 'On Truck',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInventoryCard({
    required String title,
    required String serial,
    required String status,
    required String location,
  }) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: Color(0xFF002A41)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6.0),
            Text('Serial: $serial'),
            const SizedBox(height: 4.0),
            Text('Status: $status'),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16.0),
                const SizedBox(width: 4.0),
                Text(location),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
