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

  List<String> lines = file.readAsLinesSync();

  lines.forEach((element) {
    int len = element.length ~/ 2;
    List<String> elements = [element.substring(0, len), element.substring(len)];

    // no other way than this to break out of a foreach in dart :(
    try {
      elements[0].runes.forEach((element) {
        var char = new String.fromCharCode(element);
        if (elements[1].contains(char)) {
          result.add(char);
          throw 'Stop this';
        }
      });
    } catch (e) {}

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