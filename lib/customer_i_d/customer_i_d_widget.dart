import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerIDWidget extends StatefulWidget {
  const CustomerIDWidget({Key? key}) : super(key: key);

  @override
  _CustomerIDWidgetState createState() => _CustomerIDWidgetState();
}

class _CustomerIDWidgetState extends State<CustomerIDWidget> {
  ApiCallResponse? apiResultr96;
  TextEditingController? customerIdController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    customerIdController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    customerIdController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 70, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://www.homenet.no/images/a39cd73.png',
                      width: 240,
                      height: 60,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.05, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Text(
                          'Vi har i dag stengt ditt internettabonnement fra HomeNet, med bakgrunn i ubetalt(e) faktura.\n\nBekreft ditt telefon nummer her, så gjenåpner vi ditt internettabonnement midlertidig. Dersom vi ikke mottar betaling innen tre virkedager, vil abonnementet bli stengt igjen.\n\nFor betalingsinformasjon, se tidligere tilsendt faktura eller logg deg inn på Min Side\n\nwww.homenet.no/minside/login Vi gjør oppmerksom på at du vil bli fakturert 500 kroner i stengegebyr på neste faktura.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                      child: Container(
                        width: 300,
                        child: TextFormField(
                          controller: customerIdController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Kundenummer',
                            labelStyle: FlutterFlowTheme.of(context).bodyText2,
                            hintText: 'Skriv inn ditt kundenummer',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0F1113),
                                  ),
                          maxLines: null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          apiResultr96 = await AddCall.call(
                            customerId: customerIdController!.text,
                          );
                          if ((apiResultr96?.succeeded ?? true)) {
                            context.pushNamed(
                              'Success',
                              queryParams: {
                                'casenr': serializeParam(
                                  getJsonField(
                                    (apiResultr96?.jsonBody ?? ''),
                                    r'''$.CaseNumber''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          }

                          setState(() {});
                        },
                        text: 'Åpne',
                        options: FFButtonOptions(
                          width: 230,
                          height: 50,
                          color: Color(0xFF2FB73C),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
