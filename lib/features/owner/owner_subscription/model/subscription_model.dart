import 'package:alora/core/config/app_colors.dart';
import 'package:flutter/material.dart';

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
      title: 'Standard',
      duration: 'Month',
      durationNumber: 1,
      unitType: '1-3 units',
      price: 9.00,
    ),
    SubscriptionModel(
      id: '2',
      title: 'Deluxe',
      duration: 'Month',
      durationNumber: 1,
      unitType: '1-3 units',
      price: 20.00,
    ),
    SubscriptionModel(
      id: '3',
      title: 'Standard',
      duration: 'Month',
      durationNumber: 1,
      unitType: '4-5 units',
      price: 19.00,
    ),
    SubscriptionModel(
      id: '4',
      title: 'Deluxe',
      duration: 'Month',
      durationNumber: 1,
      unitType: '4-5 units',
      price: 200.00,
    ),
    SubscriptionModel(
      id: '5',
      title: 'Standard',
      duration: 'Month',
      durationNumber: 1,
      unitType: '5-10 units',
      price: 99.99,
    ),
  ];
}
