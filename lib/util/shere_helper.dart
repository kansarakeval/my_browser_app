import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper
{
  Future<void> setBookMark(List<String> bookMarkData)
  async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setStringList("Url", bookMarkData);
  }
  Future<List<String>?> getBookMarkData()
  async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return  shr.getStringList('Url');
  }
}