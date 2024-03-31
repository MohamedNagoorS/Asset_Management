import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssetdataRecord extends FirestoreRecord {
  AssetdataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "COE" field.
  String? _coe;
  String get coe => _coe ?? '';
  bool hasCoe() => _coe != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _coe = snapshotData['COE'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ASSETDATA');

  static Stream<AssetdataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AssetdataRecord.fromSnapshot(s));

  static Future<AssetdataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AssetdataRecord.fromSnapshot(s));

  static AssetdataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AssetdataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AssetdataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AssetdataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AssetdataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AssetdataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAssetdataRecordData({
  String? name,
  double? price,
  int? quantity,
  String? coe,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'quantity': quantity,
      'COE': coe,
    }.withoutNulls,
  );

  return firestoreData;
}

class AssetdataRecordDocumentEquality implements Equality<AssetdataRecord> {
  const AssetdataRecordDocumentEquality();

  @override
  bool equals(AssetdataRecord? e1, AssetdataRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.quantity == e2?.quantity &&
        e1?.coe == e2?.coe;
  }

  @override
  int hash(AssetdataRecord? e) =>
      const ListEquality().hash([e?.name, e?.price, e?.quantity, e?.coe]);

  @override
  bool isValidKey(Object? o) => o is AssetdataRecord;
}
