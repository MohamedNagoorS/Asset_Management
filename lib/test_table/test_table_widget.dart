import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'test_table_model.dart';
export 'test_table_model.dart';

class TestTableWidget extends StatefulWidget {
  const TestTableWidget({
    super.key,
    String? coe,
  }) : coe = coe ?? 'hello';

  final String coe;

  @override
  State<TestTableWidget> createState() => _TestTableWidgetState();
}

class _TestTableWidgetState extends State<TestTableWidget> {
  late TestTableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestTableModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.assetdata = await queryTrueAssetsRecordOnce(
        queryBuilder: (trueAssetsRecord) => trueAssetsRecord.where(
          'Department',
          isEqualTo: widget.coe,
        ),
      );
      setState(() {
        _model.field = _model.assetdata!.toList().cast<TrueAssetsRecord>();
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            valueOrDefault<String>(
              widget.coe,
              'hi',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'add_data',
                        queryParameters: {
                          'dept': serializeParam(
                            widget.coe,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: '',
                    icon: const Icon(
                      Icons.add_circle,
                      size: 40.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final asset = _model.assetdata?.toList() ?? [];
                      return FlutterFlowDataTable<TrueAssetsRecord>(
                        controller: _model.paginatedDataTableController,
                        data: asset,
                        columnsBuilder: (onSortChanged) => [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Name',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Specification',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Number of units',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Price',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                        dataRowBuilder: (assetItem, assetIndex, selected,
                                onSelectChanged) =>
                            DataRow(
                          color: MaterialStateProperty.all(
                            assetIndex % 2 == 0
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FlutterFlowTheme.of(context).alternate,
                          ),
                          cells: [
                            AutoSizeText(
                              assetItem.name,
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            AutoSizeText(
                              assetItem.majorSpecification,
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            AutoSizeText(
                              assetItem.numberOfUnits.toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            AutoSizeText(
                              assetItem.amount,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].map((c) => DataCell(c)).toList(),
                        ),
                        paginated: true,
                        selectable: false,
                        hidePaginator: false,
                        showFirstLastButtons: false,
                        width: 800.0,
                        height: 800.0,
                        headingRowHeight: 70.0,
                        dataRowHeight: 150.0,
                        columnSpacing: 1.0,
                        headingRowColor: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(12.0),
                        addHorizontalDivider: true,
                        addTopAndBottomDivider: false,
                        hideDefaultHorizontalDivider: false,
                        horizontalDividerColor:
                            FlutterFlowTheme.of(context).primaryText,
                        horizontalDividerThickness: 1.0,
                        addVerticalDivider: true,
                        verticalDividerColor:
                            FlutterFlowTheme.of(context).primaryText,
                        verticalDividerThickness: 1.0,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
