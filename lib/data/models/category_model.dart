import 'package:mind_horizon/data/models/category_fields_model.dart';

class CategoryModel {
  final String title;
  final List<CategoryFields> categoryFields;

  CategoryModel({required this.title, required this.categoryFields});
}
