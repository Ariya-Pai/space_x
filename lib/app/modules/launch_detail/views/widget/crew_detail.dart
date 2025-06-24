import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:space_x/app/data/model/crew_model.dart';
import 'package:space_x/core/utils/themes/color.dart';
import 'package:space_x/core/utils/themes/text.dart';
import 'package:space_x/localization/app_localization.dart';

class CrewDetail extends StatefulWidget {
  final List<CrewModel>? data;
  const CrewDetail({super.key, this.data});

  @override
  State<CrewDetail> createState() => _CrewDetailState();
}

class _CrewDetailState extends State<CrewDetail> {
  @override
  Widget build(BuildContext context) {
    List<CrewModel>? crew = widget.data;
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: localizations.crew.tile,
          fontWeight: FontWeight.w600,
          fonzSize: 20,
        ),
        // ignore: prefer_is_empty
        (crew?.length != 0)
            ? SizedBox(
              width: double.infinity,
              height: 170,
              child: ListView.builder(
                itemCount: crew?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _crewCard(crew?[index]);
                },
              ),
            )
            : Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: TextApp(text: "-", fonzSize: 20),
            ),
      ],
    );
  }

  Widget _crewCard(CrewModel? crew) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      width: 100,

      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            width: 100,
            height: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Image.network(
              crew?.image ?? "",
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder:
                  (context, error, stackTrace) => Center(
                    child: LoadingAnimationWidget.twoRotatingArc(
                      color: AppColorsWidget.textGrey,
                      size: 50,
                    ),
                  ),
            ),
          ),
          TextApp(
            text: crew?.name ?? "",
            fonzSize: 14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
