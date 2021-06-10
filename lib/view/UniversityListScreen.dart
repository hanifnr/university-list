import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pl_table/Provider/UniversityProvider.dart';
import 'package:pl_table/model/University.dart';
import 'package:pl_table/view/UniversityDetailScreen.dart';
import 'package:provider/provider.dart';

class TableScreen extends StatefulWidget {
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> with TickerProviderStateMixin{
  final TextEditingController _filter = new TextEditingController();
  Widget _appBarTitle = new Text('List of University');
  Icon _searchIcon = new Icon(Icons.search);
  late List<University> _filteredUniversities;
  var _searchText = "";

  _TableScreenState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
    Consumer<UniversityProvider>(builder: (context, university, _){
      return
        Scaffold(
            appBar: AppBar(
              title: _appBarTitle,
              actions: [
                IconButton(
                  icon: _searchIcon,
                  onPressed: _appbarAction,
                  iconSize: 30,
                )
              ],
            ),
            body: _buildBody(university.universities)
        );
    });
  }

  Widget _buildRow(BuildContext context, University university, int i) {
    return InkWell(
      onTap: () => Navigator.push(context,
          PageTransition(
              child: UniversityDetailScreen(university: university),
              type: PageTransitionType.rightToLeft
          )
      ),
      child: Container(
        color: i % 2 == 0 ? Colors.white : Color.fromRGBO(248, 252, 253, 1),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 25),
          child: Text(university.name,
            style: TextStyle(
              fontSize: 15
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(List<University>? universities) {
    if (_searchText.length > 0) {
      _filteredUniversities = universities!.where((element) =>
          element.name.toLowerCase().contains(_searchText)).toList();
    } else {
      _filteredUniversities = universities!;
    }
    if (universities != null) {
      return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: _filteredUniversities.length,
        itemBuilder: (context, i) {
          return _buildRow(context, _filteredUniversities[i], i);
        });
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  void _appbarAction() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: Colors.white
            )
          ),
          style: TextStyle(
            color: Colors.white
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('List of University');
        _filter.clear();
      }
    });
  }

}
