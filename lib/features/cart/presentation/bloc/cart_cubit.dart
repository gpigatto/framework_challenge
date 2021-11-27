import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework_challenge/features/cart/domain/commands/cart_command.dart';

class CartObject {
  int id;
  String name;
  String imagePath;
  int quantity;
  double value;
  double total;

  CartObject({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.quantity,
    required this.value,
    required this.total,
  });
}

class CartCubit extends Cubit<List<CartObject>> {
  final CartCommand cmd;

  CartCubit(this.cmd) : super([]);

  void onListChange(List<CartObject> list, CartObject item) async {
    var r = await cmd.call(CartParams(list: list, item: item));

    emit([]);
    emit(r);
  }
}
