import 'package:flutter/material.dart';
import 'package:github_search/ID.dart';


class IdItem extends StatelessWidget {
  final Id id;
  IdItem(this.id);

  @override
  Widget build(BuildContext context) {
    return Card(
    child: InkWell(
        highlightColor: Colors.lightBlueAccent,
        splashColor: Colors.red,
        child: Container(
          padding: EdgeInsets.all(500.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text((id.name != null) ? id.name : '-',
                    style: Theme.of(context).textTheme.subhead),
                Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text(
                      id.description != null
                          ? id.description
                          : 'No desription',
                      style: Theme.of(context).textTheme.body1),
                ),
                Image.network(
                  '${'https://image.tmdb.org/t/p/w200'}${id.logo_path}',
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text((id.id.toString() != null) ? id.id.toString() : '',
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.caption)),
                      Expanded(
                          child: Text(
                              (id.description != null) ? id.description : '',
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.caption)),
                    ],
                  ),
                ),
              ]),
        )
    )
    );
  }

}