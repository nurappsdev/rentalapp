import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_icons.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/utils/custom_bottom_sheet.dart';
import 'package:alora/core/widgets/custom_app_bar.dart';
import 'package:alora/core/widgets/custom_button.dart';
import 'package:alora/core/widgets/custom_network_image.dart';
import 'package:alora/core/widgets/custom_rounded_inner_icon.dart';
import 'package:alora/core/widgets/custom_text_field.dart';
import 'package:alora/shared/models/maintenance_model.dart';
import 'package:alora/shared/widgets/custom_dropdown.dart';
import 'package:alora/shared/widgets/custom_file_upload_layout.dart';
import 'package:alora/shared/widgets/delete_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/owner_create_apartment_controller.dart';

class OwnerCreateApartmentScreen extends GetView<OwnerCreateApartmentController> {
  const OwnerCreateApartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> countries = <String>[
      "Afghanistan",
      "Albania",
      "Algeria",
      "Andorra",
      "Angola",
      "Antigua and Barbuda",
      "Argentina",
      "Armenia",
      "Australia",
      "Austria",
      "Azerbaijan",
      "Bahamas",
      "Bahrain",
      "Bangladesh",
      "Barbados",
      "Belarus",
      "Belgium",
      "Belize",
      "Benin",
      "Bhutan",
      "Bolivia",
      "Bosnia and Herzegovina",
      "Botswana",
      "Brazil",
      "Brunei",
      "Bulgaria",
      "Burkina Faso",
      "Burundi",
      "Cabo Verde",
      "Cambodia",
      "Cameroon",
      "Canada",
      "Central African Republic",
      "Chad",
      "Chile",
      "China",
      "Colombia",
      "Comoros",
      "Congo (Congo-Brazzaville)",
      "Costa Rica",
      "Croatia",
      "Cuba",
      "Cyprus",
      "Czechia (Czech Republic)",
      "Democratic Republic of the Congo",
      "Denmark",
      "Djibouti",
      "Dominica",
      "Dominican Republic",
      "Ecuador",
      "Egypt",
      "El Salvador",
      "Equatorial Guinea",
      "Eritrea",
      "Estonia",
      "Eswatini (fmr. 'Swazilan')",
      "Ethiopia",
      "Fiji",
      "Finland",
      "France",
      "Gabon",
      "Gambia",
      "Georgia",
      "Germany",
      "Ghana",
      "Greece",
      "Grenada",
      "Guatemala",
      "Guinea",
      "Guinea-Bissau",
      "Guyana",
      "Haiti",
      "Holy See",
      "Honduras",
      "Hungary",
      "Iceland",
      "India",
      "Indonesia",
      "Iran",
      "Iraq",
      "Ireland",
      "Israel",
      "Italy",
      "Jamaica",
      "Japan",
      "Jordan",
      "Kazakhstan",
      "Kenya",
      "Kiribati",
      "Kuwait",
      "Kyrgyzstan",
      "Laos",
      "Latvia",
      "Lebanon",
      "Lesotho",
      "Liberia",
      "Libya",
      "Liechtenstein",
      "Lithuania",
      "Luxembourg",
      "Madagascar",
      "Malawi",
      "Malaysia",
      "Maldives",
      "Mali",
      "Malta",
      "Marshall Islands",
      "Mauritania",
      "Mauritius",
      "Mexico",
      "Micronesia",
      "Moldova",
      "Monaco",
      "Mongolia",
      "Montenegro",
      "Morocco",
      "Mozambique",
      "Myanmar (formerly Burma)",
      "Namibia",
      "Nauru",
      "Nepal",
      "Netherlands",
      "New Zealand",
      "Nicaragua",
      "Niger",
      "Nigeria",
      "North Korea",
      "North Macedonia",
      "Norway",
      "Oman",
      "Pakistan",
      "Palau",
      "Palestine State",
      "Panama",
      "Papua New Guinea",
      "Paraguay",
      "Peru",
      "Philippines",
      "Poland",
      "Portugal",
      "Qatar",
      "Romania",
      "Russia",
      "Rwanda",
      "Saint Kitts and Nevis",
      "Saint Lucia",
      "Saint Vincent and the Grenadines",
      "Samoa",
      "San Marino",
      "Sao Tome and Principe",
      "Saudi Arabia",
      "Senegal",
      "Serbia",
      "Seychelles",
      "Sierra Leone",
      "Singapore",
      "Slovakia",
      "Slovenia",
      "Solomon Islands",
      "Somalia",
      "South Africa",
      "South Korea",
      "South Sudan",
      "Spain",
      "Sri Lanka",
      "Sudan",
      "Suriname",
      "Sweden",
      "Switzerland",
      "Syria",
      "Tajikistan",
      "Tanzania",
      "Thailand",
      "Timor-Leste",
      "Togo",
      "Tonga",
      "Trinidad and Tobago",
      "Tunisia",
      "Turkey",
      "Turkmenistan",
      "Tuvalu",
      "Uganda",
      "Ukraine",
      "United Arab Emirates",
      "United Kingdom",
      "United States of America",
      "Uruguay",
      "Uzbekistan",
      "Vanuatu",
      "Venezuela",
      "Vietnam",
      "Yemen",
      "Zambia",
      "Zimbabwe",
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.createApartment,
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontal),
          child: Column(
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenItems),
              Container(
                width: context.screenWidth,
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                decoration: BoxDecoration(
                  border: Border.all(width: AppSizes.dividerThick, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Apartment Name", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),

                    Text("Country", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomDropdown<String>(
                      options: countries,
                      hint: "Select Country",
                      displayString: (String value) {
                        return value;
                      },
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("State", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      borderRadius: 12.0,
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("City", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      borderRadius: 12.0,
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Address", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      borderRadius: 12.0,
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Zip Code", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Apartment Description", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      minLines: 4,
                      maxLines: 10,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Unit Types", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomDropdown<String>(
                      options: const <String>['Studio', "1 Room Bed", "2 Room Bed"],
                      displayString: (String p1) {
                        return p1;
                      },
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Lease Terms", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomDropdown<String>(
                      options: const <String>['1 Month', "2 Month", "3 Month"],
                      displayString: (String p1) {
                        return p1;
                      },
                    ),
                    const Divider(),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Rent Payment Due Date", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Checkbox(value: false, onChanged: (bool? value) {}),
                          Text("Date of move in", style: context.txtTheme.bodyLarge),

                          Checkbox(value: false, onChanged: (bool? value) {}),
                          Text("1st of the month", style: context.txtTheme.bodyLarge),
                        ],
                      ),
                    ),

                    const Divider(),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Checkbox(value: false, onChanged: (bool? value) {}),
                          Text("Require deposit", style: context.txtTheme.bodyLarge),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Set deposit amount", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomTextField(
                      controller: TextEditingController(),
                      isBorder: true,
                      borderRadius: 12.0,
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomButton(
                          onTap: () async{

                            final result = await showDialog<AmenitiesSelection>(
                              context: context,
                              builder: (_) => const AmenitiesDialog(),
                            );
                            if (result != null) {
                              // Handle selected amenities
                              debugPrint('Selected: ${result.selected}');
                            }
                          },
                          width: 150,
                          borderRadius: 50.0,
                          text: "Add Facilities",
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                    Text("Parking Type", style: context.txtTheme.titleMedium),
                    const SizedBox(height: AppSizes.md),

                    CustomDropdown<String>(
                      options: const <String>[""],
                      displayString: (String p1) {
                        return p1;
                      },
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems),

                    CustomFileUploadLayout(
                      label: "Upload your Apartment  Cover image",
                      onBrowseCallback: () {},
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),

                    CustomFileUploadLayout(
                      label: "Upload your Apartment  Additional image",
                      onBrowseCallback: () {},
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: AppSizes.md,
                      children: <Widget>[
                        Expanded(
                          child: CustomButton(
                            onTap: () => Get.back(),
                            isOutline: true,
                            text: "Back",
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            onTap: () => Get.toNamed(AppRoutes.ownerCreateApartmentAddUnitRoute),
                            text: "Save",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBetweenItems),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections),
            ],
          ),
        ),
      ),
    );
  }
}





