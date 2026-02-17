import 'dart:io';

import 'package:ansicolor/ansicolor.dart';

void afficherGrille(int LargeurGrille, int hauteurGrille, List<int> grille) {
  stdout.writeln("c/l   a   b   c   d   e   f   g   h");
  stdout.writeln("    ---------------------------------");
  var numCol = 1;
  for (var i = 0; i < grille.length; i++) {
    if (i % LargeurGrille == 0) {
      stdout.write("$numCol   ");
      numCol += 1;
    }
    stdout.write("| X ");
    if (i % LargeurGrille == LargeurGrille - 1) {
      stdout.write("|\n    ---------------------------------\n");
    }
  }
}

void main(List<String> arguments) {
  var execution = true;
  String? choixUtilisateur;
  int largeurGrille = 8;
  int hauteurGrille = 8;
  int tailleGrille = largeurGrille * hauteurGrille;

  final penVert = AnsiPen()..green();

  var grille = List<int>.generate(tailleGrille, (i) => 0);
  while (execution) {
    //TODO nettoyer l'ecran
    stdout.write('\x1B[2J\x1B[0;0H');
    print("-=-=-=-=-=-=-=-=-=");
    print("-    DEMINEUR    -");
    print("-=-=-=-=-=-=-=-=-=");
    //TODO afficher le dernier coup joué ou un message d'erreur ou le message de Game Over
    if (choixUtilisateur != null) {
      print("dernier coup: ${penVert(choixUtilisateur)}");
    }
    //TODO afficher la grille
    afficherGrille(largeurGrille, hauteurGrille, grille);
    //TODO informer l'utilisateur il peut jouer
    stdout.write(penVert("Saisissez votre coup (cl) ou q pour quitter: "));
    choixUtilisateur = stdin.readLineSync();
    choixUtilisateur = choixUtilisateur?.toLowerCase();
    execution = choixUtilisateur != "q";
    //TODO choix de l'utilidateur est un coup valide.
  }
}
