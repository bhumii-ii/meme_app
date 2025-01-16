import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveMyData
{
  static String memeKey= "MEMEKEY";

  static Future<bool> saveData(int val) async{
    SharedPreferences.setMockInitialValues({});
    final inst = await SharedPreferences.getInstance();
    return await inst.setInt(memeKey, val);
  }

  static Future<int?> getData() async
  {
    final inst= await SharedPreferences.getInstance();
    print(inst.getInt(memeKey));
    return await inst.getInt(memeKey);
  }


}