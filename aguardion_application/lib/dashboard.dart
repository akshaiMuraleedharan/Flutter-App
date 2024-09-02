import 'package:flutter/material.dart';
import 'inventory.dart';
import 'inventory_status.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'aguardion',
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
          backgroundColor: const Color(0xFF002A41),
          automaticallyImplyLeading: false, // Hides the back button
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.grey),
              onPressed: () {
                // Handle notification icon press
                showToast(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.grey),
              onPressed: () {
                // Handle profile icon press
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            buildDashboardContent(),
            const InventoryPage(),
            const InventoryStatusPage(),
            const Center(child: Text('Payment')),
          ],
        ),
        bottomNavigationBar: Container(
          color: const Color(0xFF002A41), // Bottom navigation bar background color
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard),
                text: 'Dashboard',
              ),
              Tab(
                icon: Icon(Icons.inventory),
                text: 'Inventory',
              ),
              Tab(
                icon: Icon(Icons.assignment),
                text: 'Inventory Status',
              ),
              Tab(
                icon: Icon(Icons.payment, ),
                text: 'Payment',
              ),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
            labelStyle: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget buildDashboardContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: buildInfoCard('25', 'Assignments', const Color(0xFF51C0B1), const Color(0xFF82A9A4)), // Hex color for teal with border #82A9A4
          ),
          const SizedBox(height: 16),
          Center(
            child: buildInfoCard('5', 'Due Today', const Color(0xFF014360), const Color(0xFF6C8793)), // Hex color for blue-grey with border #6C8793
          ),
          const SizedBox(height: 16),
          Center(
            child: buildInfoCard('5', 'Overdue', const Color(0xFFC25261), const Color(0xFFE9808E)), // Hex color for red with border #E9808E
          ),
          const SizedBox(height: 32),
          buildInventoryStatusCard(),
        ],
      ),
    );
  }

  Widget buildInfoCard(String value, String label, Color color, Color borderColor) {
    return Container(
      width: 200, // Set a fixed width for the rectangles
      height: 90,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor, 
          width: 3.0, 
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInventoryStatusCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF666666), 
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Inventory Status',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildInventoryStatusItem('25', 'Total in hand', const Color(0xFF51C0B1)), 
              const SizedBox(width: 70),
              buildInventoryStatusItem('25', 'Required', const Color(0xFF51C0B1)), 
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildInventoryStatusItem(String value, String label, Color color) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF666666), 
              width: 1.0,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF002A41),
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF002A41),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: EdgeInsets.all(8.0),
        ),
      ),
      home: const Dashboard(),
    ),
  );
}


