import 'package:contentpub_admin/custom_models/editable/editables.dart';
import 'package:flutter/material.dart';

class CreateSettingsWidget extends StatefulWidget {
  final String tenantId;
  final EditableTenantConfiguration conf;

  const CreateSettingsWidget(
      {super.key, required this.tenantId, required this.conf});

  @override
  State<CreateSettingsWidget> createState() => _CreateSettingsWidgetState();
}

class _CreateSettingsWidgetState extends State<CreateSettingsWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Form(
              key: widget.key,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      // hintText: 'eg: 9.99 or 9 or 10.50',
                      label: Text('Stripe secret key'),
                    ),
                    onChanged: (value) {
                      if (value != '') {
                        widget.conf.stripeSecretKey = value;
                      }
                    },
                  ),
                ],
              ))
        ],
      )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
