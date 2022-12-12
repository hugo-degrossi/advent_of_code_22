import 'dart:ffi';
import 'dart:io';
import 'dart:math';

void main() {

  File file = new File('./input');
  String hash = fileToArray(file);

  int i = 0;

  while(true) {

    List<String> lastFour = [];

    for(int j=0; j<4; j++) {
      lastFour.add(hash[i+j]);
    }

    Set<String> lastFourSet = {...lastFour};

    if (lastFourSet.length == 4) {
      print(lastFourSet);
      print(i+4);
      return;
    }

    i++;
  }
}


String fileToArray(file) {
  List<String> lines = file.readAsLinesSync();
  return lines[0];
}