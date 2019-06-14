class Id {
  final String logo_path;
  final int id;
  final String name;
  final String description;

  Id(this.logo_path, this.id, this.name, this.description);
static List<Id> mapJSONid(List<dynamic> jsonList) {

    return jsonList
        .map((r) => Id(r['logo_path'], r['id'], r['name'],
        r['origin_country']))
        .toList();
  }
}
