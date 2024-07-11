// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:math';

import '../lib/utils.dart';
import 'arena.dart';
import 'arme.dart';
import 'personne.dart';

/// Les `Guerrier` ont toujours une arme de base sur eux
class Guerrier extends Personne {
  Arme armePortable = Arme(degat: 2, name: "Dague", tag: "🗡");
  Arme? arme;
  String comboName;

  Guerrier(super.name_, {this.arme, this.comboName = "Coup percent"});

  @override

  /// Les guerriers peuvent très rappidement attaquer à coup
  /// de poing et d'arme simple ou spécial
  ///
  /// le guerrier a une arme par défaut pour attaquer
  ///
  /// [Implémentation] `code ...`

  void attack(Personne personne) {
    // [Description]
    // Il attaque avec son arme spéciale lorque:
    //    - Il en possède
    //    - Il en à la possibilité au moment ou sa vie baisse à 40
    //
    //    - cependent il peut l'utiliser aussi l'orsque le destin endécide

    bool useArmeSpecial =
        (arme != null) && (inPurcent(health, 100) <= 40 && Random().nextBool());

    if (useArmeSpecial || Arena.destin()) {
      // si l'arme qu'il poccède est une arme avec des minutions
      //    qui sont fini alors il s'en débarrasse
      //    il n'attaque pas (il perd son tour)

      Arena.messagerSpeak("✨✨✨ Combo spécial de $arme");
      if ((arme.runtimeType == ExtenssibleArme().runtimeType) &&
          arme!.unUseFull() && arme != null) {
        arme == null;
        Arena.messagerSpeak("😥 $name jête son arme");
        return;
      }
      double degatValue = arme!.use().toDouble();
      personne.getDamage(degatValue);
      Arena.messagerSpeak("${arme!.tag} $comboName sur ${personne.name} | degat $degatValue");
    } else {
      if (Random().nextBool()) {
        // enchainer jusqu'a 02 coup d'arme portable
        for (int i = 0; i < Random().nextInt(2); i++) {
          personne.getDamage(armePortable.use().toDouble());
          Arena.messagerSpeak(
              " ${armePortable.tag} $name porte un coup de ${armePortable.name} sur ${personne.name}");
        }
      } else
        super.attack(personne);
    }
  }

  @override
  String toString() {
    return """
          ------- STATUS -------

          Name : $name
          Arme : ${arme != null ? "${arme!.name} ${arme!.tag}" : "Na pas d'arme "}
          Combo Spécial : $comboName
          Health : ${health.toStringAsFixed(2)}
          Lost : ${!isNotDead()}
    """;
  }
}
