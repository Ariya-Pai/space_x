import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:space_x/app/modules/home/bloc/home_bloc.dart';

class LaunchDetailPage extends StatelessWidget {
  const LaunchDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.loading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }

        final launch = state.oneLaunches;
        final launchpad = state.oneLaunchpad;

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
                            (context, error, stackTrace) => Container(
                              color: Colors.grey,
                              child: Center(child: Text("Image Loading")),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: screenSize.height * 0.45,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: screenSize.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        launch?.name ?? "No Name",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Success: ${launch?.success == true ? "Yes" : "No"}",
                      ),
                      Text(
                        "Upcoming: ${launch?.upcoming == true ? "Yes" : "No"}",
                      ),
                      Text(
                        "Date: ${launch?.dateUtc != null ? launch!.dateUtc!.toLocal().toString() : "N/A"}",
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Launchpad: ${launchpad?.fullName ?? "N/A"}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
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
