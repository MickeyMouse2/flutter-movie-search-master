import 'package:github_search/repo.dart';
import 'package:github_search/ID.dart';
import 'package:date_format/date_format.dart';

import 'dart:convert' show json, utf8;
import 'dart:io';
import 'dart:async';

class Api {
  static final HttpClient _httpClient = HttpClient();
  static final String _url = "api.themoviedb.org";
  static final String _urlID = "api.themoviedb.org";

  static Future<List<Repo>> getMovieWithSearchQuery(String query) async {
    final uri = Uri.https(_url, '/3/search/movie', {
      'api_key': 'c33e25174af866c5c102772d92d0e480',
      'query': query
    });
    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null) {
      return null;
    }
    if (jsonResponse['errors'] != null) {
      return null;
    }
    if (jsonResponse['results'] == null) {
      return List();
    }

    return Repo.mapJSONStringToList(jsonResponse['results']);
  }

  static Future<List<Repo>> getTrendingMovie() async {

    final uri = Uri.https(_url, '/3/search/movie', {
      'api_key': 'c33e25174af866c5c102772d92d0e480',
      'query': 'movie'
    });

    final jsonResponse = await _getJson(uri);
    print(jsonResponse);
    if (jsonResponse == null) {
      return null;
    }
    if (jsonResponse['errors'] != null) {
      return null;
    }
    if (jsonResponse['results'] == null) {
      return List();
    }

    return Repo.mapJSONStringToList(jsonResponse['results']);
  }
  static Future<List<Id>> getMovieID(String ID) async {
    final uri = Uri.https(_urlID, ID, {
      'api_key': 'c33e25174af866c5c102772d92d0e480',
    });
    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null) {
      return null;
    }
    if (jsonResponse['errors'] != null) {
      return null;
    }
    if (jsonResponse['production_companies'] == null) {
      return List();
    }

    return Id.mapJSONid(jsonResponse['production_companies']);
  }

  static Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.OK) {
        return null;
      }

      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}
