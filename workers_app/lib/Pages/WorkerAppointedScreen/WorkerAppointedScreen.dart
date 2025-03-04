import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workers_app/Pages/WorkerDetailsScreen/WorkerScreenProvider/WorkerScreenProvider.dart';

class WorkerAppointedScreen extends StatefulWidget {
  const WorkerAppointedScreen({super.key});

  @override
  State<WorkerAppointedScreen> createState() => _WorkerAppointedScreenState();
}

class _WorkerAppointedScreenState extends State<WorkerAppointedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Worker Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Consumer<WorkerScreenProvider>(
        builder: (context, provider, child) {
          final worker = provider.currentWorker;

          if (worker == null) {
            return const Center(
              child: Text(
                "No worker appointed yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          _getUserProfileImage(worker.profile.profileImg),
                      onBackgroundImageError: (_, __) =>
                          const Icon(Icons.person, size: 50),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      worker.fullName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      worker.emailId,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Phone Number Section with Call Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Phone: ${worker.profile.phoneNumber}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.call, color: Colors.white),
                          label: const Text("Call"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () async {
                            await _makePhoneCall(worker.profile.phoneNumber);
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    Divider(color: Colors.grey.shade400),
                    const SizedBox(height: 10),
                    const Text(
                      "Assigned Client",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    worker.clients.isNotEmpty
                        ? Column(
                            children: worker.clients.map((client) {
                              return ListTile(
                                leading: const Icon(Icons.person,
                                    color: Colors.blueGrey),
                                title: Text(
                                  client.fullName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(client.emailId),
                              );
                            }).toList(),
                          )
                        : const Text(
                            "No clients assigned yet!",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Function to get user profile image
  ImageProvider _getUserProfileImage(String imageUrl) {
    if (imageUrl.isNotEmpty && File(imageUrl).existsSync()) {
      return FileImage(File(imageUrl));
    }
    return const AssetImage("assets/default_profile.png");
  }

  /// Function to make a phone call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri.parse('tel:$phoneNumber');

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Could not launch phone dialer")),
        );
      }
    }
  }
}
