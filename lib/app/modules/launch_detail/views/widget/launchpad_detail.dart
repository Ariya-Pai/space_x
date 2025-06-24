import 'package:flutter/material.dart';
import 'package:space_x/app/data/model/lauchpad.dart';
import 'package:space_x/core/utils/themes/text.dart';
import 'package:space_x/core/utils/widgets/function_shared.dart';

class LaunchpadDetail extends StatefulWidget {
  final LaunchPadModel? data;
  const LaunchpadDetail({super.key, this.data});

  @override
  State<LaunchpadDetail> createState() => _LaunchpadDetailState();
}

class _LaunchpadDetailState extends State<LaunchpadDetail> {
  @override
  Widget build(BuildContext context) {
    LaunchPadModel? launchPad = widget.data;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(text: "Launchpad", fontWeight: FontWeight.w600, fonzSize: 20),
        FunctionShared.textSpand(
          title: "Name",
          description: launchPad?.name ?? "-",
        ),
        FunctionShared.textSpand(
          title: "Full name",
          description: launchPad?.fullName ?? "-",
        ),
        FunctionShared.textSpand(
          title: "Locality",
          description: launchPad?.locality ?? "-",
        ),
        FunctionShared.textSpand(
          title: "Region",
          description: launchPad?.region ?? "-",
        ),
        FunctionShared.textSpand(
          title: "TimeZone",
          description: launchPad?.timezone ?? "-",
        ),
        FunctionShared.textSpand(
          title: "Status",
          description: launchPad?.status ?? "-",
        ),
      ],
    );
  }
}
