// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntryAdapter extends TypeAdapter<Entry> {
  @override
  final int typeId = 0;

  @override
  Entry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Entry(
      fields[1] as String,
      fields[2] as String,
      (fields[3] as List)?.cast<Emotion>(),
      (fields[4] as List)?.cast<Activity>(),
    )
      ..id = fields[0] as String
      ..created = fields[5] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Entry obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.mood)
      ..writeByte(3)
      ..write(obj.emotions)
      ..writeByte(4)
      ..write(obj.activities)
      ..writeByte(5)
      ..write(obj.created);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
