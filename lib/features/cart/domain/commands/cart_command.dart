import 'package:framework_challenge/core/commands/command.dart';
import 'package:framework_challenge/features/cart/domain/repository/cart_interface.dart';
import 'package:framework_challenge/features/cart/presentation/bloc/cart_cubit.dart';

class CartCommand extends Command<List<CartObject>, CartParams> {
  final CartInterface repo;

  CartCommand(this.repo);

  @override
  Future<List<CartObject>> call(CartParams params) async {
    try {
      var _list = params.list;

      if (params.item.quantity == 0) {
        _list.removeWhere((item) => item.id == params.item.id);
      } else {
        var _index = _list.indexWhere((item) => item.id == params.item.id);

        if (_index >= 0) {
          _list[_index].quantity = params.item.quantity;
          _list[_index].value = params.item.value;
          _list[_index].total = params.item.quantity * params.item.value;
        } else {
          _list.add(params.item);
        }
      }

      return _list;
    } catch (e) {
      rethrow;
    }
  }
}

class CartParams {
  List<CartObject> list;
  CartObject item;

  CartParams({
    required this.list,
    required this.item,
  });
}
