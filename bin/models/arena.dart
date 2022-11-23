import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'arme.dart';
import 'guerrier.dart';
import 'magicien.dart';
import 'personne.dart';

List personnes = [
  {
    "personne": Personne("Alex"),
    "type": "villageois",
    "description":
        """Alex est un simple villageois qui malgré ses faibles compétences 
      à décider d'entrer dans le monde des combats pour se faire des 
      revenu et subvenir aux besoins de ces frères

      Bote secrette : aucune
      style : combat  main nue,
    """,
  },
  {
    "personne": Guerrier("Lord Alfonce III",
        arme: Arme(name: "Escalibur Enflamé", tag: "🗡🔥", degat: 5)),
    "type": "Guerrier",
    "description":
        """Lord Alfonce III à ramporté plusieurs quêtes et à joué un rôle stratégique
      dans la gestion des armés de sa Nation c'est ainsi qu'il fût le 03eme
      gouverneur ayant ramporté la 04 eme guèrre munie de sont Epé enflamé 🔥

      style: Epéiste,
      Bote secrette : Coup percent
    """
  },
  {
    "personne": Guerrier("Racky Rock",
        comboName: "Criit Viens A Moi",
        arme: Arme(name: "Hache de Criit", degat: 7.5, tag: "🪓")),
    "type": "Guerrier",
    "description":
        """Cet Homme est un meutrier jugé trop violant il fut chassé de sa
      confrèrerie menan une vie solitaire avec des comportements toujours déplaisant.
      Il se comporte ainsi sans doute à cause de sa hache qui le rend de plus en plus fort et qui
      l'oblige à faire un mauvais jugement.
    
      style : Barbare,
      Bote secrette : Criit Viens A Moi
    """,
  },
  {
    "personne": Guerrier("Nickita Ma",
        comboName: "Cries de détresse",
        arme: ExtenssibleArme(
            degat_: 0.5, name_: "Ma Arc", tag: "🏹🎡", minution: 20, pack: 3)),
    "type": "Guerrier",
    "description":
        """Nickita Ma se rend populaire en éliminant un groupe de zombie en
      une bote de technique secrete.

      style : Archer
      Bote secrette : Cries de détresse
    """
  },
  {
    "personne": Guerrier("Dr Wallan",
        comboName: "Brizes déferlante",
        arme: ExtenssibleArme(
            degat_: 0.4,
            rafallMode: true,
            name_: "Mitrailleuse M5",
            tag: "✨🔫",
            pack: 7)),
    "type": "Guerrier",
    "description":
        """Dr Wallan est un savant Fou!! il confectionne ses propes armes et l'utilise.
      IL à été arêté plusieur fois pour ses expériences dangereuse mais relaché pour
      le bien de la science.
      Sa proueste technologique est la toute prmière mitailleuse au monde M45.

      style : Militaire
      Bote secrette : Brizes déferlante
    """
  },
  {
    "personne": Magicien(
        name: "Dania Lan", comboName: "Absorption céleste", tag: "💧🌀"),
    "type": "Magicien",
    "description":
        """Dania Lan est percu comme un oiseau de mauvait augure. Elle co-habite avec l'ame des défuns et 
      les nourris d'âmes des vivants.

      style : Marge
      Bote secrette : Absorption céleste
    """
  },
  {
    "personne": Magicien(
        name: "Fils de Dan", comboName: "Mascarade d'Eclair Bleu", tag: "⚡🌠"),
    "type": "Magicien",
    "description": """pas de description

      style : Marge
      Bote secrette : Feu céleste
    """
  },
];

List armes = [
  Arme(degat: 0.5),
  Arme(name: "Bâton solid", degat: 0.6),
  Arme(name: "Clef a moullette", tag: "🪒", degat: 0.5),
  ExtenssibleArme(name_: "couteau cible", minution: 3, degat_: 5),
];

class Arena {
  static List players = personnes;
  static List armes_ = armes;

  Arena();

  useScene(Scene scene) {
    // use scene function
    // scene.playerHystory();
    scene.start();
  }

  void manageScene(List players, List armor) {}

  // PUBLIC FUNCTION

  /// Fornie des `informations` détaillées sur ce qui se passe sur `l'Arène`
  static messagerSpeak(String message) {
    print(message);
    sleep(Duration(seconds: 4));
  }

  static destin() =>
      (Random().nextBool() && Random().nextBool()) && Random().nextBool();
}

class Scene {
  List player;
  List armo;
  Scene.manage({required this.player, required this.armo});

  playerHystory() {
    for (int i = 0; i < player.length; i++) {
      print("""Joueur ${i + 1}
        ${player[i]["description"]}
      """);
      sleep(Duration(seconds: 10));
    }
  }

  List playerchoice(int player1, int player2) {
    List dualPlayer = [];

    for (var i = 0; i < player.length; i++) {
      if (i == player1 || i == player2) dualPlayer.add(player[i]['personne']);
    }

    return dualPlayer;
  }

  start() {
    List duelPlayer = playerchoice(3, 2);

    print("Figt ⚔");
    print("${duelPlayer[0]}\n${duelPlayer[1]}");
    if (duelPlayer.length >= 2) {
      Random(2).nextBool()
          ? duelPlayer[0].attack(duelPlayer[1])
          : duelPlayer[1].attack(duelPlayer[0]);

      // role attack
      int conteur = 0;
      while (duelPlayer[0].isNotDeath() && duelPlayer[1].isNotDeath()) {

        if(conteur%5 == 0) print("${duelPlayer[0]}\n${duelPlayer[1]}");

        sleep(Duration(seconds: 1));
        duelPlayer[0].attack(duelPlayer[1]);
        sleep(Duration(seconds: 1));
        if (duelPlayer[1].isNotDeath()) {
          duelPlayer[1].attack(duelPlayer[0]);
        }
        conteur++;
      }
    }
    print("${duelPlayer[0]}\n${duelPlayer[1]}");
    return;
  }
}
