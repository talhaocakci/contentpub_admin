import 'package:contentpub_admin/models/Bundle.dart';
import 'package:contentpub_admin/models/ModelProvider.dart';
import 'package:contentpub_admin/models/Price.dart';
import 'package:flutter/material.dart';

class ProductSummary extends StatefulWidget {
  final Bundle bundle;

  const ProductSummary({Key? key, required this.bundle}) : super(key: key);

  @override
  _ProductSummaryState createState() => _ProductSummaryState();
}

class _ProductSummaryState extends State<ProductSummary> {
  @override
  Widget build(BuildContext context) {
    print('bundle in productsumamrt: ${widget.bundle}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        _buildLabelAndTextField(label: 'Product Name', value: widget.bundle.name ?? ''),
        const SizedBox(height: 10),
        _buildLabelAndTextField(label: 'Product Description', value: widget.bundle.description ?? ''),
        const SizedBox(height: 10),
        Text(
          'Contents',
          style: TextStyle(fontSize: 24),
        ),
        _buildLabelAndTextField(label: 'All Courses', value: (widget.bundle.isAllCourses ?? false) ? 'Yes' : 'No'),
        const SizedBox(height: 10),
        _buildLabelAndTextField(label: 'All Files', value: (widget.bundle.isAllDocuments ?? false) ? 'Yes' : 'No'),
        const SizedBox(height: 10),
        if (widget.bundle.contents != null) contentsTable(),
        const SizedBox(height: 10),
        Text(
          'Prices',
          style: TextStyle(fontSize: 24),
        ),
        if (widget.bundle.prices != null) _pricesTable(),
      ],
    );
  }

  Widget _buildLabelAndTextField({required String label, required String value}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(value),
        )
      ],
    );
  }

  Widget contentsTable() {
    return DataTable(
      columns: [
        const DataColumn(label: Text('Name')),
        const DataColumn(label: Text('Description')),
        const DataColumn(label: Text('Type')),
      ],
      rows: [
        for (var c in widget.bundle.contents as List<BundleContent>)
          DataRow(cells: [
            DataCell(Text(c.content.name ?? '')),
            DataCell(Text(c.content.description ?? '')),
            DataCell(Text(c.content.type?.name ?? '')),
          ]),
        // Add more DataRow as needed
      ],
    );
  }

  Widget _pricesTable() {
    return DataTable(
      columns: [
        const DataColumn(label: Text('Duration')),
        const DataColumn(label: Text('Price')),
        const DataColumn(label: Text('Trial Period')),
      ],
      rows: [
        for (var price in widget.bundle.prices ?? [] as List<Price>)
          DataRow(cells: [
            DataCell(Text('${price.recurrenceInterval} ${price.recurrenceType}')),
            DataCell(Text('${price.amount} ${price.currency}')),
            DataCell(Text('${price.trialPeriod} days')),
          ])
      ],
    );
  }
}
