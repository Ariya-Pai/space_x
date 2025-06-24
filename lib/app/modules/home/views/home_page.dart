import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:space_x/app/data/model/launches_model.dart';
import 'package:space_x/app/modules/home/bloc/home_bloc.dart';
import 'package:space_x/core/utils/themes/color.dart';
import 'package:space_x/core/utils/themes/text.dart';
import 'package:space_x/core/utils/widgets/appbar_widget.dart';
import 'package:space_x/core/utils/widgets/function_shared.dart';
import 'package:space_x/core/utils/widgets/search_widget.dart';
import 'package:space_x/localization/app_localization.dart';
import 'package:space_x/routes/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  String _selectedSort = "date";
  List<LaunchesModel>? allLaunches;
  List<LaunchesModel>? filteredLaunches;

  @override
  void initState() {
    super.initState();
    searchController.addListener(_searchByName);
  }

  @override
  void dispose() {
    searchController.removeListener(_searchByName);
    searchController.dispose();
    super.dispose();
  }

  void _searchByName() {
    final query = searchController.text.toLowerCase();

    if (allLaunches == null) return;
    setState(() {
      if (query.isEmpty) {
        filteredLaunches = allLaunches;
      } else {
        filteredLaunches =
            allLaunches!
                .where(
                  (launch) =>
                      launch.name?.toLowerCase().contains(query) ?? false,
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppbarWidget(
        text: localizations.home.title,
        fontWeight: FontWeight.w600,
        fonzSize: 28,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
            if (allLaunches == null && state.launchesModel != null) {
              allLaunches = state.launchesModel;
              filteredLaunches = allLaunches;
            }
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SearchWidget(
                  controller: searchController,
                  onChanged: (value) {
                    _searchByName();
                  },
                ),
                _sortLaunch(filteredLaunches),
                _launchList(screenSize, filteredLaunches),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _sortLaunch(List<LaunchesModel>? launchData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextApp(text: "Sort by : "),
          SizedBox(
            width: 80,
            child: DropdownButton<String>(
              value: _selectedSort,
              items: [
                DropdownMenuItem(value: 'date', child: Text('Date')),
                DropdownMenuItem(value: 'name', child: Text('Name')),
              ],
              onChanged: (value) {
                Modular.get<HomeBloc>().add(
                  SortDataLaunches(
                    data: launchData,
                    sortByDate: value == "date",
                  ),
                );
                setState(() {
                  _selectedSort = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _launchList(Size sceenSize, List<LaunchesModel>? launchData) {
    return SizedBox(
      height: sceenSize.height * 0.75,
      child: ListView.builder(
        itemCount: launchData?.length ?? 0,
        itemBuilder: (context, index) {
          return _launchCard(launchData?[index]);
        },
      ),
    );
  }

  Widget _launchCard(LaunchesModel? launchData) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(
          HomePageType.launchDetails.path,
          arguments: launchData,
        );
      },
      onDoubleTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColorsWidget.card,
        ),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  child: Image.network(
                    launchData?.links?.patch?.small ?? "",
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    text: launchData?.name ?? "",
                    fonzSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  TextApp(
                    text: FunctionShared.dataFomat(launchData?.dateUtc),
                    textAlign: TextAlign.start,
                  ),
                  TextApp(
                    text: (launchData?.success == true) ? "Sucess" : "Failures",
                  ),
                  TextApp(
                    text:
                        (launchData?.upcoming == true)
                            ? "Upcomming"
                            : "Launched",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
