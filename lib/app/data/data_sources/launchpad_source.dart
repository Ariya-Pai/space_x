import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:space_x/app/data/model/lauchpad.dart';
import 'package:space_x/app/data/model/launches_model.dart';
import 'package:space_x/app/data/model/rocket_Model.dart';
import 'package:space_x/core/remote/http_reqest.dart';

class LaunchpadSource {
  final HttpRequest httpRequest;
  LaunchpadSource(this.httpRequest);
  Future<List<LaunchPadModel>> getAllLaunchPads() async {
    Response response = await httpRequest.get('/launchpads');
    return launchPadModelListFromJson(response.data);
  }

  Future<List<LaunchesModel>> getAllLaunches() async {
    Response response = await httpRequest.get('/launches');

    return launchesModelListFromJson(response.data);
  }

  Future<RocketModel> getRocketDetail({String? id}) async {
    Response response = await httpRequest.get('/rockets/$id');

    return RocketModel.fromJson(response.data);
  }

  Future<LaunchPadModel> getOneLaunchPad({String? id}) async {
    Response response = await httpRequest.get('/launchpads/$id');

    return LaunchPadModel.fromJson(response.data);
  }

  Future<List<LaunchesModel>> sortLaunches(
    List<LaunchesModel>? launches, {
    bool sortByDate = true,
  }) async {
    launches?.sort((a, b) {
      if (sortByDate) {
        // เรียงตามวันที่ก่อน
        int dateCompare = 0;
        if (a.dateUtc != null && b.dateUtc != null) {
          dateCompare = a.dateUtc!.compareTo(b.dateUtc!);
        } else if (a.dateUtc == null && b.dateUtc != null) {
          dateCompare = 1;
        } else if (a.dateUtc != null && b.dateUtc == null) {
          dateCompare = -1;
        }
        if (dateCompare != 0) return dateCompare;
      }
      // ถ้า sortByDate = false หรือวันที่เท่ากัน จะเรียงตามชื่อ
      final aName = a.name ?? '';
      final bName = b.name ?? '';
      return aName.toLowerCase().compareTo(bName.toLowerCase());
    });
    return launches ?? [];
  }
}
