class MaintenanceCrewModel {
  final String id;
  final String name;
  final String image;
  final String location;
  final DateTime lastIssueResolvingDate;
  final String email;
  final String phone;

  MaintenanceCrewModel({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.lastIssueResolvingDate,
    required this.email,
    required this.phone,
  });

  factory MaintenanceCrewModel.fromJson(Map<String, dynamic> json) {
    return MaintenanceCrewModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      location: json['location'],
      lastIssueResolvingDate: DateTime.parse(json['lastIssueResolvingDate']),
      email: json['email'],
      phone: json['phone'],
    );
  }

  static String userImage = "https://i.ibb.co/gb89tL7H/4cecfcf834e669ed760ddf8d1110821cf8547ef3.jpg";


  static final List<MaintenanceCrewModel> dummyMaintenanceCrewModels = <MaintenanceCrewModel>[
    MaintenanceCrewModel(
      id: '1',
      name: 'John Doe',
      location: "Dhaka BD",
      lastIssueResolvingDate: DateTime(2025, 6, 18),
      email: 'john.doe@example.com',
      phone: '+1 555 123 4567',
      image: userImage,
    ),
    MaintenanceCrewModel(
      id: '2',
      name: 'Jane Smith',
      location: "Comilla BD",
      lastIssueResolvingDate: DateTime(2025, 6, 17),
      email: 'jane.smith@example.com',
      phone: '+1 555 234 5678',
      image: userImage,
    ),
    MaintenanceCrewModel(
      id: '3',
      name: 'Alex Johnson',
      location: "Barisal BD",
      lastIssueResolvingDate: DateTime(2025, 6, 16),
      email: 'alex.johnson@example.com',
      phone: '+1 555 345 6789',
      image: userImage,
    ),
    MaintenanceCrewModel(
      id: '4',
      location: "Sylhet BD",
      name: 'Emma Watson',
      lastIssueResolvingDate: DateTime(2025, 6, 15),
      email: 'emma.watson@example.com',
      phone: '+1 555 456 7890',
      image: userImage,
    ),
    MaintenanceCrewModel(
      id: '5',
      name: 'Michael Lee',
      location: "Comilla BD",
      lastIssueResolvingDate: DateTime(2025, 6, 14),
      email: 'michael.lee@example.com',
      phone: '+1 555 567 8901',
      image: userImage,
    ),
    MaintenanceCrewModel(
      id: '6',
      name: 'Sophia Brown',
      location: "Dhaka BD",
      lastIssueResolvingDate: DateTime(2025, 6, 13),
      email: 'sophia.brown@example.com',
      phone: '+1 555 678 9012',
      image: userImage,
    ),
    MaintenanceCrewModel(
      id: '7',
      name: 'Daniel Garcia',
      location: "Dhaka BD",
      lastIssueResolvingDate: DateTime(2025, 6, 12),
      email: 'daniel.garcia@example.com',
      phone: '+1 555 789 0123',
      image: userImage,
    ),
    MaintenanceCrewModel(
      id: '8',
      name: 'Isabella Martinez',
      location: "Comilla BD",
      lastIssueResolvingDate: DateTime(2025, 6, 11),
      email: 'isabella.martinez@example.com',
      phone: '+1 555 890 1234',
      image: userImage,
    ),
    MaintenanceCrewModel(
      id: '9',
      name: 'Liam Wilson',
      location: "Comilla BD",
      lastIssueResolvingDate: DateTime(2025, 6, 10),
      email: 'liam.wilson@example.com',
      phone: '+1 555 901 2345',
      image: userImage,
    ),
    MaintenanceCrewModel(
      id: '10',
      location: "Comilla BD",
      name: 'Olivia Taylor',
      lastIssueResolvingDate: DateTime(2025, 6, 9),
      email: 'olivia.taylor@example.com',
      phone: '+1 555 012 3456',
      image: userImage,
    ),
    MaintenanceCrewModel(
      id: '11',
      location: "Comilla BD",
      name: 'Ethan Miller',
      lastIssueResolvingDate: DateTime(2025, 6, 8),
      email: 'ethan.miller@example.com',
      phone: '+1 555 111 2222',
      image: userImage,
    ),
    MaintenanceCrewModel(
      id: '12',
      location: "Dhaka BD",
      name: 'Ava Davis',
      lastIssueResolvingDate: DateTime(2025, 6, 7),
      email: 'ava.davis@example.com',
      phone: '+1 555 222 3333',
      image: userImage,
    ),
  ];


}
