import 'package:flutter/material.dart';

class UserData {
  static List<Map<String, dynamic>> categories = [
    {"icon": Icons.brush, "name": "Painter", "description": "Experts in painting walls, ceilings, and other surfaces."},
    {"icon": Icons.plumbing, "name": "Plumber", "description": "Specialists in fixing pipes, leaks, and water systems."},
    {"icon": Icons.electrical_services, "name": "Electrician", "description": "Professionals handling electrical wiring and repairs."},
    {"icon": Icons.car_repair, "name": "Mechanic", "description": "Experts in vehicle maintenance and repairs."},
    {"icon": Icons.construction, "name": "Carpenter", "description": "Skilled in woodwork, furniture, and construction."},
    {"icon": Icons.cleaning_services, "name": "Cleaner", "description": "Provides home and office cleaning services."},
    {"icon": Icons.local_florist, "name": "Gardener", "description": "Maintains gardens, plants, and landscapes."},
    {"icon": Icons.security, "name": "Security Guard", "description": "Ensures safety and security of properties."},
    {"icon": Icons.pest_control, "name": "Pest Control", "description": "Removes pests and prevents infestations."},
    {"icon": Icons.home_repair_service, "name": "Handyman", "description": "Fixes various home maintenance issues."},
    {"icon": Icons.directions_car, "name": "Driver", "description": "Provides professional driving services."},
  ];

  static List<Map<String, dynamic>> jobs = [
    {
      "title": "House Painter for Interior and Exterior Walls",
      "price": "\$20/hr",
      "rating": "4.5",
      "worker": "John Doe",
      "address": "New York, USA",
      "phone": "+1 123 456 7890",
      "description": "Experienced painter available for residential and commercial properties. High-quality finishes guaranteed."
    },
    {
      "title": "Professional Plumbing Services for Homes",
      "price": "\$25/hr",
      "rating": "4.8",
      "worker": "Alice Smith",
      "address": "Los Angeles, USA",
      "phone": "+1 987 654 3210",
      "description": "Licensed plumber specializing in home plumbing repairs, installations, and maintenance."
    }
  ];
}