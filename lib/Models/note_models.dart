import 'package:hive/hive.dart';
part 'note_models.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String department;
  NoteModel(this.id, this.name, this.department);
}
