class ApartmentModel {
  final String id;
  final String title;
  final String image;
  final String apartmentName;
  final String apartmentLocation;
  final String apartmentDescription;

  final List<Facility> apartmentFacilities; 
  final List<String> apartmentImages;

  final List<String> availableUnitTypes;
  final List<String> availableFloors; 

  final List<ApartmentUnit> apartmentNumbers; 

  final String ownerEmail;
  final String ownerPhoneNumber;

  final double price;
  final String priceType; 

  ApartmentModel({
    required this.id,
    required this.title,
    required this.image,
    required this.apartmentName,
    required this.apartmentLocation,
    required this.apartmentDescription,
    required this.apartmentFacilities,
    required this.apartmentImages,
    required this.availableUnitTypes,
    required this.availableFloors,
    required this.apartmentNumbers,
    required this.ownerEmail,
    required this.ownerPhoneNumber,
    required this.price,
    required this.priceType,
  });
}

class Facility {
  final String icon;
  final String name;

  Facility({
    required this.icon,
    required this.name,
  });
}

class ApartmentUnit {
  final String title;
  final List<Facility> facilities;
  final List<String> unitImages;

  ApartmentUnit({
    required this.title,
    required this.facilities,
    required this.unitImages,
  });
}
