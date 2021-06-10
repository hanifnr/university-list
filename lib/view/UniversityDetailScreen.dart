import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pl_table/model/University.dart';

class UniversityDetailScreen extends StatefulWidget {
  final University university;

  const UniversityDetailScreen({Key? key, required this.university}) : super(key: key);

  @override
  _UniversityDetailScreenState createState() => _UniversityDetailScreenState();
}

class _UniversityDetailScreenState extends State<UniversityDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.university.name),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Item(label: 'Country', value: widget.university.country),
            SizedBox(height: 30),
            _Item(label: 'Domains', value: widget.university.alphaTwoCode),
            SizedBox(height: 30),
            _Item(label: 'Domains', value: widget.university.domains[0]),
            SizedBox(height: 30),
            _Item(label: 'Web page', value: widget.university.webPages[0])
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String label;
  final String value;

  const _Item({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10,),
        Text(value,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[600]
          ),
        )
      ],
    );
  }
}

