import 'dart:ffi';
import 'dart:io';
import 'dart:math';

List<List<String>> input = [
  ["D", "L", "V", "T", "M", "H", "F"],
  ["H", "Q", "G", "J", "C", "T", "N", "P"],
  ["R", "S", "D", "M", "P", "H"],
  ["L", "B", "V", "F"],
  ["N", "H", "G", "L", "Q"],
  ["W", "B", "D", "G", "R", "M", "P"],
  ["G", "M", "N", "R", "C", "H", "L", "Q"],
  ["C", "L", "W"],
  ["R", "D", "L", "Q", "J", "Z", "M", "T"]
];

void main() {

  File file = new File('./input');
  List<List<int>> moves = fileToArray(file);

  moves.forEach(((element) {
    for(int i=0; i < element[0]; i++) {
      int from = element[1] -1;
      int to = element[2]-1;
      input[to].add(input[from].last);
      input[from].removeLast();
    }
  }));

  print(input);

}


List<List<int>> fileToArray(file) {
  List<List<int>> moves = [];

  List<String> lines = file.readAsLinesSync();

  lines.forEach((element) {
    List<String> rows = element.multiSplit(['move ', ' from ', ' to ']);
    rows.removeAt(0);
    List<int> movements = rows.map(int.parse).toList();
    moves.add(movements);
  });

  return moves;
}


extension UtilExtensions on String {
  List<String> multiSplit(Iterable<String> delimeters) => delimeters.isEmpty
      ? [this]
      : this.split(RegExp(delimeters.map(RegExp.escape).join('|')));
}