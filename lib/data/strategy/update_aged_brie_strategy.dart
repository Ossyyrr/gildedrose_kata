import 'package:gildedrose_kata/core/interface/update_item_strategy.dart';
import 'package:gildedrose_kata/core/model/item.dart';

class UpdateAgedBrieStrategy extends UpdateItemStrategy {
  @override
  void update(Item item) {
    item.sellIn = decreaseSellIn(item.sellIn);
    item.quality = increaseQuality(item.quality);
    if (hasSellIn(item.sellIn)) {
      item.quality = increaseQuality(item.quality);
      return;
    }
    if (!hasSellIn(item.sellIn)) return;
    item.quality = decreaseQuality(item.quality);
  }

  static String itemName = "Aged Brie";
}
