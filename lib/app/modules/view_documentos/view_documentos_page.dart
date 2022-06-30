import 'package:Gestart/app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'view_documentos_controller.dart';

class ViewDocumentosPage extends StatefulWidget {
  final String title;
  final String url;
  final PDFDocument document;

  const ViewDocumentosPage({Key key, this.title = "", this.url, this.document})
      : super(key: key);

  @override
  _ViewDocumentosPageState createState() => _ViewDocumentosPageState();
}

class _ViewDocumentosPageState
    extends ModularState<ViewDocumentosPage, ViewDocumentosController> {
  //use 'controller' variable to access controller
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    if (widget.url != null) {
      loadDocument();
    } else
      setDocument();
  }

  setDocument() async {
    document = widget.document;

    setState(() => _isLoading = false);
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(widget.url);

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context,
        title: Text(
          widget.title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Center(child: PDFViewer(document: document)),
    );
  }
}
