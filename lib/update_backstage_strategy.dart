import 'package:gildedrose_kata/model/item.dart';
import 'package:gildedrose_kata/update_item_strategy.dart';

class UpdateBackstageStrategy extends UpdateItemStrategy {
  @override
  void update(Item item) {
    item.sellIn = decreaseSellIn(item.sellIn);
    item.quality = increaseQuality(item.quality);
    if (closeToExpire(item.sellIn)) {
      item.quality = increaseQuality(item.quality);
    }

    if (tooCloseToExpire(item.sellIn)) {
      item.quality = increaseQuality(item.quality);
    }
    if (!hasSellIn(item.sellIn)) return;
    item.quality = minQuality;
    item.quality = decreaseQuality(item.quality);
  }

  static String itemName = "Backstage passes to a TAFKAL80ETC concert";
}
