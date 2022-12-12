import 'dart:ffi';
import 'dart:io';
import 'dart:math';

void main() {

  File file = new File('./input');
  String hash = fileToArray(file);

  int i = 0;

  while(true) {

    List<String> last = [];

    for(int j=0; j<14; j++) {
      last.add(hash[i+j]);
    }

    Set<String> lastSet = {...last};

    if (lastSet.length == 14) {
      print(lastSet);
      print(i+14);
      return;
    }

    i++;
  }
}


String fileToArray(file) {
  List<String> lines = file.readAsLinesSync();
  return lines[0];
}