import 'dart:io';
import 'dart:math';
// ignore: avoid_relative_lib_imports
import '../lib/utils.dart';


class Arena {
  static List players = personnes;
  static List armes_ = armes;

  Arena();

  useScene(Scene scene) {
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

  // Maintenir la probabilité d'acceptation au plus bas soit 1/4 et 1/2
  /**
  * Cette methode défine si un joueur doit bénéficier d'une grâce ou d'un boost ou nom
  **/
  static destin() =>
      
      (Random().nextBool() && Random().nextBool()) && Random().nextBool();
}

class Scene {
  List players;
  List armo;
  Scene.manage({required this.players, required this.armo});

  playerHystory() {
    for (int i = 0; i < players.length; i++) {
      print("""Joueur ${i + 1}
        ${players[i]["description"]}
      """);
      sleep(Duration(seconds: 15));
    }
  }

  List playerchoice(int player1, int player2) {
    
    return [players[player1]['personne'] , players[player2]['personne']];
  }

  start() {
    List duelPlayer = playerchoice(3, 2);

    print("Figth ⚔");
    print("${duelPlayer[0]}\n${duelPlayer[1]}");
    if (duelPlayer.length == 2) {
      
      // first move through through random decision
      Random(2).nextBool()
          ? duelPlayer[0].attack(duelPlayer[1])
          : duelPlayer[1].attack(duelPlayer[0]);

      // role attack
      int conteur = 0;
      while (duelPlayer[0].isNotDead() && duelPlayer[1].isNotDead()) {

        if(conteur%5 == 0) print("${duelPlayer[0]}\n${duelPlayer[1]}");

        sleep(Duration(seconds: 1));
        duelPlayer[0].attack(duelPlayer[1]);
        sleep(Duration(seconds: 1));
        if (duelPlayer[1].isNotDead()) {
          duelPlayer[1].attack(duelPlayer[0]);
        }
        conteur++;
      }
    }
    print("${duelPlayer[0]}\n${duelPlayer[1]}");
    return;
  }
}
