class ApplicationReqModel {
  final String id;
  final String image;
  final String type;
  final int count;

  ApplicationReqModel({
    required this.id, 
    required this.image, 
    required this.type, 
    required this.count
  });

  static String applicationReqImage = "https://i.ibb.co/RpvxyL3C/8e09f2137bde140d80ce1ec0253b9e802a214a13.png";
  static final List<ApplicationReqModel> dummyApplicationReqModel = <ApplicationReqModel>[
    ApplicationReqModel(id: "1", image: applicationReqImage, type: "Studio", count: 10),
    ApplicationReqModel(id: "2", image: applicationReqImage, type: "1 Bed Room", count: 6),
    ApplicationReqModel(id: "3", image: applicationReqImage, type: "2 Bed Room", count: 4),
    ApplicationReqModel(id: "4", image: applicationReqImage, type: "Pent House", count: 2),
  ];
  
}
