// ignore_for_file: avoid_relative_lib_imports

import 'dart:math';
import '../lib/utils.dart';
import 'Arena.dart';

class Personne {
  String name;
  double health = 100;
  double degat = 0.5;
  // [chain] nombre de fois un coup doit être enchainé
  // elle ne dépasse pas [05];
  int chain = 1;

  Personne([String name_ = "Personnes"]) : name = name_;

  void getDamage(double degatExt) {
    health -= degatExt;
  }

  void attack(Personne personne) {
    personne.getDamage(degat);
    print("👊✨ $name viens d'attaquer ${personne.name}");

    // chain passe a 2
    chain++;
    // CRIE DE GUERRE ou pas à partir de 65% de vie
    if (inPurcent(health, 250) < 65 && Random().nextBool()) {
      fury(personne);
    }

    chain = 1;
  }

  //Mode `CRIE DE GUERRE`
  void fury(Personne personne) {
    // chain est à 2 || les coups pourrons être enchainé à 2 ou 3 ou 4 etc... !!

    //les dégats augmente et tous les coups peuvent ne pas être enchainé
    while (Random().nextBool() && (chain >= 2 && chain <= 5)) {
      personne.getDamage((degat + (chain - 1)) / 3);
      Arena.speaker(
          "Mode furyyy.. 🔥 | enchainement * $chain déjà sur ${personne.name}  !!!");
      chain++;
    }
  }

  bool isNotDead() {
    if (health <= 0) {
      health = 0;
      return false;
    }
    return true;
  }

  @override
  String toString() {
    return """
          ------- STATUS -------

          Name : $name (${super.toString()})
          Health : ${health.toStringAsFixed(2)}
          Lost : ${!isNotDead()}
    """;
  }
}
