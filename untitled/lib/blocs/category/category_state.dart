part of 'category_bloc.dart';
abstract class CategoryState extends Equatable{
  const CategoryState();
  @override
  List<Object> get props => [];
}
class CategoryLoading extends CategoryState{}
class CategoryLoaded extends CategoryState{
  final List<Categorys> categories;
  CategoryLoaded({this.categories = const <Categorys>[]});
  @override
  List<Object> get props => [categories];
}