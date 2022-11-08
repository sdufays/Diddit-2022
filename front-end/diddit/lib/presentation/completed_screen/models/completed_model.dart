import 'package:get/get.dart';
import 'completed_item_model.dart';

class CompletedModel {
  RxList<CompletedItemModel> completedItemList =
      RxList.filled(3, CompletedItemModel());
}
