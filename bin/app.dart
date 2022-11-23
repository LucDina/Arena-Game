import 'dart:io';
import 'dart:math';

import 'models/arena.dart';
import 'models/arme.dart';
import 'models/guerrier.dart';
import 'models/magicien.dart';
import 'models/personne.dart';

void main(List<String> args) {
  Arena arena = Arena();
  // Arena fourni les joueur et les armes
  Scene scene = Scene.manage(player: Arena.players, armo: Arena.armes_);
  arena.useScene(scene);
}
