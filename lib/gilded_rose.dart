import 'package:gildedrose_kata/model/item.dart';

class GildedRose {
  List<Item> items;

  GildedRose(this.items);

  int minQuality = 0;
  int maxQuality = 50;
  int baseQualityChange = 1;

  void updateAgedBrie(Item item) {
    item.sellIn = decreaseSellIn(item.sellIn);
    item.quality = increaseQuality(item.quality);
    if (hasSellIn(item.sellIn)) {
      item.quality = increaseQuality(item.quality);
      return;
    }
    if (!hasSellIn(item.sellIn)) return;
    item.quality = decreaseQuality(item.quality);
  }

  void updateBackstage(Item item) {
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

  void updateDefault(Item item) {
    item.sellIn = decreaseSellIn(item.sellIn);
    item.quality = decreaseQuality(item.quality); //reasignar
    if (!hasSellIn(item.sellIn)) return;
    item.quality = decreaseQuality(item.quality);
  }

  void updateQuality() {
    for (var item in items) {
      if (isSulfuras(item.name)) {
        return;
      } else if (isAgedBrie(item.name)) {
        updateAgedBrie(item);
      } else if (isBackstage(item.name)) {
        updateBackstage(item);
      } else {
        updateDefault(item);
      }
    }
  }

  bool hasSellIn(int sellIn) => sellIn < 0;
  bool tooCloseToExpire(int sellIn) => sellIn <= 5;
  bool closeToExpire(int sellIn) => sellIn <= 10;
  int decreaseSellIn(int sellIn) => sellIn - 1;

  bool qualityLessLimit(int quality) => quality < maxQuality;
  int decreaseQuality(int quality) {
    if (hasQuality(quality)) {
      return quality - baseQualityChange;
    }
    return quality;
  }

  int increaseQuality(int quality) {
    if (qualityLessLimit(quality)) {
      return quality + baseQualityChange;
    }
    return quality;
  }

  bool hasQuality(int quality) => quality > minQuality;

  bool isSulfuras(String name) => name == "Sulfuras, Hand of Ragnaros";
  bool isBackstage(String name) =>
      name == "Backstage passes to a TAFKAL80ETC concert";
  bool isAgedBrie(String name) => name == "Aged Brie";
}
