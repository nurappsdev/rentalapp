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
                          onTap: () {},
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
