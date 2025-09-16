// import 'package:assignment/Pages/homepage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
//
// class CommonDrawer extends StatefulWidget {
//   const CommonDrawer({super.key});
//
//   @override
//   State<CommonDrawer> createState() => _CommonDrawerState();
// }
//
// class _CommonDrawerState extends State<CommonDrawer> {
//    final GlobalKey<SliderDrawerState> _sliderDrawerKey = GlobalKey<
//       SliderDrawerState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//  body: SliderDrawer(
//         key: _sliderDrawerKey,
//         sliderOpenSize: 240,
//         appBar: SliderAppBar(
//           appBarHeight: 90,
//           drawerIconColor: Colors.white,
//           title: Text('Sales Dashboard',
//               style: TextStyle(fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color:Colors.white)),
//           appBarColor: Colors.blue,
//           trailing: IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {},
//           ),
//         ),
//         slider: _buildDrawer(),
//         child: Homepage(),
//       ),
//     );
//   }
// Widget _buildDrawer() {
//     return Column(
//         children: [
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.only(top: 80, bottom: 70),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 // colors: [Color(0xFF7BAAF7), Color(0xFF5EA3DA)],
//                 colors: [Color(0xFF7BAAF7), Colors.blue,],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 40,
// backgroundColor: Colors.black,
//                   child: Icon(
// Icons.person,color: Colors.white,
//                   ),
//                 ),
//                 // SizedBox(height: 10),
//                 // Text(
//                 //   empName,
//                 //   style: TextStyle(color: Colors.white,
//                 //       fontSize: 18,
//                 //       fontWeight: FontWeight.bold),
//                 // ),
//                 // Text(
//                 //   designationName,
//                 //   style: TextStyle(color: Colors.white70, fontSize: 14),
//                 // ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10,),
//           // if(dId == 4)
//           _drawerItem1()
//           // else
//           // _drawerItem2()
//
//         ]);
//   }
//
//   Widget _drawerItem1() {
//     return Expanded(
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: [
//                   _singleDrawerTile(
//                     icon: Icons.home,
//                     title: 'My Profile',
//                     onTap: () {
//                       Navigator.pop(context);
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(builder: (_) => CommonDrawerHome()),
//                       // );
//                     },
//                   ),
//                    _singleDrawerTile(
//                     icon: Icons.home,
//                     title: 'My Task',
//                     onTap: () {
//                       Navigator.pop(context);
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(builder: (_) => CommonDrawerHome()),
//                       // );
//                     },
//                   ),
//
//
//                   // _drawerExpansion(
//                   //   icon: Icons.timeline,
//                   //   title: 'Pipeline',
//                   //   children: [
//                   //     _drawerSubTile(
//                   //       icon: Icons.info_outline,
//                   //       title: 'Pipeline Details',
//                   //       onTap: () {
//                   //         Navigator.pop(context);
//                   //         Navigator.push(
//                   //           context,
//                   //           MaterialPageRoute(builder: (_) => Pipeline()),
//                   //         );
//                   //       },
//                   //     ),
//                   //     _drawerSubTile(
//                   //       icon: Icons.add_box_outlined,
//                   //       title: 'Create Pipeline',
//                   //       onTap: () {
//                   //         Navigator.pop(context);
//                   //         Navigator.push(
//                   //           context,
//                   //           MaterialPageRoute(
//                   //               builder: (context) =>
//                   //                   CreatePipeline(pipeline: null)),
//                   //         );
//                   //       },
//                   //     ),
//                   //   ],
//                   // ),
//
//
//                 ],
//               ),
//             ),
//
//             // Logout Button
//             // Padding(
//             //   padding: const EdgeInsets.only(bottom: 18.0),
//             //   child: _drawerTile(
//             //     icon: Icons.logout,
//             //     title: 'Logout',
//             //     color: Colors.red,
//             //     onTap: () async {
//             //       final prefs = await SharedPreferences.getInstance();
//             //       await prefs.remove('isLoggedIn'); // or prefs.clear() to remove all saved data
//
//             //       Navigator.pushReplacement(
//             //         context,
//             //         MaterialPageRoute(builder: (_) => Login()),
//             //       );
//             //     },
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
//
// // Main Drawer Tile
//   Widget _drawerTile({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//     Color color = Colors.black87,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: color),
//       title: Text(
//         title,
//         style: TextStyle(
//             fontSize: 16, fontWeight: FontWeight.w500, color: color),
//       ),
//       onTap: onTap,
//     );
//   }
//   Widget _singleDrawerTile({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//     Color color = Colors.blue,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: color),
//       title: Text(
//         title,
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//       ),
//       onTap: onTap,
//     );
//   }
//
// // Expansion Tile
//   Widget _drawerExpansion({
//     required IconData icon,
//     required String title,
//     required List<Widget> children,
//   }) {
//     return ExpansionTile(
//       leading: Icon(icon, color: Colors.blue),
//       title: Text(
//         title,
//         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//       ),
//       children: children,
//     );
//   }
//
// // Submenu Tile
//   Widget _drawerSubTile({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.blue, size: 22),
//       title: Text(
//         title,
//         style: TextStyle(fontSize: 14, color: Colors.black87),
//       ),
//       onTap: onTap,
//       dense: true,
//       visualDensity: VisualDensity(vertical: -2),
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';

import '../Pages/MyTask.dart';
import '../Pages/homepage.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Tarun Patil"),
            accountEmail: Text("tarunpatil0065@gmail.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.blue),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("My Profile"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>Homepage())
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text("My Task"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>Mytask())
              );
            },
          ),
        ],
      ),
    );
  }
}

