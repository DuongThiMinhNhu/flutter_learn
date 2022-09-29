import 'package:untitled/model/model.dart';
abstract class BaseCategoryRepository{
  Stream<List<Categorys>> getAllCategroies();
}