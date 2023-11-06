import 'package:gildedrose_kata/model/item.dart';
import 'package:gildedrose_kata/update_item_strategy.dart';

class UpdateConjureStrategy extends UpdateItemStrategy {
  @override
  void update(Item item) {
    item.sellIn = decreaseSellIn(item.sellIn);
    item.quality = decreaseQuality(item.quality);
    item.quality = decreaseQuality(item.quality);
    if (!hasSellIn(item.sellIn)) return;
    item.quality = decreaseQuality(item.quality);
  }

  static String itemName = "Conjured";
}
