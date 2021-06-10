import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pl_table/model/University.dart';

class UniversityProvider extends ChangeNotifier {

  List<University>? _universities;

  List<University>? get universities => _universities;

  set universities(List<University>? universities) {
    _universities = universities;
  }

  void fetchUniversity() async {
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=United+Kingdom'));

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<University> posts = List<University>.from(l.map((model)=> University.fromJson(model)));
      universities =  posts;
      notifyListeners();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

}