// ─── Data Model ────────────────────────────────────────────────────────────

class AmenitiesData {
  final Map<String, List<String>> sections = {
    'Core Amenities': [
      'Air Conditioning', 'Heating', 'Ceiling Fans', 'In-Unit Washer',
      'In-Unit Dryer', 'Washer And Dryer Hookups', 'Ethernet Ports',
      'Pre-Installed Wi-Fi', 'Cable Or Satellite Ready',
    ],
    'Kitchen Appliances': [
      'Refrigerator', 'Stove / Oven', 'Microwave', 'Dishwasher',
      'Garbage Disposal', 'Range Hood', 'Ice Maker',
      'Water Dispenser', 'Smart Appliances (If Applicable)',
    ],
    'Bathroom Features': [
      'Bathtub', 'Walk-In Shower', 'Double Sink', 'Exhaust Fan',
      'Bidet Hookup',
    ],
    'Interior Features': [
      'Balcony Or Patio Access', 'Walk-in Closets', 'Built-In Shelves',
      'Smart Thermostat', 'Smart Lock Or Keyless Entry',
      'Furnished Or Unfurnished Option', 'Storage Room Or Closet',
    ],
    'Floor Types': [
      'Carpet', 'Hardwood', 'Laminate', 'Vinyl / LVP', 'Tile', 'Concrete',
    ],
    'Utilities & Safety': [
      'Water Included', 'Gas Included', 'Electricity Included',
      'Fire Extinguisher', 'Smoke Detectors',
      'Carbon Monoxide Detectors', 'Sprinkler System',
    ],
  };
}

