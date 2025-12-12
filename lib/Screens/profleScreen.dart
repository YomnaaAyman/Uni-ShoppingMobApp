// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfileScreen> {
//   int _currentIndex = 2; // Set to 2 since Profile is the 3rd tab

//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });

//     if (index == 0) {
//       // Navigate to HomePage
//       Navigator.pushNamed(context, '/home');
//     } else if (index == 1) {
//       // Navigate to Bookings page
//       Navigator.pushNamed(context, '/bookings');
//     }
//   }

//   // Log out function
//   Future<void> _logOut() async {
//     try {
//       await FirebaseAuth.instance
//           .signOut(); // Log out using Firebase Authentication
//       // Navigate to the login screen
//       Navigator.pushReplacementNamed(
//         context,
//         '/login',
//       ); // Replace with your login screen route
//     } catch (e) {
//       print('Error during log out: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Failed to log out. Please try again.')),
//       );
//     }
//   }

//   // Function to show log out confirmation dialog
//   void _showLogOutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Are You Sure?'),
//           content: const Text('Do you want to log out?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Log out the user
//                 _logOut();
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: const Text('Log Out', style: TextStyle(color: Colors.red)),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(
//                   context,
//                 ).pop(); // Close the dialog without logging out
//               },
//               child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(), // Removes the back arrow
//         title: const Text('Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile Header Section
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   backgroundImage: NetworkImage(
//                     'https://example.com/profile_pic.jpg',
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 const Text(
//                   'Merna Hussein',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Settings List
//             const Text(
//               'Setting',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             ListView(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               children: const [
//                 ListTile(
//                   title: Text('Your Card'),
//                   leading: Icon(Icons.credit_card),
//                 ),
//                 ListTile(title: Text('Security'), leading: Icon(Icons.lock)),
//                 ListTile(
//                   title: Text('Notification'),
//                   leading: Icon(Icons.notifications),
//                 ),
//                 ListTile(
//                   title: Text('Languages'),
//                   leading: Icon(Icons.language),
//                 ),
//                 ListTile(
//                   title: Text('Help and Support'),
//                   leading: Icon(Icons.help),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Log Out Button
//             TextButton(
//               onPressed: () {
//                 _showLogOutDialog(context);
//               },
//               child: const Text('Logout', style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         items: [
//           BottomNavigationBarItem(
//             icon: Image.asset('assets/icons/home.png', height: 35),
//             label: "Home",
//           ),

//           BottomNavigationBarItem(
//             icon: Image.asset('assets/icons/profile.png', height: 24),
//             label: "Profile",
//           ),
//         ],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
