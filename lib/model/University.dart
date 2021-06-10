class University {
  late List<String> _webPages;
  late String _alphaTwoCode;
  late String _country;
  late String _name;
  late List<String> _domains;

  University(
    this._webPages,
    this._alphaTwoCode,
    this._country,
    this._name,
    this._domains
  );

  List<String> get webPages => _webPages;
  set webPages(List<String> webPages) => _webPages = webPages;
  String get alphaTwoCode => _alphaTwoCode;
  set alphaTwoCode(String alphaTwoCode) => _alphaTwoCode = alphaTwoCode;
  String get country => _country;
  set country(String country) => _country = country;
  String get name => _name;
  set name(String name) => _name = name;
  List<String> get domains => _domains;
  set domains(List<String> domains) => _domains = domains;

  University.fromJson(Map<String, dynamic> json) {
    _webPages = json['web_pages'].cast<String>();
    _alphaTwoCode = json['alpha_two_code'];
    _country = json['country'];
    _name = json['name'];
    _domains = json['domains'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['web_pages'] = this._webPages;
    data['alpha_two_code'] = this._alphaTwoCode;
    data['country'] = this._country;
    data['name'] = this._name;
    data['domains'] = this._domains;
    return data;
  }
}