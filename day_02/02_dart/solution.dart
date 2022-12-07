import 'dart:ffi';
import 'dart:io';
import 'dart:math';


Map results = { 
  // equality
  "AY": [4, 4],
  "BY": [5, 5],
  "CY": [6, 6],
  // A
  "AZ": [1, 8],
  "AX": [7, 3],
  // B
  "BX": [8, 1],
  "BZ": [2, 9],
  // C
  "CZ": [3, 7],
  "CX": [9, 2],
};



void main() {

  File file = new File('./input');
  List data = fileToArray(file);
  
  var res = data.reduce((value, element) {
    return [
      value[0] + element[0],
      value[1] + element[1],
    ];
  },);

  print(res);
}

List fileToArray(file) {
  List scores = [];

  List<String> lines = file.readAsLinesSync();

  lines.forEach((element) {
    List<String> actual = element.split(' ');
    scores.add(results[actual[0] + actual[1]]);
  });

  return scores;
}