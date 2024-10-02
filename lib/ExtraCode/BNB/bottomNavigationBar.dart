import 'package:expence_controller/Home_Screen/home_screen.dart';
import 'package:flutter/material.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  int _currentIndex = 0; // Add a variable to track the current tab

  // List of screens to switch between
  final List<Widget> _screens = [
    home_screen(), // Make sure this class is defined
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 70, // Set the height of the BottomAppBar here
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), // Circular corners on the top left
            topRight:
                Radius.circular(30.0), // Circular corners on the top right
          ),
          child: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavBarItem(Icons.grid_view_rounded, 'Home', 0),
                SizedBox(width: 30), // Adjust the space between items
                buildNavBarItem(Icons.person, 'MyTask', 1),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex, // Display the screen based on selected index
        children: _screens, // List of screens to show
      ),
      floatingActionButton: Container(
        height: 60, // Adjust this to match your design preference
        width: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(0xFF34A6E5),
              Color(0xFF808DF2),
              Color(0xFFB272FA),
              Color(0xFFCF69F8),
              Color(0xFFE27BBF),
              Color(0xFFF9917D),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor:
              Colors.transparent, // Make FAB background transparent
          elevation: 0,
          child: const Icon(
            Icons.add,
            size: 30, // Adjust icon size
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Method to build each bottom nav bar item
  Widget buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index; // Change the current index on tap
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: _currentIndex == index
                ? Colors.blue
                : Colors.black, // Highlight selected tab
          ),
        ],
      ),
    );
  }
}
