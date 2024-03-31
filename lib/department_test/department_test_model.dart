import '/flutter_flow/flutter_flow_util.dart';
import 'department_test_widget.dart' show DepartmentTestWidget;
import 'package:flutter/material.dart';

class DepartmentTestModel extends FlutterFlowModel<DepartmentTestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
