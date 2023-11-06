import 'package:gildedrose_kata/core/interface/update_item_strategy.dart';
import 'package:gildedrose_kata/core/model/item.dart';

class UpdateDefaultStrategy extends UpdateItemStrategy {
  @override
  void update(Item item) {
    item.sellIn = decreaseSellIn(item.sellIn);
    item.quality = decreaseQuality(item.quality); //reasignar
    if (!hasSellIn(item.sellIn)) return;
    item.quality = decreaseQuality(item.quality);
  }
}
