import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrueAssetsRecord extends FirestoreRecord {
  TrueAssetsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Department" field.
  String? _department;
  String get department => _department ?? '';
  bool hasDepartment() => _department != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Major_Specification" field.
  String? _majorSpecification;
  String get majorSpecification => _majorSpecification ?? '';
  bool hasMajorSpecification() => _majorSpecification != null;

  // "Number_of_units" field.
  int? _numberOfUnits;
  int get numberOfUnits => _numberOfUnits ?? 0;
  bool hasNumberOfUnits() => _numberOfUnits != null;

  // "Amount" field.
  String? _amount;
  String get amount => _amount ?? '';
  bool hasAmount() => _amount != null;

  void _initializeFields() {
    _department = snapshotData['Department'] as String?;
    _name = snapshotData['Name'] as String?;
    _majorSpecification = snapshotData['Major_Specification'] as String?;
    _numberOfUnits = castToType<int>(snapshotData['Number_of_units']);
    _amount = snapshotData['Amount'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TRUE_ASSETS');

  static Stream<TrueAssetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrueAssetsRecord.fromSnapshot(s));

  static Future<TrueAssetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrueAssetsRecord.fromSnapshot(s));

  static TrueAssetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TrueAssetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrueAssetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrueAssetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrueAssetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrueAssetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrueAssetsRecordData({
  String? department,
  String? name,
  String? majorSpecification,
  int? numberOfUnits,
  String? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Department': department,
      'Name': name,
      'Major_Specification': majorSpecification,
      'Number_of_units': numberOfUnits,
      'Amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}

class TrueAssetsRecordDocumentEquality implements Equality<TrueAssetsRecord> {
  const TrueAssetsRecordDocumentEquality();

  @override
  bool equals(TrueAssetsRecord? e1, TrueAssetsRecord? e2) {
    return e1?.department == e2?.department &&
        e1?.name == e2?.name &&
        e1?.majorSpecification == e2?.majorSpecification &&
        e1?.numberOfUnits == e2?.numberOfUnits &&
        e1?.amount == e2?.amount;
  }

  @override
  int hash(TrueAssetsRecord? e) => const ListEquality().hash([
        e?.department,
        e?.name,
        e?.majorSpecification,
        e?.numberOfUnits,
        e?.amount
      ]);

  @override
  bool isValidKey(Object? o) => o is TrueAssetsRecord;
}
