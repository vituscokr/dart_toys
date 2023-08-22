import 'dart:io';
import 'package:hive/hive.dart';

void runHelloHive() async {
  var path = Directory.current.path;
  Hive.init(path);
  Hive.registerAdapter(StudentAdaptor());
  var box = await Hive.openBox('studentDB');

  var student1 = Student(id: 'STUD#0001', name: 'Dart', dept: 'Seoul');
  var student2 = Student(id: 'STUD#0002', name: 'Flutter', dept: 'Bundang');

  await box.put('STUD#0001', student1);
  await box.put('STUD#0002', student2);

  print('STUD#0001 : ${box.get('STUD#0001')}');
  print('STUD#0002 : ${box.get('STUD#0002')}');
}

class Student {
  Student({required this.id, required this.name, required this.dept});

  String id;
  String name;
  String dept;

  @override
  String toString() {
    return '$id: $name -$dept';
  }
}

class StudentAdaptor extends TypeAdapter<Student> {
  @override
  final typeId = 0;

  @override
  Student read(BinaryReader reader) {
    var id = reader.readDouble().toString();
    var name = reader.readDouble().toString();
    var dept = reader.readDouble().toString();

    return Student(id: id, name: name, dept: dept);
  }

  void write(BinaryWriter writer, Student obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.dept);
  }
}