// ─── Selected Amenities State ───────────────────────────────────────────────

class AmenitiesSelection {
  final Map<String, Set<String>> selected = {};
  final Map<String, String> otherText = {};

  void toggle(String section, String item) {
    selected[section] ??= {};
    if (selected[section]!.contains(item)) {
      selected[section]!.remove(item);
    } else {
      selected[section]!.add(item);
    }
  }

  bool isSelected(String section, String item) {
    return selected[section]?.contains(item) ?? false;
  }
}

// ─── Dialog ────────────────────────────────────────────────────────────────

class AmenitiesDialog extends StatefulWidget {
  const AmenitiesDialog({super.key});

  @override
  State<AmenitiesDialog> createState() => _AmenitiesDialogState();
}

class _AmenitiesDialogState extends State<AmenitiesDialog> {
  final AmenitiesData _data = AmenitiesData();
  final AmenitiesSelection _selection = AmenitiesSelection();
  final Map<String, TextEditingController> _otherControllers = {};

  @override
  void dispose() {
    for (final c in _otherControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  TextEditingController _getOtherController(String section) {
    _otherControllers[section] ??= TextEditingController();
    return _otherControllers[section]!;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 24.h,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Amenities',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, size: 20.r),
                    onPressed: () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),

            // Scrollable content
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _data.sections.entries.map((entry) {
                    return _buildSection(entry.key, entry.value);
                  }).toList(),
                ),
              ),
            ),

            // Footer buttons
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFFE0E0E0))),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        side: const BorderSide(color: Color(0xFFCCCCCC)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: const Color(0xFF666666),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(_selection);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        backgroundColor: const Color(0xFF1A1A1A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: items.map((item) => _buildChip(title, item)).toList(),
          ),
          SizedBox(height: 10.h),
          Text(
            'Other',
            style: TextStyle(fontSize: 13.sp, color: const Color(0xFF555555)),
          ),
          SizedBox(height: 6.h),
          SizedBox(
            height: 40.h,
            child: TextField(
              controller: _getOtherController(title),
              decoration: InputDecoration(
                hintText: "add new",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 8.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: const BorderSide(color: Color(0xFF2CB5EB)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: const BorderSide(color:Color(0xFF2CB5EB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: const BorderSide(color: Color(0xFF2CB5EB)),
                ),
              ),
              style: TextStyle(fontSize: 13.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String section, String label) {
    final selected = _selection.isSelected(section, label);
    return GestureDetector(
      onTap: () => setState(() => _selection.toggle(section, label)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          gradient: selected
              ? const LinearGradient(
            colors: [Color(0xFF2CB5EB), Color(0xFF196685)], // replace 2nd color with your desired end color
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )
              : const LinearGradient(
            colors: [Color(0xffEAF8FD), Color(0xffEAF8FD)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          border: Border.all(
            color: selected ? const Color(0xFF2CB5EB) : const Color(0xFF2CB5EB),
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            color: selected ? Colors.white : const Color(0xFF333333),
            fontWeight: selected ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}