import 'package:alora/core/config/app_icons.dart';
import 'package:alora/features/renter/search_apartments/model/apartment_model.dart';
import 'package:get/get.dart';

class OwnerRenterListController extends GetxController {

  final RxInt count = 0.obs;

  void increment() => count.value++;

  final RxList<ApartmentModel> apartmentList = <ApartmentModel>[].obs;
  final RxBool apartmentsLoading = false.obs;


  
  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  /// 
  @override
  void onInit() {
    super.onInit();
    apartmentsLoading.value = true;
    Future<dynamic>.delayed(const Duration(milliseconds: 500), (){
      apartmentList.assignAll(dummyApartments);
    });

    Future<dynamic>.delayed(const Duration(seconds: 1), (){
      apartmentsLoading.value = false;
    });
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    apartmentList.clear();
    apartmentsLoading.value = false;
    super.dispose();
  }


  static String image = "https://i.ibb.co/7dtBDZHy/d5e76c655b0cfd55a7449f24d43b8129f4334ab2.png";
  static String apartmentImage = "https://i.ibb.co/RpvxyL3C/8e09f2137bde140d80ce1ec0253b9e802a214a13.png";

  final List<ApartmentModel> dummyApartments = <ApartmentModel>[
    ApartmentModel(
      id: "1",
      title: 'Luxury Studio in Downtown',
      image: image,
      apartmentName: 'City View Apartments',
      apartmentLocation: 'Downtown, New York',
      apartmentDescription: 'Welcome to Suncity Apartments, where comfort meets convenience. Located in a prime urban neighborhood, Suncity offers stylish 1, 2, and 3-bedroom units designed for modern living. Each apartment features spacious layouts, large windows with natural light, fully equipped kitchens, premium fittings, and private balconies with stunning city views.',
      apartmentFacilities: <Facility>[
        Facility(icon: AppIcons.carIcon, name: 'Parking'),
        Facility(icon: AppIcons.leftIcon, name: 'Left'),
      ],
      apartmentImages: <String>[
        apartmentImage,
        apartmentImage,
        apartmentImage,
        apartmentImage,
      ],
      availableUnitTypes: <String>['Studio', 'Bed Room', '2 Bed Room', '3 Bed Room', 'Pent House'],
      availableFloors: <String>['1st Floor', '2nd Floor', '3rd Floor', '4th Floor', '5th Floor'],
      apartmentNumbers: <ApartmentUnit>[
        ApartmentUnit(
          title: 'BG101',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '2 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG102',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '3 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG103',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '1600 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG104',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '14 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
      ],
      ownerEmail: 'owner1@example.com',
      ownerPhoneNumber: '+1234567890',
      price: 1200.0,
      priceType: 'Monthly',
    ),

    ApartmentModel(
      id: "2",
      title: 'Modern 2 Bedroom Flat',
      image: image,
      apartmentName: 'Sunset Residences',
      apartmentLocation: 'Los Angeles, CA',
      apartmentDescription: 'Spacious and modern 2-bedroom flat with sunset views.',
      apartmentFacilities: <Facility>[
        Facility(icon: AppIcons.carIcon, name: 'Parking'),
        Facility(icon: AppIcons.gardenIcon, name: 'Garden'),
      ],
      apartmentImages: <String>[
        apartmentImage,
        apartmentImage,
        apartmentImage,
        apartmentImage,
      ],
      availableUnitTypes: <String>['Studio', 'Bed Room', '2 Bed Room', '3 Bed Room'],
      availableFloors: <String>['1st Floor', '2nd Floor', '3rd Floor', '4th Floor'],
      apartmentNumbers: <ApartmentUnit>[
        ApartmentUnit(
          title: 'BG101',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '2 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG102',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '3 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG103',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '1600 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG104',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '14 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
      ],
      ownerEmail: 'owner2@example.com',
      ownerPhoneNumber: '+1987654321',
      price: 2500.0,
      priceType: 'Monthly',
    ),

    ApartmentModel(
      id: "3",
      title: 'Stylish Penthouse Suite',
      image: image,
      apartmentName: 'Elite Heights',
      apartmentLocation: 'Miami, FL',
      apartmentDescription: 'Exclusive penthouse with private rooftop access.',
      apartmentFacilities: <Facility>[
        Facility(icon: AppIcons.carIcon, name: 'Parking'),
        Facility(icon: AppIcons.leftIcon, name: 'Left'),
      ],
      apartmentImages: <String>[
        apartmentImage,
        apartmentImage,
        apartmentImage,
        apartmentImage,
      ],
      availableUnitTypes: <String>['Studio', 'Bed Room', '2 Bed Room', '3 Bed Room', 'Pent House'],
      availableFloors: <String>['1st Floor', '2nd Floor', '3rd Floor', '4th Floor', '5th Floor'],
      apartmentNumbers: <ApartmentUnit>[
        ApartmentUnit(
          title: 'BG101',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '2 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG102',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '3 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG103',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '1600 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG104',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '14 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
      ],
      ownerEmail: 'owner3@example.com',
      ownerPhoneNumber: '+1122334455',
      price: 5000.0,
      priceType: 'Monthly',
    ),

    ApartmentModel(
      id: "4",
      title: 'Affordable 1 Bedroom',
      image: image,
      apartmentName: 'Greenwood Apartments',
      apartmentLocation: 'Austin, TX',
      apartmentDescription: 'Ideal for singles or couples with greenery views.',
      apartmentFacilities: <Facility>[
        Facility(icon: AppIcons.carIcon, name: 'Parking'),
        Facility(icon: AppIcons.leftIcon, name: 'Left'),
        Facility(icon: AppIcons.gardenIcon, name: 'Garden'),
      ],
      apartmentImages: <String>[
        apartmentImage,
        apartmentImage,
        apartmentImage,
        apartmentImage,
      ],
      availableUnitTypes: <String>['Studio', 'Bed Room', '2 Bed Room', '3 Bed Room', 'Pent House'],
      availableFloors: <String>['1st Floor', '2nd Floor', '3rd Floor', '4th Floor', '5th Floor'],
      apartmentNumbers: <ApartmentUnit>[
        ApartmentUnit(
          title: 'BG101',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '2 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG102',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '3 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG103',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '1600 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG104',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '14 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
      ],
      ownerEmail: 'owner4@example.com',
      ownerPhoneNumber: '+1002003004',
      price: 800.0,
      priceType: 'Monthly',
    ),

    ApartmentModel(
      id: "5",
      title: 'Downtown Highrise Studio',
      image: image,
      apartmentName: 'Skyline Towers',
      apartmentLocation: 'Chicago, IL',
      apartmentDescription: 'Located in the heart of the city with skyline views.',
      apartmentFacilities: <Facility>[
        Facility(icon: AppIcons.carIcon, name: 'Parking'),
        Facility(icon: AppIcons.leftIcon, name: 'Left'),
      ],
      apartmentImages: <String>[
        apartmentImage,
        apartmentImage,
        apartmentImage,
        apartmentImage,
      ],
      availableUnitTypes: <String>['Studio', 'Bed Room', '2 Bed Room', '3 Bed Room', 'Pent House'],
      availableFloors: <String>['1st Floor', '2nd Floor', '3rd Floor', '4th Floor', '5th Floor'],
      apartmentNumbers: <ApartmentUnit>[
        ApartmentUnit(
          title: 'BG101',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '2 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG102',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '3 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG103',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '1600 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG104',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '14 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
      ],
      ownerEmail: 'owner5@example.com',
      ownerPhoneNumber: '+1010101010',
      price: 1500.0,
      priceType: 'Monthly',
    ),

    ApartmentModel(
      id: "6",
      title: 'Beachfront Family Apartment',
      image: image,
      apartmentName: 'Ocean Breeze',
      apartmentLocation: 'Santa Monica, CA',
      apartmentDescription: 'Perfect for families, steps away from the beach.',
      apartmentFacilities: <Facility>[
        Facility(icon: AppIcons.carIcon, name: 'Parking'),
        Facility(icon: AppIcons.leftIcon, name: 'Left'),
      ],
      apartmentImages: <String>[
        apartmentImage,
        apartmentImage,
        apartmentImage,
        apartmentImage,
      ],
      availableUnitTypes: <String>['Studio', 'Bed Room', '2 Bed Room', '3 Bed Room', 'Pent House'],
      availableFloors: <String>['1st Floor', '2nd Floor', '3rd Floor', '4th Floor', '5th Floor'],
      apartmentNumbers: <ApartmentUnit>[
        ApartmentUnit(
          title: 'BG101',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '2 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG102',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '3 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG103',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '1600 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG104',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '14 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
      ],
      ownerEmail: 'owner6@example.com',
      ownerPhoneNumber: '+1100001100',
      price: 2700.0,
      priceType: 'Monthly',
    ),

    ApartmentModel(
      id: "7",
      title: 'Minimalist 1 Bedroom Loft',
      image: image,
      apartmentName: 'Loft Living',
      apartmentLocation: 'Portland, OR',
      apartmentDescription: 'Industrial loft style with high ceilings.',
      apartmentFacilities: <Facility>[
        Facility(icon: AppIcons.carIcon, name: 'Parking'),
        Facility(icon: AppIcons.leftIcon, name: 'Left'),
      ],
      apartmentImages: <String>[
        apartmentImage,
        apartmentImage,
        apartmentImage,
        apartmentImage,
      ],    
      availableUnitTypes: <String>['Studio', 'Bed Room', '2 Bed Room', '3 Bed Room', 'Pent House'],
      availableFloors: <String>['1st Floor', '2nd Floor', '3rd Floor', '4th Floor', '5th Floor'],
      apartmentNumbers: <ApartmentUnit>[
        ApartmentUnit(
          title: 'BG101',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '2 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG102',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '3 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG103',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '1600 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG104',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '14 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
      ],
      ownerEmail: 'owner7@example.com',
      ownerPhoneNumber: '+1400400400',
      price: 1300.0,
      priceType: 'Monthly',
    ),

    ApartmentModel(
      id: "8",
      title: 'Family Size Apartment',
      image: image,
      apartmentName: 'Harmony Homes',
      apartmentLocation: 'Seattle, WA',
      apartmentDescription: 'Spacious and family-friendly living spaces.',
      apartmentFacilities: <Facility>[
        Facility(icon: AppIcons.carIcon, name: 'Parking'),
      ],
      apartmentImages: <String>[
        apartmentImage,
        apartmentImage,
        apartmentImage,
        apartmentImage,
      ],
      availableUnitTypes: <String>['Studio', 'Bed Room', '2 Bed Room', '3 Bed Room', 'Pent House'],
      availableFloors: <String>['1st Floor', '2nd Floor', '3rd Floor', '4th Floor', '5th Floor'],
      apartmentNumbers: <ApartmentUnit>[
        ApartmentUnit(
          title: 'BG101',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '2 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG102',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '3 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG103',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '1600 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG104',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '14 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
      ],
      ownerEmail: 'owner8@example.com',
      ownerPhoneNumber: '+1222333444',
      price: 3200.0,
      priceType: 'Monthly',
    ),

    ApartmentModel(
      id: "9",
      title: 'Compact City Studio',
      image: image,
      apartmentName: 'MicroLiving',
      apartmentLocation: 'San Francisco, CA',
      apartmentDescription: 'Smart compact studio for busy professionals.',
      apartmentFacilities: <Facility>[
        Facility(icon: AppIcons.carIcon, name: 'Parking'),
        Facility(icon: AppIcons.leftIcon, name: 'Left'),
      ],
      apartmentImages: <String>[
        apartmentImage,
        apartmentImage,
        apartmentImage,
        apartmentImage,
      ],
      availableUnitTypes: <String>['Studio', 'Bed Room', '2 Bed Room', '3 Bed Room', 'Pent House'],
      availableFloors: <String>['1st Floor', '2nd Floor', '3rd Floor', '4th Floor', '5th Floor'],
      apartmentNumbers: <ApartmentUnit>[
        ApartmentUnit(
          title: 'BG101',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '2 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG102',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '3 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG103',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '1600 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG104',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '14 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
      ],
      ownerEmail: 'owner9@example.com',
      ownerPhoneNumber: '+1555666777',
      price: 950.0,
      priceType: 'Monthly',
    ),

    ApartmentModel(
      id: "10",
      title: 'Elegant Suburban Home',
      image: image,
      apartmentName: 'Willow Creek Estates',
      apartmentLocation: 'Charlotte, NC',
      apartmentDescription: 'Peaceful suburban estate with elegant interiors.',
      apartmentFacilities: <Facility>[
        Facility(icon: AppIcons.carIcon, name: 'Parking'),
        Facility(icon: AppIcons.leftIcon, name: 'Left'),
        Facility(icon: AppIcons.gardenIcon, name: 'Garden'),
      ],
      apartmentImages: <String>[
        apartmentImage,
        apartmentImage,
        apartmentImage,
        apartmentImage,
      ],
      availableUnitTypes: <String>['Studio', 'Bed Room', '2 Bed Room', '3 Bed Room', 'Pent House'],
      availableFloors: <String>['1st Floor', '2nd Floor', '3rd Floor', '4th Floor', '5th Floor'],
      apartmentNumbers: <ApartmentUnit>[
        ApartmentUnit(
          title: 'BG101',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '2 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG102',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '3 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG103',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '1600 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
            Facility(icon: AppIcons.gardenIcon, name: 'Belcony'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
        ApartmentUnit(
          title: 'BG104',
          facilities: <Facility>[
            Facility(icon: AppIcons.bedRoomIcon, name: '3 Bed Room'),
            Facility(icon: AppIcons.bathRoomIcon, name: '2 Bath Room'),
            Facility(icon: AppIcons.wifiIcon, name: 'Wifi'),
            Facility(icon: AppIcons.carIcon, name: 'Parking'),
            Facility(icon: AppIcons.squareFitIcon, name: '14 Sq Ft'),
            Facility(icon: AppIcons.gardenIcon, name: 'Ground'),
          ],
          unitImages: <String>[
            apartmentImage,
            apartmentImage,
            apartmentImage,
          ],
        ),
      ],
      ownerEmail: 'owner10@example.com',
      ownerPhoneNumber: '+1777888999',
      price: 4200.0,
      priceType: 'Monthly',
    ),
  ];
}
