import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_table_widget.dart' show TestTableWidget;
import 'package:flutter/material.dart';

class TestTableModel extends FlutterFlowModel<TestTableWidget> {
  ///  Local state fields for this page.

  List<TrueAssetsRecord> field = [];
  void addToField(TrueAssetsRecord item) => field.add(item);
  void removeFromField(TrueAssetsRecord item) => field.remove(item);
  void removeAtIndexFromField(int index) => field.removeAt(index);
  void insertAtIndexInField(int index, TrueAssetsRecord item) =>
      field.insert(index, item);
  void updateFieldAtIndex(int index, Function(TrueAssetsRecord) updateFn) =>
      field[index] = updateFn(field[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in test_table widget.
  List<TrueAssetsRecord>? assetdata;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<TrueAssetsRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
