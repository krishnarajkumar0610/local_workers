class Transaction {
  final String title;
  final String amount;
  final String status;

  Transaction({
    required this.title,
    required this.amount,
    required this.status,
  });
}

class WorkerModel {
  final String name;
  final String address;
  final String phoneNumber;
  final String email;
  final String profileImage;
  bool isVerified;
  bool isAadharVerified;
  String? aadharNumber; // Nullable Aadhar Number
  final double workCompleted;
  final List<Transaction> transactions;

  WorkerModel({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.profileImage,
    required this.isVerified,
    required this.isAadharVerified,
    this.aadharNumber, // Initially null
    required this.workCompleted,
    required this.transactions,
  });
}

// Sample Worker Data
WorkerModel sampleWorker = WorkerModel(
  name: "John Doe",
  address: "123 Main St, New York, USA",
  phoneNumber: "+1 987-654-3210",
  email: "john.doe@email.com",
  profileImage: "https://via.placeholder.com/150",
  isVerified: true,
  isAadharVerified: false, // Initially not verified
  aadharNumber: null, // Initially empty
  workCompleted: 0.78, // 78% work completed
  transactions: [
    Transaction(title: "Project Payment", amount: "\$200.00", status: "Received"),
    Transaction(title: "Bonus", amount: "\$50.00", status: "Received"),
    Transaction(title: "Refund", amount: "-\$30.00", status: "Deducted"),
  ],
);
