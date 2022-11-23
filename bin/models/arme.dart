// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';
import 'dart:math';

import 'package:test/scaffolding.dart';

import 'arena.dart';

/// Les `Armes` sont des outils ou engein de guerre
class Arme {
  num? degat;
  String? name;
  String? tag;

  Arme({this.name = "Bâton", this.tag = "⚔", this.degat = 0}) {
    if (degat == 0) {
      degat = [1, 1.4, 1.6, 2][Random().nextInt(4)];
    }
  }

  Arme.oneOfThem({Map<String, num>? map, this.tag = "⚔"}) {
    int number = Random().nextInt(map!.length);
    name = map.keys.toList()[number];
    degat = map.values.toList()[number];
  }

  // refactoring function
  num use() {
    return degat!;
  }

  bool unUseFull() => false;

  void newMinution() {}

  @override
  String toString() {
    return """${super.toString()}
      Name : $name
      Dégat : $degat
      Tag : $tag""";
  }
}

// Les armes extenssible comme le pistolet ou un Arc à flêche
class ExtenssibleArme extends Arme {
  int minution;
  int pack;

  final int initMinution;
  final bool rafallMode;
  final int ininialPack;

  int restMinution = 0;
  ExtenssibleArme(
      {num degat_ = 1.5,
      String tag = "⚔",
      this.minution = 10,
      this.pack = 2,
      this.rafallMode = false,
      String name_ = "Arme extenssible"})
      : ininialPack = pack,
        initMinution = minution,
        super(name: name_, degat: degat_, tag: tag) {
    if (rafallMode) {
      name!.replaceAll(RegExp(r"extenssible"), "Mitrailleuse");
      restMinution = pack * initMinution;
    }
  }

  ExtenssibleArme.oneOfThem(Map<String, num> map,
      {String tag = "⚔",
      int minution_ = 10,
      this.pack = 2,
      bool raffalMode = false})
      : ininialPack = pack,
        minution = minution_,
        rafallMode = raffalMode,
        initMinution = minution_,
        super.oneOfThem(map: map, tag: tag) {
    if (rafallMode) {
      name!.replaceAll(RegExp(r"extenssible"), "Mitrailleuse");
      restMinution = pack * initMinution;
    }
  }

  @override
  num use() {
    if (rafallMode) {
      int minutionT = 0;

      if (pack >= 1) {
        minutionT = Random().nextInt(pack * initMinution);
        // print("Munition $minutionT");
        sleep(Duration(seconds: 1));
      } else {
        minutionT = Random().nextInt(minution);
        if (minution == 1 || minutionT == 0) minutionT = 1;
        // print("Munition $minutionT 0 pack  !!!!!!!!!!!!!!!");
        // sleep(Duration(seconds: 1));
      }

      restMinution = restMinution - minutionT;

      pack = (restMinution / initMinution).floor();
      minution = restMinution - (initMinution * pack);

      restMinution = (pack * initMinution) + minution;
      return minutionT;
    } else {
      if (minution == 0) {
        newMinution();
        return 0; // il à été rechargé donc il n'attaque pas
      }
      int munitionRechergeMode = Random().nextInt(minution);
      if (minution == 1 || munitionRechergeMode == 0) munitionRechergeMode = 1;

      minution -= munitionRechergeMode;
      // if pack is full
      if (pack == ininialPack) pack--;
      return munitionRechergeMode;
    }
  }

  // refactoring function
  @override
  bool unUseFull() {
    return minution == 0 && pack == 0;
  }

  @override
  void newMinution() {
    // if pack is over or equal than 1
    if (pack >= 1) {
      pack--;
      minution = initMinution;
    }
  }

  @override
  String toString() {
    return """${super.toString()};
      Minution :$minution
      Pack de Minution: $pack
    """;
  }
}
