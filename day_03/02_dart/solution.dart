import 'dart:ffi';
import 'dart:io';
import 'dart:math';

String alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

void main() {

  File file = new File('./input');
  List data = fileToArray(file);
  print(calcScore(data));
}

List fileToArray(file) {
  List result = [];
  List sets = [];
  int counter = 0;


  List<String> lines = file.readAsLinesSync();


  lines.forEach((element) {
    counter += 1;

    var elementAsList = element.split('');
    var elementAsSet = elementAsList.toSet();
    sets.add(elementAsSet);

    if (counter == 3) {
      counter = 0;
      sets[2].forEach((element) {
        if (sets[0].contains(element) && sets[1].contains(element)) {
          result.add(element);
        }
      });

      sets = [];
    }


  });

  return result;
}

int calcScore(arr) {
  int res = 0;
  arr.forEach((element) {
    res += alphabet.indexOf(element) + 1;
  });
  return res;
}