// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:workers_app/Pages/hire_me_page.dart';
// import 'package:workers_app/Pages/user_material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController searchController = TextEditingController();
//   List<Map<String, dynamic>> filteredJobs = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredJobs = UserData.jobs; // Initially display all jobs
//   }

//   void _filterJobs(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         filteredJobs = UserData.jobs;
//       } else {
//         filteredJobs = UserData.jobs
//             .where((job) =>
//             job["title"].toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CupertinoColors.systemGroupedBackground,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// 🔹 Top Bar: Profile & Search
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const CircleAvatar(
//                       radius: 25,
//                       backgroundImage: NetworkImage("https://via.placeholder.com/100"),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: CupertinoSearchTextField(
//                         controller: searchController,
//                         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                         placeholder: "Search for jobs...",
//                         onChanged: _filterJobs, // 🔹 Calls function on input change
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),

//                 /// 🔹 Work Categories Scroll
//                 SizedBox(
//                   height: 100,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: UserData.categories.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(right: 16.0),
//                         child: Column(
//                           children: [
//                             CircleAvatar(
//                               radius: 30,
//                               backgroundColor: Colors.white,
//                               child: Icon(
//                                 UserData.categories[index]['icon'],
//                                 size: 30,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(UserData.categories[index]['name'], style: const TextStyle(fontSize: 14)),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 /// 🔹 Featured Jobs Section
//                 const Text("Featured Jobs", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10),
//                 _buildJobList(context),

//                 const SizedBox(height: 20),

//                 /// 🔹 Most Hired Section
//                 const Text("Most Hired", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10),
//                 _buildJobList(context),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// 🔹 Job List UI with Scroll & Search Support
//   Widget _buildJobList(BuildContext context) {
//     if (filteredJobs.isEmpty) {
//       return const Center(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Text("No jobs available", style: TextStyle(fontSize: 16, color: Colors.grey)),
//         ),
//       );
//     }

//     return SizedBox(
//       height: 190,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: filteredJobs.length,
//         itemBuilder: (context, index) {
//           final job = filteredJobs[index];
//           String jobTitle = job["title"];

//           /// 🔹 Limit job title length
//           if (jobTitle.length > 25) {
//             jobTitle = "${jobTitle.substring(0, 25)}...";
//           }

//           return Container(
//             width: 270,
//             margin: const EdgeInsets.only(right: 16),
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [const BoxShadow(color: Colors.black12, blurRadius: 4)],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(jobTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 5),
//                 Text(job["price"], style: const TextStyle(color: CupertinoColors.activeGreen, fontSize: 14)),
//                 const SizedBox(height: 5),
//                 Row(
//                   children: [
//                     const Icon(Icons.star, color: Colors.amber, size: 18),
//                     Text(job["rating"]),
//                   ],
//                 ),
//                 const SizedBox(height: 5),

//                 /// 🔹 Name & Phone Number in One Row
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(job["worker"], style: const TextStyle(fontWeight: FontWeight.w500)),
//                     Row(
//                       children: [
//                         const Icon(Icons.phone, color: CupertinoColors.activeBlue, size: 16),
//                         const SizedBox(width: 3),
//                         Text(job["phone"], style: const TextStyle(color: CupertinoColors.activeBlue, fontSize: 12)),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Text(job["address"], style: const TextStyle(color: Colors.grey, fontSize: 12)),
//                 const SizedBox(height: 10),

//                 /// 🔹 Fully Visible "Hire" Button
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: SizedBox(
//                     width: 100,
//                     height: 36,
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           CupertinoPageRoute(
//                             builder: (context) => HireMePage(job: job),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: CupertinoColors.activeBlue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         elevation: 3,
//                       ),
//                       icon: const Icon(Icons.work, size: 18, color: Colors.white),
//                       label: const Text("Hire", style: TextStyle(color: Colors.white, fontSize: 14)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
