import 'dart:ffi';
import 'dart:io';
import 'dart:math';


Map results = { 
  // equality
  "AX": [4, 4],
  "BY": [5, 5],
  "CZ": [6, 6],
  // A
  "AY": [1, 8],
  "AZ": [7, 3],
  // B
  "BX": [8, 1],
  "BZ": [2, 9],
  // C
  "CX": [3, 7],
  "CY": [9, 2],
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