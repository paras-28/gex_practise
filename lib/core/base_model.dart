import 'package:get/get.dart';

class BaseModel {
  late RxBool showLoader;

  late Rx<String> errorMessage;

  BaseModel({required this.showLoader, required this.errorMessage});

  set isProgress(bool val) {
    showLoader(val);
  }

  bool get isProgress => showLoader.value;

  set onError(String err) {
    errorMessage(err);
  }

  String get onError => errorMessage.value;
}
