class SubscriptionModel {
  final String id;
  final String title;
  final String duration;
  final int durationNumber;
  final String unitType;
  final double price;

  SubscriptionModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.durationNumber,
    required this.unitType,
    required this.price,
  });

  factory SubscriptionModel.fromMap(Map<String, dynamic> map) {
    return SubscriptionModel(
      id: map['id'],
      title: map['title'],
      duration: map['duration'],
      durationNumber: map['durationNumber'],
      unitType: map['unitType'],
      price: (map['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'duration': duration,
      'durationNumber': durationNumber,
      'unitType': unitType,
      'price': price,
    };
  }

  static final List<SubscriptionModel> dummySubscriptions = <SubscriptionModel>[
    SubscriptionModel(
      id: '1',
      title: 'Basic Plan',
      duration: 'Month',
      durationNumber: 1,
      unitType: '1-3 units',
      price: 29.99,
    ),
    SubscriptionModel(
      id: '2',
      title: 'Standard Plan',
      duration: 'Month',
      durationNumber: 1,
      unitType: '4-5 units',
      price: 49.99,
    ),
    SubscriptionModel(
      id: '3',
      title: 'Premium Plan',
      duration: 'Month',
      durationNumber: 1,
      unitType: '1-3 units',
      price: 299.99,
    ),
    SubscriptionModel(
      id: '4',
      title: 'Family Plan',
      duration: 'Month',
      durationNumber: 1,
      unitType: '4-5 units',
      price: 449.99,
    ),
    SubscriptionModel(
      id: '5',
      title: 'Business Plan',
      duration: 'Month',
      durationNumber: 1,
      unitType: '5-10 units',
      price: 99.99,
    ),
  ];

}
