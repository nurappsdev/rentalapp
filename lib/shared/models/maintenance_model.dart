class MaintenanceModel {
  final String id;
  final String apartmentName;
  final String apartmentLocation;
  final String apartmentRoomNumber;
  final String floor;
  final String type;
  final String image;

  final DateTime issueDate;
  final String description;
  final List<String> issueImages;
  final List<String> issueVideos;

  final String userName;
  final String userUserImage;
  final String userEmail;
  final String userPhoneNumber;

  final DateTime? resolvingIssueDate;

  MaintenanceModel({
    required this.id,
    required this.apartmentName,
    required this.apartmentLocation,
    required this.apartmentRoomNumber,
    required this.floor,
    required this.type,
    required this.image,
    required this.userUserImage,
    required this.issueDate,
    required this.description,
    required this.issueImages,
    required this.issueVideos,
    required this.userName,
    required this.userEmail,
    required this.userPhoneNumber,
    this.resolvingIssueDate,
  });

  factory MaintenanceModel.fromJson(Map<String, dynamic> json) {
    return MaintenanceModel(
      id: json['id'],
      apartmentName: json['apartmentName'],
      apartmentLocation: json['apartmentLocation'],
      apartmentRoomNumber: json['apartmentRoomNumber'],
      floor: json['floor'],
      type: json['type'],
      image: json['image'],
      userUserImage: json['userUserImage'],
      issueDate: DateTime.parse(json['issueDate']),
      description: json['description'],
      issueImages: List<String>.from(json['issueImages']),
      issueVideos: List<String>.from(json['issueVideos']),
      userName: json['userName'],
      userEmail: json['userEmail'],
      userPhoneNumber: json['userPhoneNumber'],
      resolvingIssueDate: json['resolvingIssueDate'] != null
          ? DateTime.tryParse(json['resolvingIssueDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'apartmentName': apartmentName,
      'apartmentLocation': apartmentLocation,
      'apartmentRoomNumber': apartmentRoomNumber,
      'floor': floor,
      'type': type,
      'image': image,
      'userUserImage': userUserImage,
      'issueDate': issueDate.toIso8601String(),
      'description': description,
      'issueImages': issueImages,
      'issueVideos': issueVideos,
      'userName': userName,
      'userEmail': userEmail,
      'userPhoneNumber': userPhoneNumber,
      'resolvingIssueDate': resolvingIssueDate?.toIso8601String(),
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

  static final List<MaintenanceModel> dummyMaintenanceList = <MaintenanceModel>[
    MaintenanceModel(
      id: "1",
      apartmentName: 'Sunset Villas',
      apartmentLocation: 'Downtown LA',
      apartmentRoomNumber: 'A-101',
      floor: '1st floor',
      type: 'Studio',
      image: maintenanceImage,
      userUserImage: userImage,
      issueDate: DateTime(2025, 5, 10),
      description: 'Water leakage in bathroom',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
      userName: 'Alice Johnson',
      userEmail: 'alice@mail.com',
      userPhoneNumber: '1234567890',
      resolvingIssueDate: null,
    ),
    MaintenanceModel(
      id: "2",
      apartmentName: 'Maple Residency',
      apartmentLocation: 'Brooklyn, NY',
      apartmentRoomNumber: 'B-203',
      floor: '2nd floor',
      type: '2 Bedroom',
      image: maintenanceImage,
      userUserImage: userImage,
      issueDate: DateTime(2025, 5, 12),
      description: 'Broken window',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
      userName: 'Bob Smith',
      userEmail: 'bob@mail.com',
      userPhoneNumber: '9876543210',
      resolvingIssueDate: DateTime(2025, 5, 15),
    ),
    MaintenanceModel(
      id: "3",
      apartmentName: 'Palm Heights',
      apartmentLocation: 'Austin, TX',
      apartmentRoomNumber: 'C-305',
      floor: '3rd floor',
      type: '3 Bedroom',
      image: maintenanceImage,
      userUserImage: userImage,
      issueDate: DateTime(2025, 5, 8),
      description: 'AC not working',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
      userName: 'Charlie Green',
      userEmail: 'charlie@mail.com',
      userPhoneNumber: '1122334455',
      resolvingIssueDate: null,
    ),
    MaintenanceModel(
      id: "4",
      apartmentName: 'Ocean View',
      apartmentLocation: 'Miami, FL',
      apartmentRoomNumber: 'D-101',
      floor: '1st floor',
      type: 'Studio',
      image: maintenanceImage,
      userUserImage: userImage,
      issueDate: DateTime(2025, 4, 30),
      description: 'Power socket broken',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
      userName: 'Diana Rose',
      userEmail: 'diana@mail.com',
      userPhoneNumber: '5566778899',
      resolvingIssueDate: DateTime(2025, 5, 5),
    ),
    MaintenanceModel(
      id: "5",
      apartmentName: 'Green Meadows',
      apartmentLocation: 'Seattle, WA',
      apartmentRoomNumber: 'E-404',
      floor: '4th floor',
      type: 'Studio',
      image: maintenanceImage,
      userUserImage: userImage,
      issueDate: DateTime(2025, 6, 1),
      description: 'Lift malfunctioning',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
      userName: 'Evan Black',
      userEmail: 'evan@mail.com',
      userPhoneNumber: '6677889900',
      resolvingIssueDate: null,
    ),
    MaintenanceModel(
      id: "6",
      apartmentName: 'River Side',
      apartmentLocation: 'Chicago, IL',
      apartmentRoomNumber: 'F-302',
      floor: '3rd floor',
      type: '2 Bedroom',
      image: maintenanceImage,
      userUserImage: userImage,
      issueDate: DateTime(2025, 5, 20),
      description: 'Clogged kitchen sink',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
      userName: 'Fiona White',
      userEmail: 'fiona@mail.com',
      userPhoneNumber: '9988776655',
      resolvingIssueDate: DateTime(2025, 5, 22),
    ),
    MaintenanceModel(
      id: "7",
      apartmentName: 'Sunset Villas',
      apartmentLocation: 'Downtown LA',
      apartmentRoomNumber: 'G-110',
      floor: '1st floor',
      type: 'Studio',
      image: maintenanceImage,
      userUserImage: userImage,
      issueDate: DateTime(2025, 5, 17),
      description: 'Broken door lock',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
      userName: 'George Hill',
      userEmail: 'george@mail.com',
      userPhoneNumber: '1231231234',
      resolvingIssueDate: null,
    ),
    MaintenanceModel(
      id: "8",
      apartmentName: 'Maple Residency',
      apartmentLocation: 'Brooklyn, NY',
      apartmentRoomNumber: 'H-211',
      floor: '2nd floor',
      type: '3 Bedroom',
      image: maintenanceImage,
      userUserImage: userImage,
      issueDate: DateTime(2025, 5, 11),
      description: 'Wi-Fi outage',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
      userName: 'Hannah Reed',
      userEmail: 'hannah@mail.com',
      userPhoneNumber: '2342342345',
      resolvingIssueDate: DateTime(2025, 5, 13),
    ),
    MaintenanceModel(
      id: "9",
      apartmentName: 'Palm Heights',
      apartmentLocation: 'Austin, TX',
      apartmentRoomNumber: 'I-510',
      floor: '5th floor',
      type: 'Studio',
      image: maintenanceImage,
      userUserImage: userImage,
      issueDate: DateTime(2025, 6, 2),
      description: 'Ceiling fan noise',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
      userName: 'Isaac Lane',
      userEmail: 'isaac@mail.com',
      userPhoneNumber: '3453453456',
      resolvingIssueDate: null,
    ),
    MaintenanceModel(
      id: "10",
      apartmentName: 'Ocean View',
      apartmentLocation: 'Miami, FL',
      apartmentRoomNumber: 'J-306',
      floor: '3rd floor',
      type: 'Studio',
      image: maintenanceImage,
      userUserImage: userImage,
      issueDate: DateTime(2025, 5, 28),
      description: 'No hot water in shower',
      issueImages: <String>[issueImage, issueImage, issueImage],
      issueVideos: <String>[issueVideo1, issueVideo2],
      userName: 'Julia Stone',
      userEmail: 'julia@mail.com',
      userPhoneNumber: '4564564567',
      resolvingIssueDate: null,
    ),
  ];

}
