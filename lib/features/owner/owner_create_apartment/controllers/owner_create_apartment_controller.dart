import 'package:alora/core/config/app_icons.dart';
import 'package:alora/features/renter/search_apartments/model/apartment_model.dart';
import 'package:get/get.dart';

class OwnerCreateApartmentController extends GetxController {
  final RxInt count = 0.obs;

  void increment() => count.value++;

  final RxString isSubmitIncomeTaxDoc = '1 Month'.obs;
  set updateSubmitIncomeTaxDoc(String? value) {
    if (value != null) {
      isSubmitIncomeTaxDoc.value = value;
    }
  }

  final RxBool isSubmitIdCard = false.obs;
  set updateSubmitIdCard(bool? value) {
    if (value != null) {
      isSubmitIdCard.value = value;
    }
  }

  final RxBool isSubmitCreditApplicationDoc = false.obs;
  set updateSubmitCreditApplicationDoc(bool? value) {
    if (value != null) {
      isSubmitCreditApplicationDoc.value = value;
    }
  }

  final RxBool isMinimumIncomeEnable = false.obs;
  set updateMinimumIncomeEnable(bool? value) {
    if (value != null) {
      isMinimumIncomeEnable.value = value;
    }
  }

  final RxBool isUtilizeCreditApplication = false.obs;
  set updateUtilizeCreditApplication(bool? value) {
    if (value != null) {
      isMinimumIncomeEnable.value = value;
    }
  }

  final RxInt studioSelect = 1.obs;

  RxList<String> propOfIncomesSet = <String>['Pay stub', 'Bank Statement', 'Other'].obs;
  RxList<String> propOfIncomes = <String>[].obs;
  RxList<String> propOfIncomesSet1 =
      <String>['Government id', 'Passport', 'Driving license', 'Other'].obs;
  RxList<String> propOfIncomes1 = <String>[].obs;

  static String image = "https://i.ibb.co/7dtBDZHy/d5e76c655b0cfd55a7449f24d43b8129f4334ab2.png";
  static String apartmentImage =
      "https://i.ibb.co/RpvxyL3C/8e09f2137bde140d80ce1ec0253b9e802a214a13.png";

  ApartmentModel apartment = ApartmentModel(
    id: "1",
    title: 'Luxury Studio in Downtown',
    image: image,
    apartmentName: 'City View Apartments',
    apartmentLocation: 'Downtown, New York',
    apartmentDescription:
        'Welcome to Sanity Apartments, where comfort meets convenience. Located in a prime urban neighborhood, Sanity offers stylish 1, 2, and 3-bedroom units designed for modern living. Each apartment features spacious layouts, large windows with natural light, fully equipped kitchens, premium fittings, and private balconies with stunning city views.',
    apartmentFacilities: <Facility>[
      Facility(icon: AppIcons.carIcon, name: 'Parking'),
      Facility(icon: AppIcons.leftIcon, name: 'Left'),
    ],
    apartmentImages: <String>[apartmentImage, apartmentImage, apartmentImage, apartmentImage],
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
        unitImages: <String>[apartmentImage, apartmentImage, apartmentImage],
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
        unitImages: <String>[apartmentImage, apartmentImage, apartmentImage],
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
        unitImages: <String>[apartmentImage, apartmentImage, apartmentImage],
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
        unitImages: <String>[apartmentImage, apartmentImage, apartmentImage],
      ),
    ],
    ownerEmail: 'owner1@example.com',
    ownerPhoneNumber: '+1234567890',
    price: 1200.0,
    priceType: 'Monthly',
  );

  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  ///
  @override
  void onInit() {
    super.onInit();
    count.value = 0;
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    super.dispose();
    count.value = 0;
  }
}
