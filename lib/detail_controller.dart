import 'package:get/get.dart';

class DetailController extends GetxController {
  var fav = 0.obs;

  void favCounter(){
    if(fav.value == 1){
      Get.snackbar("Loved it", "You Already Loved it");
    }else{
      fav.value++;
      Get.snackbar("Loved it", "You Just Loved it");

    }
  }
}