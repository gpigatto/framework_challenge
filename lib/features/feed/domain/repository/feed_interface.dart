import 'package:framework_challenge/features/feed/model/feed_model.dart';

abstract class FeedInterface {
  Future<FeedModel> call();
}
