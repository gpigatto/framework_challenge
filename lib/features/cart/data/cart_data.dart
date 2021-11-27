import 'package:framework_challenge/features/cart/domain/repository/cart_interface.dart';
import 'package:framework_challenge/features/cart/presentation/bloc/cart_cubit.dart';

class CartData extends CartInterface {
  @override
  Future<List<CartObject>> call(List<CartObject> list, CartObject item) async {
    return [];
  }
}
