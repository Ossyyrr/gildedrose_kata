import 'package:gildedrose_kata/core/interface/update_item_strategy.dart';
import 'package:gildedrose_kata/core/model/item.dart';

class UpdateQualityUseCase {
  UpdateQualityUseCase(this.updateItemStrategy);
  UpdateItemStrategy updateItemStrategy;

  void execute(Item item) => updateItemStrategy.update(item);
}
