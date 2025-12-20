import 'dart:developer';
import 'package:country_picker/country_picker.dart';
import 'package:grambix/core/utils/space.dart';
import 'package:grambix/views/auth/register/controller/register_controller.dart';
import 'package:grambix/widgets/text_widget.dart';
import '../core/utils/basic_import.dart';

class CustomCountryPicker extends StatelessWidget {
  final RxString selectedCountry;

  const CustomCountryPicker({super.key, required this.selectedCountry});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        showCountryPicker(
          context: context,
          showSearch: true,
          useSafeArea: true,
          searchAutofocus: true,

          countryListTheme: CountryListThemeData(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            backgroundColor: CustomColor.background,
            bottomSheetHeight: MediaQuery.of(context).size.height * 0.45,

            /// Country list text
            textStyle: TextStyle(
              color: CustomColor.whiteColor,
              fontSize: 14.sp,
            ),

            /// Search field text (typing text color)
            searchTextStyle: TextStyle(
              color: CustomColor.whiteColor,
              fontSize: 14.sp,
            ),

            /// 🔥 Search TextField border, hint, label
            inputDecoration: InputDecoration(
              isDense: true, // 🔥 height কমায়

              // contentPadding: EdgeInsets.symmetric(
              //   vertical: 8.h,   // 🔥 এইটা adjust করো
              //   horizontal: 12.w,
              // ),
              hintText: 'Search country',
              hintStyle: TextStyle(
                color: CustomColor.whiteColor.withOpacity(0.5),
                fontSize: 14.sp,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                borderSide: BorderSide(
                  color: CustomColor.primary,
                  width: 1.5,
                ),
              ),

            ),
          ),

          onSelect: (Country country) {
            selectedCountry.value = country.name;
            log(selectedCountry.value);
          },
        );

      },
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: CustomColor.secondary.withAlpha(95),
          borderRadius: BorderRadiusGeometry.circular(Dimensions.radius * 0.95),
          border: Border.all(color: CustomColor.secondary),
        ),
        width: double.infinity,
        height: Dimensions.inputBoxHeight * 0.8,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: Dimensions.widthSize * 1.2,
          ),
          child: Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Obx(
                () => TextWidget(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.bodyMedium,
                  selectedCountry.value,
                ),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
