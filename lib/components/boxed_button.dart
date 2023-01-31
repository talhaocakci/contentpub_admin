import 'package:contentpub_admin/course/create_course.dart';
import 'package:contentpub_admin/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BoxedButtonWidget extends StatefulWidget {
  final Widget goToWidget;
  final String text;
  final IconData icon;

  const BoxedButtonWidget({
    super.key,
    required this.goToWidget,
    required this.icon,
    required this.text,
  });

  @override
  State<BoxedButtonWidget> createState() => _BoxedButtonWidgetState();
}

class _BoxedButtonWidgetState extends State<BoxedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
        child: Material(
          color: Colors.transparent,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => widget.goToWidget));
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.video_file,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 32,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Text(
                    widget.text,
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: const Color(0xFF8B97A2),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
