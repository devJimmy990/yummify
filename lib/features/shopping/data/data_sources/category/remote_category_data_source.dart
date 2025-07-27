import 'package:yummify/core/firebase/firebase.dart';
import 'package:yummify/features/shopping/data/data_sources/category/base_category_data_source.dart';

class RemoteCategoryDataSource extends BaseCategoryDataSource {
  RemoteCategoryDataSource(this._firebase);
  final Firebase _firebase;
  @override
  Future<List<Map<String, dynamic>>> getCategories() async {
    try {
      return _firebase.store
          .collection("categories")
          .get()
          .then((value) => value.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      rethrow;
    }
  }
}
