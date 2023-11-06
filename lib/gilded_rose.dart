import 'package:gildedrose_kata/model/item.dart';
import 'package:gildedrose_kata/model/update_conjure_strategy.dart';
import 'package:gildedrose_kata/update_aged_brie_strategy.dart';
import 'package:gildedrose_kata/update_backstage_strategy.dart';
import 'package:gildedrose_kata/update_default_strategy.dart';
import 'package:gildedrose_kata/update_item_strategy.dart';
import 'package:gildedrose_kata/update_sulfuras_strategy.dart';

class GildedRose {
  List<Item> items;

  GildedRose(this.items);

  final Map<String, UpdateItemStrategy> _updateItemStrategies = {
    UpdateSulfurasStrategy.itemName: UpdateSulfurasStrategy(),
    UpdateAgedBrieStrategy.itemName: UpdateAgedBrieStrategy(),
    UpdateBackstageStrategy.itemName: UpdateBackstageStrategy(),
    UpdateConjureStrategy.itemName: UpdateConjureStrategy(),
  };

  void updateQuality() {
    for (var item in items) {
      (_updateItemStrategies[item.name] ?? UpdateDefaultStrategy())
          .update(item);
    }
  }
}
