import 'package:flutter/material.dart';
import 'package:space_x/app/data/model/launches_model.dart';
import 'package:space_x/core/utils/themes/color.dart';
import 'package:space_x/core/utils/themes/text.dart';
import 'package:space_x/core/utils/widgets/function_shared.dart';

class LaunchesDetail extends StatelessWidget {
  final LaunchesModel? data;
  const LaunchesDetail({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: data?.name ?? "N/A",
          fontWeight: FontWeight.w600,
          fonzSize: 28,
        ),
        const SizedBox(height: 10),
        TextApp(text: "Detail"),
        TextApp(
          text: data?.details ?? "-",
          textColor: AppColorsWidget.textGrey,
        ),
        const SizedBox(height: 5),

        FunctionShared.textSpand(
          title: "Success",
          description: data?.success == true ? "Yes" : "No",
        ),
        FunctionShared.textSpand(
          title: "Upcoming",
          description: data?.upcoming == true ? "Yes" : "No",
        ),
        FunctionShared.textSpand(
          title: "Launched date:",
          description:
              data?.dateUtc != null
                  ? FunctionShared.dataFomat(data!.dateUtc!.toLocal())
                  : "N/A",
        ),
      ],
    );
  }
}
