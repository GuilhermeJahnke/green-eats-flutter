part of 'category_cubit.dart';

class CategoryState extends Equatable {
  const CategoryState({
    this.categories = const [],
  });

  final List<Category> categories;

  @override
  List<Object?> get props => [categories];

  CategoryState copyWith({
    List<Category>? categories,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
    );
  }
}
