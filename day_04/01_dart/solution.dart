import 'dart:ffi';
import 'dart:io';
import 'dart:math';

String alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

void main() {

  File file = new File('./input');
  int res = fileToArray(file);
  print(res);
}

int fileToArray(file) {
  int counter = 0;


  List<String> lines = file.readAsLinesSync();

  lines.forEach((element) {
    List<String> rows = element.multiSplit(['-', ',']);
    if ((int.parse(rows[0]) >= int.parse(rows[2]) && int.parse(rows[1]) <= int.parse(rows[3])) || (int.parse(rows[2]) >= int.parse(rows[0]) && int.parse(rows[3]) <= int.parse(rows[1]))) {
      counter++;
    } 
  });

  return counter;
}


extension UtilExtensions on String {
  List<String> multiSplit(Iterable<String> delimeters) => delimeters.isEmpty
      ? [this]
      : this.split(RegExp(delimeters.map(RegExp.escape).join('|')));
}