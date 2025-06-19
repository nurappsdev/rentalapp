class RenterMaintenanceModel {
  final String id;
  final String apartmentRoomNumber;
  final DateTime issueDate;
  final String description;
  final List<String> issueImages;
  final List<String> issueVideos;

  RenterMaintenanceModel({
    required this.id,
    required this.apartmentRoomNumber,
    required this.issueDate,
    required this.description,
    required this.issueImages,
    required this.issueVideos,
  });

  factory RenterMaintenanceModel.fromJson(Map<String, dynamic> json) {
    return RenterMaintenanceModel(
      id: json['id'],
      issueDate: DateTime.parse(json['issueDate']),
      description: json['description'],
      apartmentRoomNumber: json['apartmentRoomNumber'],
      issueImages: List<String>.from(json['issueImages']),
      issueVideos: List<String>.from(json['issueVideos']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'apartmentRoomNumber': apartmentRoomNumber,
      'issueDate': issueDate.toIso8601String(),
      'description': description,
      'issueImages': issueImages,
      'issueVideos': issueVideos,
    };
  }

  // https://i.ibb.co/7dtBDZHy/d5e76c655b0cfd55a7449f24d43b8129f4334ab2.png
  // https://i.ibb.co/RpvxyL3C/8e09f2137bde140d80ce1ec0253b9e802a214a13.png
  // https://i.ibb.co/gb89tL7H/4cecfcf834e669ed760ddf8d1110821cf8547ef3.jpg

  // http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4
  // http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4
  static String maintenanceImage = "https://i.ibb.co/7dtBDZHy/d5e76c655b0cfd55a7449f24d43b8129f4334ab2.png";
  static String issueImage = "https://i.ibb.co/RpvxyL3C/8e09f2137bde140d80ce1ec0253b9e802a214a13.png";
  static String userImage = "https://i.ibb.co/gb89tL7H/4cecfcf834e669ed760ddf8d1110821cf8547ef3.jpg";
  static String issueVideo1 = "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  static String issueVideo2 = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4";

  static final List<RenterMaintenanceModel> dummyMaintenanceList = <RenterMaintenanceModel>[
    RenterMaintenanceModel(
      id: "1",
      apartmentRoomNumber: 'A-101',
      issueDate: DateTime(2025, 5, 10),
      description: 'Water leakage in bathroom',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
    ),
    RenterMaintenanceModel(
      id: "2",
      apartmentRoomNumber: 'B-203',
      issueDate: DateTime(2025, 5, 12),
      description: 'Broken window',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
    ),
    RenterMaintenanceModel(
      id: "3",
      apartmentRoomNumber: 'C-305',
      issueDate: DateTime(2025, 5, 8),
      description: 'AC not working',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
    ),
    RenterMaintenanceModel(
      id: "4",
      apartmentRoomNumber: 'D-101',
      issueDate: DateTime(2025, 4, 30),
      description: 'Power socket broken',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
    ),
    RenterMaintenanceModel(
      id: "5",
      apartmentRoomNumber: 'E-404',
      issueDate: DateTime(2025, 6, 1),
      description: 'Lift malfunctioning',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
    ),
    RenterMaintenanceModel(
      id: "6",
      apartmentRoomNumber: 'F-302',
      issueDate: DateTime(2025, 5, 20),
      description: 'Clogged kitchen sink',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
    ),
    RenterMaintenanceModel(
      id: "7",
      apartmentRoomNumber: 'G-110',
      issueDate: DateTime(2025, 5, 17),
      description: 'Broken door lock',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
    ),
    RenterMaintenanceModel(
      id: "8",
      apartmentRoomNumber: 'H-211',
      issueDate: DateTime(2025, 5, 11),
      description: 'Wi-Fi outage',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
    ),
    RenterMaintenanceModel(
      id: "9",
      apartmentRoomNumber: 'I-510',
      issueDate: DateTime(2025, 6, 2),
      description: 'Ceiling fan noise',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
    ),
    RenterMaintenanceModel(
      id: "10",
      apartmentRoomNumber: 'J-306',
      issueDate: DateTime(2025, 5, 28),
      description: 'No hot water in shower',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
    ),
  ];

}
