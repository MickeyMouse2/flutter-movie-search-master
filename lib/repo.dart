class Repo {
  final int id;
  final String poster_path;

  Repo(this.poster_path, this.id);

  static List<Repo> mapJSONStringToList(List<dynamic> jsonList) {

    return jsonList
        .map((r) => Repo(r['poster_path'], r['id']))
        .toList();
  }

  /*static List<Repo> mapJSONid(List<dynamic> jsonList) {

    return jsonList
        .map((r) => Repo(r['poster_path'], r['id'], r['name'],
        r['original_language'], r['origin_country'], r['origin_country']))
        .toList();
  }*/
}
