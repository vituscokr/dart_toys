import 'dart:convert';
import 'dart:io';
import 'dart:core';

void main() async {
  print("[1] File read scenario #1");

  try {
    String fileContent = await readFileToString("./input/src.txt");
    print(fileContent);
  } catch (e) {
    print(e);
  }
  print("[2] File read scenario #2");

  try {
    List<String> fileContent = await readFileToList("./input/src.txt");
    for (var fileline in fileContent) {
      print(fileline);
    }
  } catch (e) {
    print(e);
  }

  final output = "./output/out.txt";
  //2023-08-21 19:30:26.252392
  final content = "${DateTime.now()} This is 글자야";

  try {
    await writeTo(output, content);
  } catch (e) {
    print(e);
  }
}

Future<String> readFileToString(String filename) async {
  var file = File(filename);
  String fileContent = await file.readAsString();
  return fileContent;
}

Future<List<String>> readFileToList(String filename) async {
  Stream<String> lines = File(filename)
      .openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter());

  try {
    List<String> sList = [];
    await for (var line in lines) {
      sList.add(line);
    }
    return sList;
  } catch (e) {
    throw (e);
  }
}

Future<void> writeTo(String filename, String content) async {
  var fh = File(filename).openWrite();
  fh.write(content);
  fh.close();
}
