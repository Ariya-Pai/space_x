import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:space_x/app/data/model/rocket_Model.dart';
import 'package:space_x/core/utils/themes/color.dart';
import 'package:space_x/core/utils/themes/text.dart';
import 'package:space_x/core/utils/widgets/function_shared.dart';

class RocketDetail extends StatefulWidget {
  final RocketModel? data;
  const RocketDetail({super.key, this.data});

  @override
  State<RocketDetail> createState() => _RocketDetailState();
}

class _RocketDetailState extends State<RocketDetail> {
  @override
  Widget build(BuildContext context) {
    RocketModel? rocket = widget.data;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(text: "Rocket", fontWeight: FontWeight.w600, fonzSize: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: Image.network(
                      rocket?.flickrImages?.first ?? "",
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
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FunctionShared.textSpand(
                      title: "Name",
                      description: rocket?.name ?? "-",
                    ),
                    FunctionShared.textSpand(
                      title: "Type",
                      description: rocket?.type ?? "-",
                    ),
                    FunctionShared.textSpand(
                      title: "Contry",
                      description: rocket?.country ?? "-",
                    ),
                    FunctionShared.textSpand(
                      title: "Company",
                      description: rocket?.company ?? "-",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
