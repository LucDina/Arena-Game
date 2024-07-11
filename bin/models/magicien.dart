// ignore_for_file: curly_braces_in_flow_control_structures, avoid_relative_lib_imports

import 'dart:io';
import 'dart:math';

import '../lib/utils.dart';
import 'arena.dart';
import 'personne.dart';

class Magicien extends Personne {
  int mana;
  String comboName;
  String tag;
  Magicien({String? name, this.comboName = "sort", this.tag = "🌟"})
      : mana = 50,
        super(name!);

  @override
  void attack(Personne personne) {
    if ((inPurcent(mana, 50) >= 12 && mana >= 0) && Random().nextBool()) {
      final bouleDeMana = (mana.toString().length == 1)
          ? Random().nextInt(12) + 1
          : Random().nextInt(mana);
      mana -= bouleDeMana;

      // inflige un dégat considérable de mana
      Arena.messagerSpeak(
          "$tag $name viens d'utiliser $comboName | degat : $bouleDeMana sur ${personne.name}");
      personne.getDamage(bouleDeMana.toDouble());
    } else {
      if (Random().nextBool()) {
        super.attack(personne);
      } else {
        final manaCharge = Random().nextInt(4) + 1;
        final healthCharge = Random().nextInt(4) + 1;

        // Augmentation du nombre de mana et augmentation du nombre de vie
        // La charge du mana fournie 1/5 du niveau de vie soit 20%
        mana += manaCharge;
        health +=  healthCharge;

        Arena.messagerSpeak("🌀🌠Charge de mana ---> $manaCharge");
        Arena.messagerSpeak(
            "🍖🥩 Augmentation du niveau de vie de $healthCharge");
        sleep(Duration(seconds: manaCharge));
        if (mana < 0) mana = 0;
      }
    }
  }

  @override
  String toString() {
    return """
          ------- STATUS -------

          Name : $name
          Mana : $mana
          Combo Spécial : $comboName
          Health : ${health.toStringAsFixed(2)}
          Lost : ${!isNotDead()}
    """;
  }
}
