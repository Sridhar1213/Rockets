import 'package:get/get.dart';

import '../models/home_model.dart';
import '../services/home_services.dart';

class HomeController extends GetxController {

  List rocketsList = <HomeModel>[];
  HomeModel? rocket;

  getRockets()async{
    var rocket_List = await HomeServices().getRocketsList();
    rocketsList = rocket_List;
    update();
  }

  updateRocket(rocketData){
    rocket = rocketData;
    update();
  }

}