import 'package:get/get.dart';

import '../api/images_controller.dart';
import '../model/image_class.dart';

class ApiGextController extends GetxController {
  RxList<ImageClass> list = <ImageClass>[].obs;
  RxInt x = 0.obs;
  // List<ImageClass> list = []; //using update and GetBuilder as observer and observable

  getData(context) async {
    list.value = await ImageApiController().getAllStudentImages(context);
  }

  // getData(context) async {
  //   list = await ImageApiController().getAllStudentImages(context);
  // }

  // addToList(c){ // observer useing update
  //   list.add(c);
  //   update();
  // }

addToList(c){ // observer useing update
  list.add(c);
}
}