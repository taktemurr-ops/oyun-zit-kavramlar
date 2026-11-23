import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_zit_kavramlar/oyun_zit_kavramlar.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(zitKavramlarConfig.title.length, 33);
    expect(zitKavramlarConfig.tagline.length, 33);
    for (final s in zitKavramlarConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(zitKavramlarConfig.gameId, zitKavramlarId);
    expect(zitKavramlarRules.gameId, zitKavramlarId);
    expect(zitKavramlarConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(zitKavramlarRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: zitKavramlarId, optionalMechanics: zitKavramlarRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(zitKavramlarRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
