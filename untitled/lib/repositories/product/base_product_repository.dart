import 'package:untitled/model/model.dart';
abstract class BaseProductRepository{
  Stream<List<Productt>> getAllProducts();
}