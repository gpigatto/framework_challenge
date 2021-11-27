import 'package:framework_challenge/core/commands/command.dart';
import 'package:framework_challenge/features/feed/domain/repository/feed_interface.dart';
import 'package:framework_challenge/features/feed/model/feed_model.dart';

class FeedCommand extends Command<FeedModel, void> {
  final FeedInterface repo;

  FeedCommand(this.repo);

  @override
  Future<FeedModel> call(Null) async {
    try {
      var result = await repo();

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
