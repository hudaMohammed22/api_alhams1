import 'package:get/get.dart';

import '../api/images_controller.dart';
import '../model/image_class.dart';

class ApiGextController extends GetxController {
  List<ImageClass> list = [];

  getData(context) async {
    list = await ImageApiController().getAllStudentImages(context);
  }

  addToList(c){
    list.add(c);
    update();
  }
}