import 'dart:io';
import 'dart:math';



void main() {

  File file = new File('./input');
  List<int> data = getThreeHighest(fileToArray(file));
  
  print(data);
  print(data.reduce((value, element) => value + element));
}

List<int> fileToArray(file) {
  List<int> lutins = [];
  List<int> arr = [];

  List<String> lines = file.readAsLinesSync();

  lines.forEach((element) {
    if (element != '') {
      arr.add(int.parse(element));
    } else {
      lutins.add(arr.reduce((value, element) => value + element));
      arr = [];
    }
  });

  lutins.add(arr.reduce((value, element) => value + element));
  return lutins;
}

List<int> getThreeHighest(List<int> arr) {
  List<int> sol = [];
  for(int i = 0; i < 3; i++) {
    int maximum = arr.reduce(max);
    sol.add(maximum);
    arr.removeAt(arr.indexOf(maximum));
  }

  return sol;
}