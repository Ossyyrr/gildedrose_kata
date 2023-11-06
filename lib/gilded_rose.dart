import 'package:gildedrose_kata/model/item.dart';

class GildedRose {
  List<Item> items;

  GildedRose(this.items);

  int minQuality = 0;
  int maxQuality = 50;
  int baseQualityChange = 1;
  void updateQuality() {
    for (var item in items) {
      if (isAgedBrie(item.name) || isBackstage(item.name)) {
        if (qualityLessLimit(item.quality)) {
          item.quality = increaseQuality(item.quality);

          if (isBackstage(item.name)) {
            if (closeToExpire(item.sellIn)) {
              if (qualityLessLimit(item.quality)) {
                item.quality = increaseQuality(item.quality);
              }
            }

            if (tooCloseToExpire(item.sellIn)) {
              if (qualityLessLimit(item.quality)) {
                item.quality = increaseQuality(item.quality);
              }
            }
          }
        }
      } else {
        if (hasQuality(item.quality)) {
          if (!isSulfuras(item.name)) {
            item.quality = decreaseQuality(item.quality); //reasignar
          }
        }
      }

      if (!isSulfuras(item.name)) {
        item.sellIn = decreaseSellIn(item.sellIn);
      }

      if (hasSellIn(item.sellIn)) {
        if (!isAgedBrie(item.name)) {
          if (!isBackstage(item.name)) {
            if (hasQuality(item.quality)) {
              if (!isSulfuras(item.name)) {
                item.quality = decreaseQuality(item.quality);
              }
            }
          } else {
            item.quality = minQuality;
          }
        } else {
          if (qualityLessLimit(item.quality)) {
            item.quality = increaseQuality(item.quality);
          }
        }
      }
    }
  }

  bool hasSellIn(int sellIn) => sellIn < 0;
  bool tooCloseToExpire(int sellIn) => sellIn <= 5;
  bool closeToExpire(int sellIn) => sellIn <= 10;
  int decreaseSellIn(int sellIn) => sellIn - 1;

  bool qualityLessLimit(int quality) => quality < maxQuality;
  int decreaseQuality(int quality) => quality - baseQualityChange;
  int increaseQuality(int quality) => quality + baseQualityChange;
  bool hasQuality(int quality) => quality > minQuality;

  bool isSulfuras(String name) => name == "Sulfuras, Hand of Ragnaros";
  bool isBackstage(String name) =>
      name == "Backstage passes to a TAFKAL80ETC concert";
  bool isAgedBrie(String name) => name == "Aged Brie";
}
