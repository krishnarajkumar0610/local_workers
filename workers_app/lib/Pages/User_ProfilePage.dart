import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool isEditing = false;
  bool tipsExpanded = false;
  bool servicesExpanded = false;

  late TextEditingController nameController;
  late TextEditingController locationController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: user.name);
    locationController = TextEditingController(text: user.location);
    phoneController = TextEditingController(text: user.phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            actions: [
              IconButton(
                icon: Icon(isEditing ? Icons.save : Icons.edit, color: Colors.white),
                onPressed: toggleEdit,
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [CupertinoColors.activeBlue, CupertinoColors.systemBlue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 48,
                            backgroundImage: NetworkImage(user.profileImage),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Icon(Icons.verified, color: Colors.green, size: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Profile Content
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              _buildSection("Personal Info", [
                _buildEditableRow("Name", nameController),
                _buildEditableRow("Location", locationController),
                _buildEditableRow("Phone", phoneController),
              ]),

              /// Expandable Tips Given Section (With Price History & Call Icon)
              _buildExpandableSectionWithPriceAndCall(
                title: "Tips Given",
                items: user.tipsGiven,
                amounts: user.tipsAmount,
                expanded: tipsExpanded,
                onTap: () => setState(() => tipsExpanded = !tipsExpanded),
              ),

              /// Expandable Hired Services Section (With Price History & Call Icon)
              _buildExpandableSectionWithPriceAndCall(
                title: "Hired Services",
                items: user.hiredServices,
                amounts: user.amountSpent,
                expanded: servicesExpanded,
                onTap: () => setState(() => servicesExpanded = !servicesExpanded),
              ),

              _buildSection("Ongoing Work", user.ongoingWork.entries.map((e) => _buildProgressRow(e.key, e.value)).toList()),
              const SizedBox(height: 50),
            ]),
          ),
        ],
      ),
    );
  }

  /// 🏗 **Reusable Section Builder**
  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Column(children: children),
          const Divider(),
        ],
      ),
    );
  }

  /// Editable Row Builder
  Widget _buildEditableRow(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          isEditing
              ? SizedBox(
            width: 200,
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(border: UnderlineInputBorder()),
            ),
          )
              : Text(controller.text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  /// Expandable Section With Price and Call Icon
  Widget _buildExpandableSectionWithPriceAndCall({
    required String title,
    required List<String> items,
    required Map<String, String> amounts,
    required bool expanded,
    required VoidCallback onTap,
  }) {
    return _buildExpandableSection(
      title: title,
      expanded: expanded,
      onTap: onTap,
      children: items
          .map(
            (item) => ListTile(
          leading: Text(
            amounts[item] ?? "\$0",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          title: Text(item),
          trailing: IconButton(
            icon: const Icon(Icons.call, color: CupertinoColors.activeGreen),
            onPressed: () {
              // Handle Call Action
            },
          ),
        ),
      )
          .toList(),
    );
  }

  /// Reusable Expandable Section
  Widget _buildExpandableSection({
    required String title,
    required bool expanded,
    required VoidCallback onTap,
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(expanded ? Icons.expand_less : Icons.expand_more),
              ],
            ),
          ),
          if (expanded) Column(children: children),
          const Divider(),
        ],
      ),
    );
  }

  /// Progress Row Builder
  Widget _buildProgressRow(String job, int progress) {
    Color color = progress == 100 ? Colors.green : progress >= 50 ? Colors.yellow : Colors.red;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(job, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            value: progress / 100,
            backgroundColor: Colors.grey.shade300,
            color: color,
            minHeight: 8,
          ),
          const SizedBox(height: 5),
          Text("$progress% Completed", style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
