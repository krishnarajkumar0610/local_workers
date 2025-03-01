import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HireMePage extends StatelessWidget {
  final Map<String, dynamic> job;

  const HireMePage({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isVerified = double.parse(job["rating"]) > 4.5; // Verified if rating > 4.5

    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      appBar: CupertinoNavigationBar(
        middle: Text("Hire ${job['worker']}"),
        trailing: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(CupertinoIcons.clear, color: CupertinoColors.systemGrey),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Worker Avatar + Rating + Verified Badge
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage("https://via.placeholder.com/150"), // Replace with actual image URL
                  ),
                  const SizedBox(height: 10),
                  Text(
                    job["worker"],
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(CupertinoIcons.star_fill, color: CupertinoColors.systemYellow, size: 18),
                      const SizedBox(width: 5),
                      Text(
                        job["rating"],
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 10),
                      if (isVerified)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: CupertinoColors.activeGreen,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Verified",
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 Job Title & Description
            Text(
              job["title"],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              job["description"],
              style: const TextStyle(fontSize: 16, color: CupertinoColors.systemGrey),
            ),

            const SizedBox(height: 20),

            /// 🔹 Worker Address & Contact
            Row(
              children: [
                const Icon(CupertinoIcons.location, size: 18, color: CupertinoColors.systemGrey),
                const SizedBox(width: 5),
                Expanded(child: Text(job["address"], style: const TextStyle(color: CupertinoColors.systemGrey))),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(CupertinoIcons.phone, size: 18, color: CupertinoColors.systemGrey),
                const SizedBox(width: 5),
                Text(job["phone"], style: const TextStyle(fontSize: 16)),
              ],
            ),

            const SizedBox(height: 30),

            /// 🔹 Price Calculation Heading
            const Text(
              "Price Calculation",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            /// 🔹 Price Details (Bill Format)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Column(
                children: [
                  _buildBillRow("Service Cost", job["price"]),
                  _buildBillRow("Tax & Fees", "\$5.00"),
                  _buildBillRow("Total", "\$${_calculateTotal(job["price"])}", isTotal: true),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 🔹 Confirm Apply Button
            SizedBox(
              width: double.infinity,
              child: CupertinoButton.filled(
                onPressed: () {
                  // Implement apply functionality
                },
                child: const Text("Confirm Apply"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Helper Function to Create Bill Rows
  Widget _buildBillRow(String label, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? CupertinoColors.activeGreen : CupertinoColors.black,
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Function to Extract Numeric Value and Calculate Total Price
  String _calculateTotal(String price) {
    final numericPrice = RegExp(r'\d+(\.\d+)?').firstMatch(price)?.group(0) ?? "0";
    double parsedPrice = double.parse(numericPrice);
    return (parsedPrice + 5.00).toStringAsFixed(2);
  }
}
