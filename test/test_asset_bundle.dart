import 'dart:io';

import 'package:flutter/services.dart';

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    if (key == 'assets/images/klinik_logo.png') {
      return ByteData.sublistView(await File(key).readAsBytes());
    }
    return rootBundle.load(key);
  }
}
