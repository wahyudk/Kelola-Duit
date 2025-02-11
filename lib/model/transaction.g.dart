// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 0;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction()
      ..nama = fields[0] as String
      ..total = fields[1] as double
      ..isPemasukan = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nama)
      ..writeByte(1)
      ..write(obj.total)
      ..writeByte(2)
      ..write(obj.isPemasukan);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
