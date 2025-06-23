class OwnerEventModel {
  final String id;
  final String image;
  final DateTime date;
  final String title;
  final String description;

  OwnerEventModel({
    required this.id,
    required this.image,
    required this.date,
    required this.title,
    required this.description,
  });

  factory OwnerEventModel.fromJson(Map<String, dynamic> json) {
    return OwnerEventModel(
      id: json['id'],
      image: json['image'],
      date: DateTime.parse(json['date']),
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'date': date.toIso8601String(),
      'title': title,
      'description': description,
    };
  }

  static const String eventImageUrl = 'https://i.ibb.co/99xZp3xt/b8824ba69203656c1f92ad14ca85a4cfd9ec9789.png';

  static final List<OwnerEventModel> ownerEvents = <OwnerEventModel>[
    OwnerEventModel(
      id: '1',
      image: eventImageUrl,
      date: DateTime(2025, 1, 1),
      title: 'New Year Gathering',
      description: 'Join us at Digital Future 2025, the premier technology event bringing together industry leaders, innovators, startups, and digital enthusiasts under one roof. This two-day experience will dive deep into the latest trends in AI, Web 3.0, cybersecurity, smart tech, blockchain, UX/UI, and digital transformation.',
    ),
    OwnerEventModel(
      id: '2',
      image: eventImageUrl,
      date: DateTime(2025, 2, 14),
      title: 'Valentine’s Movie Night',
      description: 'Romantic movie screening in the lounge with snacks.',
    ),
    OwnerEventModel(
      id: '3',
      image: eventImageUrl,
      date: DateTime(2025, 3, 17),
      title: 'St. Patrick’s Day Party',
      description: 'Join us at Digital Future 2025, the premier technology event bringing together industry leaders, innovators, startups, and digital enthusiasts under one roof. This two-day experience will dive deep into the latest trends in AI, Web 3.0, cybersecurity, smart tech, blockchain, UX/UI, and digital transformation.',
    ),
    OwnerEventModel(
      id: '4',
      image: eventImageUrl,
      date: DateTime(2025, 4, 1),
      title: 'Spring Cleaning Day',
      description: 'Join hands to freshen up shared community spaces.',
    ),
    OwnerEventModel(
      id: '5',
      image: eventImageUrl,
      date: DateTime(2025, 5, 5),
      title: 'Cinco de Mayo Fiesta',
      description: 'Join us at Digital Future 2025, the premier technology event bringing together industry leaders, innovators, startups, and digital enthusiasts under one roof. This two-day experience will dive deep into the latest trends in AI, Web 3.0, cybersecurity, smart tech, blockchain, UX/UI, and digital transformation.',
    ),
    OwnerEventModel(
      id: '6',
      image: eventImageUrl,
      date: DateTime(2025, 6, 21),
      title: 'Summer Solstice BBQ',
      description: 'Join us at Digital Future 2025, the premier technology event bringing together industry leaders, innovators, startups, and digital enthusiasts under one roof. This two-day experience will dive deep into the latest trends in AI, Web 3.0, cybersecurity, smart tech, blockchain, UX/UI, and digital transformation.',
    ),
    OwnerEventModel(
      id: '7',
      image: eventImageUrl,
      date: DateTime(2025, 7, 4),
      title: 'Independence Day Fireworks',
      description: 'Watch fireworks together from the community terrace.',
    ),
    OwnerEventModel(
      id: '8',
      image: eventImageUrl,
      date: DateTime(2025, 8, 15),
      title: 'Back to School Drive',
      description: 'Donate supplies and support local kids.',
    ),
    OwnerEventModel(
      id: '9',
      image: eventImageUrl,
      date: DateTime(2025, 9, 30),
      title: 'Fall Decoration Contest',
      description: 'Join us at Digital Future 2025, the premier technology event bringing together industry leaders, innovators, startups, and digital enthusiasts under one roof. This two-day experience will dive deep into the latest trends in AI, Web 3.0, cybersecurity, smart tech, blockchain, UX/UI, and digital transformation.',
    ),
    OwnerEventModel(
      id: '10',
      image: eventImageUrl,
      date: DateTime(2025, 10, 31),
      title: 'Halloween Bash',
      description: 'Costume contest, candy, and scary movies.',
    ),
    OwnerEventModel(
      id: '11',
      image: eventImageUrl,
      date: DateTime(2025, 11, 24),
      title: 'Thanksgiving Potluck',
      description: 'Join us at Digital Future 2025, the premier technology event bringing together industry leaders, innovators, startups, and digital enthusiasts under one roof. This two-day experience will dive deep into the latest trends in AI, Web 3.0, cybersecurity, smart tech, blockchain, UX/UI, and digital transformation.',
    ),
    OwnerEventModel(
      id: '12',
      image: eventImageUrl,
      date: DateTime(2025, 12, 15),
      title: 'Holiday Cookie Exchange',
      description: 'Bring cookies and take some home.',
    ),
    OwnerEventModel(
      id: '13',
      image: eventImageUrl,
      date: DateTime(2025, 12, 31),
      title: 'New Year’s Eve Countdown',
      description: 'Ring in the new year with live music and champagne.',
    ),
  ];

}
