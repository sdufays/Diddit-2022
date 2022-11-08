import 'package:get/get.dart';
import 'listclassname_item_model.dart';
import 'listclassname_three_item_model.dart';

class UpcomingModel {
  RxList<ListclassnameItemModel> listclassnameItemList =
      RxList.filled(3, ListclassnameItemModel());

  RxList<ListclassnameThreeItemModel> listclassnameThreeItemList =
      RxList.filled(2, ListclassnameThreeItemModel());
}
