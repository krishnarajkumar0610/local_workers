import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'worker_material.dart';

class WorkerProfilePage extends StatefulWidget {
  @override
  _WorkerProfilePageState createState() => _WorkerProfilePageState();
}

class _WorkerProfilePageState extends State<WorkerProfilePage> {
  final WorkerModel worker = sampleWorker;
  TextEditingController aadharController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isVerifying = false;

  @override
  void initState() {
    super.initState();
    nameController.text = worker.name;
    phoneController.text = worker.phoneNumber;
    emailController.text = worker.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔥 Profile Header
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade300, Colors.blue.shade900],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(worker.profileImage),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          worker.name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        if (worker.isVerified)
                          Icon(CupertinoIcons.checkmark_seal_fill, color: Colors.yellow, size: 20),
                      ],
                    ),
                    Text(worker.address, style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // 📌 Editable Contact Details
            _buildSectionCard(
              title: "Contact Information",
              icon: CupertinoIcons.phone_fill,
              child: Column(
                children: [
                  _buildEditableField("Full Name", CupertinoIcons.person_fill, nameController),
                  _buildEditableField("Phone Number", CupertinoIcons.phone_fill, phoneController),
                  _buildEditableField("Email", CupertinoIcons.mail_solid, emailController),
                ],
              ),
            ),

            //Aadhar Verification Section
            _buildSectionCard(
              title: "Aadhar Verification",
              icon: CupertinoIcons.shield_lefthalf_fill,
              child: Column(
                children: [
                  TextField(
                    controller: aadharController,
                    keyboardType: TextInputType.number,
                    maxLength: 12,
                    decoration: InputDecoration(
                      labelText: "Enter Aadhar Number",
                      hintText: "1234 5678 9012",
                      border: OutlineInputBorder(),
                      suffixIcon: worker.isAadharVerified
                          ? Icon(CupertinoIcons.checkmark_circle_fill, color: Colors.green)
                          : null,
                    ),
                  ),
                  SizedBox(height: 10),
                  if (!worker.isAadharVerified)
                    isVerifying
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: _verifyAadhar,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      child: Text("Verify Aadhar"),
                    ),
                ],
              ),
            ),

            // 📊 Work Completed Status
            _buildSectionCard(
              title: "Work Completed",
              icon: CupertinoIcons.checkmark_circle_fill,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${(worker.workCompleted * 100).toInt()}% Completed", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: worker.workCompleted,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.blue.shade600,
                    minHeight: 8,
                  ),
                ],
              ),
            ),

            // 💰 Amount Credit History
            _buildSectionCard(
              title: "Amount Credit History",
              icon: CupertinoIcons.money_dollar_circle_fill,
              child: Column(
                children: worker.transactions.map((tx) => _buildTransactionTile(tx)).toList(),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Simulate Aadhar Verification (2 Seconds)
  void _verifyAadhar() {
    if (aadharController.text.length == 12) {
      setState(() {
        isVerifying = true;
      });

      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isVerifying = false;
          worker.isAadharVerified = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Aadhar Verified Successfully!"),
            backgroundColor: Colors.green,
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enter a valid 12-digit Aadhar Number!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildSectionCard({required String title, required IconData icon, required Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue, size: 22),
              SizedBox(width: 8),
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _buildEditableField(String label, IconData icon, TextEditingController controller) {
    bool isEditing = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Expanded(
                child: isEditing
                    ? TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: label,
                    prefixIcon: Icon(icon, color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                )
                    : Row(
                  children: [
                    Icon(icon, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(
                      controller.text.isNotEmpty ? controller.text : "Not set",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(isEditing ? CupertinoIcons.check_mark : CupertinoIcons.pencil),
                onPressed: () {
                  setState(() {
                    isEditing = !isEditing;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }


  Widget _buildTransactionTile(Transaction tx) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      leading: Icon(CupertinoIcons.money_dollar_circle, color: Colors.green, size: 28),
      title: Text(
        tx.title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        tx.status,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      trailing: Text(
        tx.amount,
        style: TextStyle(
          fontSize: 18, // Increased font size for amount
          fontWeight: FontWeight.bold,
          color: tx.amount.contains('-') ? Colors.red : Colors.green,
        ),
      ),
    );
  }}
