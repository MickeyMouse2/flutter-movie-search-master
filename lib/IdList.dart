import 'package:flutter/material.dart';
import 'package:github_search/IdItem.dart';
import 'package:github_search/ID.dart';
import 'package:github_search/search.dart';

import 'api.dart';

class IdList extends StatefulWidget {
  String ID;
  IdList(this.ID, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IdList(ID);
}
  class _IdList extends State<IdList> {
    List<Id> _Id = List();
    _IdList(String ID) {
      idParse(ID);
    }


    Future idParse(String ID) async {

      final id = await Api.getMovieID(ID);
        if (id != null) {
          this._Id = id;
        } else {
          var _error = 'Error fetching movie';
        };
    }

    @override
    void LaunchIdMovie(String id) async {
      /*final repos = await Api.getMovieID(id);
    _results = repos;
    MovieItems(_results[0]);*/
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Container(
            margin: EdgeInsets.only(top: 4.0),
            child: Column(
              children: <Widget>[
                Text('Movie repos',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline
                        .apply(color: Colors.white)),
              ],
            )),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchList(),
                    ));
              }),
        ],
      ),

    );
  }
    Widget buildBody(BuildContext context) {
        return ListView.builder(

            padding: EdgeInsets.symmetric(vertical: 8.0),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return IdItem(_Id[index]);
            }
            );


    }

}


