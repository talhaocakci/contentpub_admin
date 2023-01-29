import 'package:contentpub_admin/models/editable/editables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CreatePriceWidget extends StatefulWidget {
  final String bundleId;
  final EditablePrice price;

  const CreatePriceWidget(
      {super.key, required this.price, required this.bundleId});

  @override
  State<CreatePriceWidget> createState() => _CreatePriceWidgetState();
}

class _CreatePriceWidgetState extends State<CreatePriceWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    if (widget.price.currency == null) {
      widget.price.currency = 'USD';
    }

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
                      hintText: 'eg: 9.99 or 9 or 10.50',
                      label: Text('Price as numeric value'),
                    ),
                    onChanged: (value) {
                      if (value != '') {
                        widget.price.amount = double.parse(value);
                      }
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: 'USD',
                    items: const [
                      DropdownMenuItem(value: 'USD', child: Text('USD')),
                      DropdownMenuItem(value: 'EUR', child: Text('EUR'))
                    ],
                    onChanged: (value) {
                      widget.price.bundleID = widget.bundleId;
                      widget.price.currency = value;
                      // set the currency
                    },
                  )
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
