import 'dart:io';
import 'dart:math';



void main() {

  File file = new File('./input');
  List<int> data = fileToArray(file);

  print('Max number of calories carried: ' + data.reduce(max).toString());
  print('Who\'s carrying them: ' + data.indexOf(data.reduce(max)).toString());
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