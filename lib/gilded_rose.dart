import 'package:gildedrose_kata/core/interface/update_item_strategy.dart';
import 'package:gildedrose_kata/core/model/item.dart';
import 'package:gildedrose_kata/core/use_case/update_quality_use_case.dart';
import 'package:gildedrose_kata/data/strategy/update_aged_brie_strategy.dart';
import 'package:gildedrose_kata/data/strategy/update_backstage_strategy.dart';
import 'package:gildedrose_kata/data/strategy/update_conjure_strategy.dart';
import 'package:gildedrose_kata/data/strategy/update_default_strategy.dart';
import 'package:gildedrose_kata/data/strategy/update_sulfuras_strategy.dart';

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
      UpdateQualityUseCase(
              _updateItemStrategies[item.name] ?? UpdateDefaultStrategy())
          .execute(item);
    }
  }
}
