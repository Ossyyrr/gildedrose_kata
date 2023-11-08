import 'dart:math';

import 'package:gildedrose_kata/core/model/item.dart';
import 'package:gildedrose_kata/gilded_rose.dart';
import 'package:test/test.dart';

void main() {
  test('All articles has a sellIn and Quality', () {
    Item item = Item('foo', 0, 1);
    expect(item.sellIn, 0);
    expect(item.quality, 1);
  });

  test('Should decrease Quiality when positive', () {
    var randomSellIn = 5;
    var randomQuality = 30;

    Item item = Item('foo', randomSellIn, randomQuality);

    GildedRose([item]).updateQuality();

    expect(item.sellIn, randomSellIn - 1);
    expect(item.quality, randomQuality - 1);
  });

  test('Quality should never been negative', () {
    var randomSellIn = 5;
    var randomQuality = 0;

    Item item = Item('foo', randomSellIn, randomQuality);

    GildedRose([item]).updateQuality();

    expect(item.sellIn, randomSellIn - 1);
    expect(item.quality, 0);
  });

  test('should decrease double Quality qhen SellIn is expired (<=0)', () {
    var randomSellIn = 0;
    var randomQuality = 10;

    Item item = Item('foo', randomSellIn, randomQuality);

    GildedRose([item]).updateQuality();
    expect(item.sellIn, randomSellIn - 1);
    expect(item.quality, 8);
  });

  test('should not decrease Quality when quality is 0', () {
    var randomSellIn = Random().nextInt(5);
    var randomQuality = 1;

    Item item = Item('foo', randomSellIn, randomQuality);

    GildedRose([item]).updateQuality();
    expect(item.sellIn, randomSellIn - 1);
    expect(item.quality, 0);
  });

  test(
      'should increase double Quality when Item Name is Aged Brie and SellIn <= 0',
      () {
    var randomSellIn = 0;
    var randomQuality = 1;

    Item item = Item('Aged Brie', randomSellIn, randomQuality);

    GildedRose([item]).updateQuality();
    expect(item.sellIn, randomSellIn - 1);
    expect(item.quality, 3);
  });

  test('should increase Quality when Item Name is Aged Brie', () {
    var randomSellIn = 3;
    var randomQuality = 1;

    Item item = Item('Aged Brie', randomSellIn, randomQuality);

    GildedRose([item]).updateQuality();
    expect(item.sellIn, randomSellIn - 1);
    expect(item.quality, 2);
  });
  test('should not increase Quality when Quality is 50', () {
    var randomSellIn = Random().nextInt(5);
    var randomQuality = 50;

    Item item = Item('Aged Brie', randomSellIn, randomQuality);

    GildedRose([item]).updateQuality();
    expect(item.sellIn, randomSellIn - 1);
    expect(item.quality, 50);
  });

  test(
      'should not increase or decrease Quality and SellIn when Item Name is Sulfuras, Hand of Ragnaros',
      () {
    var randomSellIn = 4;
    var randomQuality = 44;

    Item item = Item('Sulfuras, Hand of Ragnaros', randomSellIn, randomQuality);

    GildedRose([item]).updateQuality();

    expect(item.sellIn, randomSellIn);
    expect(item.quality, 44);
  });

  test(
      'should increase Quality of "Backstage passes to a TAFKAL80ETC concert" in 3 when SellIn is <= 5',
      () {
    var randomSellIn = 4;
    var randomQuality = 44;

    Item item = Item('Backstage passes to a TAFKAL80ETC concert', randomSellIn,
        randomQuality);

    GildedRose([item]).updateQuality();

    expect(item.sellIn, randomSellIn - 1);
    expect(item.quality, 47);
  });
  test(
      'should increase Quality of "Backstage passes to a TAFKAL80ETC concert" in 2 when SellIn is <= 10',
      () {
    var randomSellIn = 7;
    var randomQuality = 44;

    Item item = Item('Backstage passes to a TAFKAL80ETC concert', randomSellIn,
        randomQuality);

    GildedRose([item]).updateQuality();

    expect(item.sellIn, randomSellIn - 1);
    expect(item.quality, 46);
  });

  test(
      'should decrease Quality to 0 of "Backstage passes to a TAFKAL80ETC concert" when SellIn is = 0',
      () {
    var randomSellIn = 0;
    var randomQuality = 44;

    Item item = Item('Backstage passes to a TAFKAL80ETC concert', randomSellIn,
        randomQuality);

    GildedRose([item]).updateQuality();

    expect(item.sellIn, randomSellIn - 1);
    expect(item.quality, 0);
  });

  test('should decrease double Quality for conjured objects', () {
    var randomSellIn = 5;
    var randomQuality = 44;

    Item item = Item('Conjured', randomSellIn, randomQuality);

    GildedRose([item]).updateQuality();

    expect(item.sellIn, randomSellIn - 1);
    expect(item.quality, 42);
  });
}
