import 'models/arena.dart';

void main(List<String> args) {
  // Initialisation de l'arène
  Arena arena = Arena();
  // Disposition des joueurs et des amrmes dans l'Arene
  Scene scene = Scene.dispose(players: Arena.players, armo: Arena.armes_);
  arena.useScene(scene);
}
