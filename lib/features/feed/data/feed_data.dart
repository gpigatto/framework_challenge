import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:framework_challenge/features/feed/domain/repository/feed_interface.dart';
import 'package:framework_challenge/features/feed/model/feed_model.dart';

class FeedData extends FeedInterface {
  @override
  Future<FeedModel> call() async {
    var jsonString = await rootBundle.loadString("resources/json/feed.json");

    Map<String, dynamic> json = jsonDecode(jsonString);

    return FeedModel.fromJson(json);
  }
}
