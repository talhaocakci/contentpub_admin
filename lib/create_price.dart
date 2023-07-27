import 'package:contentpub_admin/custom_models/editable/editables.dart';
import 'package:flutter/material.dart';

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
    widget.price.currency ??= 'USD';

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
                    decoration: const InputDecoration(
                      hintText: 'eg: 3',
                      label: Text('Trial days from 0 to 31'),
                    ),
                    onChanged: (value) {
                      if (value != '') {
                        widget.price.trialDays = int.parse(value);
                        print('trial days: ${widget.price.trialDays}');
                      }
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
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
