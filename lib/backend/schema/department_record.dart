import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DepartmentRecord extends FirestoreRecord {
  DepartmentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Picture" field.
  String? _picture;
  String get picture => _picture ?? '';
  bool hasPicture() => _picture != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _picture = snapshotData['Picture'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Department');

  static Stream<DepartmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DepartmentRecord.fromSnapshot(s));

  static Future<DepartmentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DepartmentRecord.fromSnapshot(s));

  static DepartmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DepartmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DepartmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DepartmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DepartmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DepartmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDepartmentRecordData({
  String? name,
  String? picture,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'Picture': picture,
    }.withoutNulls,
  );

  return firestoreData;
}

class DepartmentRecordDocumentEquality implements Equality<DepartmentRecord> {
  const DepartmentRecordDocumentEquality();

  @override
  bool equals(DepartmentRecord? e1, DepartmentRecord? e2) {
    return e1?.name == e2?.name && e1?.picture == e2?.picture;
  }

  @override
  int hash(DepartmentRecord? e) =>
      const ListEquality().hash([e?.name, e?.picture]);

  @override
  bool isValidKey(Object? o) => o is DepartmentRecord;
}
