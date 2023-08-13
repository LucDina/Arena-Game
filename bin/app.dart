import 'models/arena.dart';

void main(List<String> args) {
  // Initialisation de l'arène
  Arena arena = Arena();
  // on dispose les joueurs d'ont deux seront choisis ainsi des armes
  Scene scene = Scene.manage(players: Arena.players, armo: Arena.armes_);
  arena.useScene(scene);
}
