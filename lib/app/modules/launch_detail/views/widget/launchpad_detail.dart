import 'package:flutter/material.dart';
import 'package:space_x/app/data/model/lauchpad.dart';
import 'package:space_x/core/utils/themes/text.dart';
import 'package:space_x/core/utils/widgets/function_shared.dart';
import 'package:space_x/localization/app_localization.dart';

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
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: localizations.launchpad.title,
          fontWeight: FontWeight.w600,
          fonzSize: 20,
        ),
        FunctionShared.textSpand(
          title: localizations.home.name,
          description: launchPad?.name ?? "-",
        ),
        FunctionShared.textSpand(
          title: localizations.launchpad.fullName,
          description: launchPad?.fullName ?? "-",
        ),
        FunctionShared.textSpand(
          title: localizations.launchpad.locality,
          description: launchPad?.locality ?? "-",
        ),
        FunctionShared.textSpand(
          title: localizations.launchpad.region,
          description: launchPad?.region ?? "-",
        ),
        FunctionShared.textSpand(
          title: localizations.launchpad.timeZone,
          description: launchPad?.timezone ?? "-",
        ),
        FunctionShared.textSpand(
          title: localizations.launchpad.status,
          description: launchPad?.status ?? "-",
        ),
      ],
    );
  }
}
