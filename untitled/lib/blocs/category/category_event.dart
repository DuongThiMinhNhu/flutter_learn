part of 'category_bloc.dart';
class CategoryEvent extends Equatable {
  const CategoryEvent();
  @override
  List<Object?> get props => [];
}

class LoadCategories extends CategoryEvent {}

class UpdateCategories extends CategoryEvent {
  final List<Categorys> categories;
  UpdateCategories({required this.categories});
  @override
  List<Object?> get props => [categories];
}
