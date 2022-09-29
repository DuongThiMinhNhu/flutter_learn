import 'package:untitled/model/model.dart';
abstract class BaseCheckoutRepository{
  Future<void> addCheckout(CheckOut checkout);
}