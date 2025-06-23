import 'package:alora/core/config/app_colors.dart';
import 'package:alora/core/config/app_sizes.dart';
import 'package:alora/core/extensions/context_extensions.dart';
import 'package:alora/core/extensions/date_time_extensions.dart';
import 'package:alora/core/extensions/widget_extensions.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CalendarConfig {
  CalendarConfig._();
  
  static CalendarDatePicker2Config calendarConfig({required BuildContext context}) {
    return CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.range,
      calendarViewMode: CalendarDatePicker2Mode.day,
      selectedDayTextStyle: context.txtTheme.titleSmall?.copyWith(color: AppColors.textWhiteColor),
      selectedDayHighlightColor: AppColors.primaryColor,
      weekdayLabelTextStyle: context.txtTheme.titleSmall,
      dayTextStyle: context.txtTheme.titleSmall,
      controlsTextStyle: context.txtTheme.titleSmall,
      disableModePicker: true,
      weekdayLabelBuilder: ({bool? isScrollViewTopHeader, required int weekday,}) {
        const List<String> labels = <String>['S', 'M', 'T', 'W', 'T', 'F', 'S'];
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF5F7FA),
          ),
          child: Text(
            labels[weekday],
            style: context.txtTheme.titleSmall
          ).centered,
        );
      },
      modePickerBuilder: ({ bool? isMonthPicker, required DateTime monthDate, required CalendarDatePicker2Mode viewMode,}) {
        if (isMonthPicker == true) {
          return const SizedBox.shrink();
        }
        return Text(
          monthDate.formattedMonthYear,
          style: context.txtTheme.titleMedium,
        ).centered;
      },
      dayBuilder: ({required DateTime date, BoxDecoration? decoration, bool? isDisabled, bool? isSelected, bool? isToday, TextStyle? textStyle}) {
        final bool isSelectedDay = isSelected ?? false;
        final bool isTodayDay = isToday ?? false;

        return Container(
          margin: const EdgeInsets.all(AppSizes.xs),
          decoration: BoxDecoration(
            color: isSelectedDay
                ? AppColors.primaryColor // selected background color
                : isTodayDay
                    ? Colors.teal.withValues(alpha: .3)
                    : null,
            borderRadius: BorderRadius.circular(AppSizes.xs),
            shape: BoxShape.rectangle,
          ),
          alignment: Alignment.center,
          child: Text(
            '${date.day}',
            style: context.txtTheme.titleSmall?.copyWith(
              color: isSelectedDay ? AppColors.textWhiteColor : AppColors.textBlackColor,
            )
          ),
        );
      },
      centerAlignModePicker: true,
    );
  }
}