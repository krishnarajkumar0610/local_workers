class User {
  final String name;
  final String location;
  final String phone;
  final String profileImage;
  final List<String> tipsGiven;
  final Map<String, String> tipsAmount; // Added tipsAmount field
  final List<String> hiredServices;
  final Map<String, String> amountSpent;
  final Map<String, int> ongoingWork;

  User({
    required this.name,
    required this.location,
    required this.phone,
    required this.profileImage,
    required this.tipsGiven,
    required this.tipsAmount, // Required field
    required this.hiredServices,
    required this.amountSpent,
    required this.ongoingWork,
  });
}

final user = User(
  name: "John Doe",
  location: "New York, USA",
  phone: "+1 123 456 7890",
  profileImage: "https://via.placeholder.com/150",
  tipsGiven: ["Painter", "Plumber", "Electrician"],
  tipsAmount: {
    "Painter": "\$15",
    "Plumber": "\$10",
    "Electrician": "\$20",
  }, // Added tips amount mapping
  hiredServices: ["Carpenter", "Mechanic", "Driver"],
  amountSpent: {
    "Plumber": "\$120",
    "Electrician": "\$80",
    "Mechanic": "\$200",
  },
  ongoingWork: {
    "Plumbing Repair": 100,
    "House Painting": 50,
    "Electric Repair": 20,
  },
);
