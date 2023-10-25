import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'comentar_widget.dart' show ComentarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComentarModel extends FlutterFlowModel<ComentarWidget> {
  ///  Local state fields for this page.

  CommentsRecord? commentparameter;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for mensagem widget.
  FocusNode? mensagemFocusNode;
  TextEditingController? mensagemController;
  String? Function(BuildContext, String?)? mensagemControllerValidator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    mensagemFocusNode?.dispose();
    mensagemController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
