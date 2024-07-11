import 'models/arena.dart';

void main(List<String> args) {
  // Initialisation de l'arène
  Arena arena = Arena();
  // Disposition des joueur et des amrmes dans l'Arene
  Scene scene = Scene.manage(players: Arena.players, armo: Arena.armes_);
  arena.useScene(scene);
}
