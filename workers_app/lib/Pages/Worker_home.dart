import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkerHomePage extends StatefulWidget {
  @override
  _WorkerHomePageState createState() => _WorkerHomePageState();
}

class _WorkerHomePageState extends State<WorkerHomePage> {
  final List<Widget> _jobPostings = [];
  final Map<String, bool> _joinedCommunities = {};
  bool _joinedEvent = false;

  void _toggleJoinCommunity(String title) {
    setState(() {
      _joinedCommunities[title] = !(_joinedCommunities[title] ?? false);
    });
  }

  void _toggleJoinEvent() {
    setState(() {
      _joinedEvent = !_joinedEvent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreetingSection(),
            SizedBox(height: 20),
            _buildUpcomingEvent(),
            SizedBox(height: 20),
            _buildSectionTitle("Communities"),
            _buildCommunitiesSection(),
            SizedBox(height: 20),
            _buildSectionTitle("Job posting"),
            _buildJobPostingSection(),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Widget _buildGreetingSection() {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good Morning, Alex", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("Let's explore new opportunities!", style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=5"),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingEvent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Colors.blue.shade900, Colors.blue.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade900.withOpacity(0.3),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
          ClipPath(
            clipper: _WavyClipper(),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.blue.shade500],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Upcoming Event", style: TextStyle(color: Colors.white70, fontSize: 14)),
                SizedBox(height: 5),
                Text("Tech Networking Meetup",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(CupertinoIcons.calendar, size: 18, color: Colors.white),
                    SizedBox(width: 5),
                    Text("July 25, 2024", style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(height: 20),
                CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  onPressed: _toggleJoinEvent,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(_joinedEvent ? CupertinoIcons.checkmark_alt_circle_fill : CupertinoIcons.add_circled,
                          color: Colors.blue, size: 18),
                      SizedBox(width: 5),
                      Text(
                        _joinedEvent ? "Joined" : "Join",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildCommunitiesSection() {
    return Container(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildCommunityCard("Local Jobs", CupertinoIcons.hammer, "1.2K Members", "Find nearby job opportunities."),
          _buildCommunityCard("Freelancers Hub", CupertinoIcons.briefcase, "980 Members", "Network with top freelancers."),
        ],
      ),
    );
  }

  Widget _buildCommunityCard(String title, IconData icon, String members, String description) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 26, color: Colors.blue),
              SizedBox(width: 10),
              Expanded(child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            ],
          ),
          SizedBox(height: 5),
          Text(description, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(CupertinoIcons.person_2_fill, size: 16, color: Colors.grey),
              SizedBox(width: 5),
              Text(members, style: TextStyle(color: Colors.grey.shade700)),
            ],
          ),
          SizedBox(height: 10),
          CupertinoButton(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            onPressed: () => _toggleJoinCommunity(title),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(_joinedCommunities[title] ?? false ? CupertinoIcons.checkmark_alt_circle_fill : CupertinoIcons.add_circled,
                    color: Colors.white, size: 18),
                SizedBox(width: 5),
                Text(
                  _joinedCommunities[title] ?? false ? "Joined" : "Join",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height - 30);
    path.quadraticBezierTo(3 * size.width / 4, size.height - 60, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


Widget _buildJobPostingSection() {
  List<Map<String, String>> jobList = [
    {"title": "Plumber", "company": " Corp", "location": "San Francisco, CA", "phone": "123-456-7890", "price": "\$80/hr"},
    {"title": "Electrician", "company": " Studio", "location": "New York, NY", "phone": "987-654-3210", "price": "\$70/hr"},
    {"title": "Painter", "company": " Labs", "location": "Seattle, WA", "phone": "555-123-4567", "price": "\$90/hr"},
  ];

  return StatefulBuilder(
    builder: (context, setState) {
      void _showJobForm() {
        TextEditingController titleController = TextEditingController();
        TextEditingController companyController = TextEditingController();
        TextEditingController locationController = TextEditingController();
        TextEditingController phoneController = TextEditingController();
        TextEditingController priceController = TextEditingController();

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Add Job Posting"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(controller: titleController, decoration: InputDecoration(labelText: "Job Name")),
                  TextField(controller: companyController, decoration: InputDecoration(labelText: "Company Name")),
                  TextField(controller: locationController, decoration: InputDecoration(labelText: "Address")),
                  TextField(controller: phoneController, decoration: InputDecoration(labelText: "Phone Number")),
                  TextField(controller: priceController, decoration: InputDecoration(labelText: "Price")),
                ],
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
                TextButton(
                  onPressed: () {
                    setState(() {
                      jobList.add({
                        "title": titleController.text,
                        "company": companyController.text,
                        "location": locationController.text,
                        "phone": phoneController.text,
                        "price": priceController.text,
                      });
                    });
                    Navigator.pop(context);
                  },
                  child: Text("Add"),
                ),
              ],
            );
          },
        );
      }

      void _deleteJob(int index) {
        setState(() {
          jobList.removeAt(index);
        });
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [

                GestureDetector(
                  onTap: _showJobForm,
                  child: Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.withOpacity(0.2),
                          ),
                        ),
                        Icon(Icons.add, color: Colors.blue, size: 40),
                      ],
                    ),
                  ),
                ),
                // Display Job Listings
                ...List.generate(jobList.length, (index) {
                  var job = jobList[index];
                  return Container(
                    width: 280,
                    height: 160,
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Job Title
                            Row(
                              children: [
                                Icon(CupertinoIcons.briefcase, color: Colors.blue, size: 20),
                                SizedBox(width: 8),
                                Text(job["title"] ?? "",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 5),
                            // Company Name
                            Row(
                              children: [
                                Icon(CupertinoIcons.building_2_fill, color: Colors.grey, size: 18),
                                SizedBox(width: 8),
                                Text(job["company"] ?? "",
                                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
                              ],
                            ),
                            SizedBox(height: 5),
                            // Location
                            Row(
                              children: [
                                Icon(CupertinoIcons.location_solid, color: Colors.red, size: 18),
                                SizedBox(width: 8),
                                Text(job["location"] ?? "",
                                    style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                              ],
                            ),
                            SizedBox(height: 5),
                            // Phone Number
                            Row(
                              children: [
                                Icon(CupertinoIcons.phone_fill, color: Colors.green, size: 18),
                                SizedBox(width: 8),
                                Text(job["phone"] ?? "",
                                    style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                              ],
                            ),
                            SizedBox(height: 5),
                            // Price
                            Row(
                              children: [
                                Icon(CupertinoIcons.money_dollar, color: Colors.orange, size: 18),
                                SizedBox(width: 8),
                                Text(job["price"] ?? "",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                        // ❌ Delete Button Inside Container (Top Right)
                        Positioned(
                          top: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: () => _deleteJob(index),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                              ),
                              padding: EdgeInsets.all(6),
                              child: Icon(Icons.delete, color: Colors.white, size: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      );
    },
  );
}


