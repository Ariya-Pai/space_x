import 'package:flutter/material.dart';
import 'package:space_x/app/data/model/launches_model.dart';
import 'package:space_x/core/utils/themes/color.dart';
import 'package:space_x/core/utils/themes/text.dart';
import 'package:space_x/core/utils/widgets/function_shared.dart';
import 'package:space_x/localization/app_localization.dart';

class LaunchesDetail extends StatelessWidget {
  final LaunchesModel? data;
  const LaunchesDetail({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: data?.name ?? "N/A",
          fontWeight: FontWeight.w600,
          fonzSize: 28,
        ),
        const SizedBox(height: 10),
        TextApp(
          text: localizations.deatil.deatils,
          fontWeight: FontWeight.w600,
          fonzSize: 20,
        ),
        TextApp(
          text: data?.details ?? "-",
          textColor: AppColorsWidget.textGrey,
        ),
        const SizedBox(height: 5),

        FunctionShared.textSpand(
          title: localizations.deatil.statusTask,
          description:
              data?.success == true
                  ? localizations.deatil.yes
                  : localizations.deatil.no,
        ),
        FunctionShared.textSpand(
          title: localizations.deatil.dateLaunches,
          description:
              data?.success == true
                  ? localizations.deatil.upcomming
                  : localizations.deatil.launched,
        ),

        FunctionShared.textSpand(
          title: "${localizations.deatil.launchesDate}:",
          description:
              data?.dateUtc != null
                  ? FunctionShared.dataFomat(data!.dateUtc!.toLocal())
                  : "N/A",
        ),
      ],
    );
  }
}
