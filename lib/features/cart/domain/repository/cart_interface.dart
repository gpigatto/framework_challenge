import 'package:framework_challenge/features/cart/presentation/bloc/cart_cubit.dart';

abstract class CartInterface {
  Future<List<CartObject>> call(List<CartObject> list, CartObject item);
}
