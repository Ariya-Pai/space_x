import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:space_x/app/modules/home/bloc/home_bloc.dart';
import 'package:space_x/app/modules/launch_detail/views/widget/crew_detail.dart';
import 'package:space_x/app/modules/launch_detail/views/widget/launches_detail.dart';
import 'package:space_x/app/modules/launch_detail/views/widget/launchpad_detail.dart';
import 'package:space_x/app/modules/launch_detail/views/widget/rocket_detail.dart';
import 'package:space_x/core/utils/themes/color.dart';

class LaunchDetailPage extends StatelessWidget {
  const LaunchDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.loading) {
          // context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }

        final launch = state.oneLaunches;
        final launchpad = state.oneLaunchpad;
        final rocket = state.rocketModel;
        final crew = state.crewModel;

        final imageUrl =
            (launchpad?.images?.isNotEmpty ?? false)
                ? launchpad!.images!.first
                : "https://via.placeholder.com/400x300.png?text=No+Image";

        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: screenSize.height,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.5,
                      child: Image.network(
                        imageUrl,
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
                  ],
                ),
              ),
              Positioned(
                top: screenSize.height * 0.45,
                child: SizedBox(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    width: screenSize.width,
                    height: screenSize.height * 0.55,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LaunchesDetail(data: launch),
                          Divider(),
                          RocketDetail(data: rocket),
                          Divider(),
                          CrewDetail(data: crew),
                          Divider(),
                          LaunchpadDetail(data: launchpad),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
