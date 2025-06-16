import 'dart:convert';
import 'package:furniture_app/features/home/model/home_model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _favKey = 'fav_items';
   final SharedPreferences _prefs;

   LocalStorageService(this._prefs);


  Future<void> saveFavorites(List<ProductModel> products) async {
    final encoded = jsonEncode(products.map((p) => p.toJson()).toList());
    await _prefs.setString(_favKey, encoded);
  }

  Future<List<ProductModel>> loadFavorites() async {
    final data = _prefs.getString(_favKey);
    if (data == null) return [];
    final decoded = jsonDecode(data) as List;
    return decoded.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<void> clearFavorites() async {
    await _prefs.remove(_favKey);
  }

}