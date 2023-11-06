import 'package:gildedrose_kata/model/item.dart';

abstract class UpdateItemStrategy {
  void update(Item item);

  int minQuality = 0;
  int maxQuality = 50;
  int baseQualityChange = 1;
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
}
