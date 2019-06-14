import 'package:flutter/material.dart';
import 'package:github_search/api.dart';
import 'dart:async';
import 'package:github_search/repo.dart';
import 'package:github_search/IdList.dart';


class MovieItems extends StatelessWidget {
  final Repo repo;

  //List<Repo> _results = List();
  MovieItems(this.repo);

  //MovieItems(this.repo);


  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IdList('/3/movie/'+repo.id.toString()),
                  ));
              /*Navigator.of(context).pushReplacement(new MaterialPageRoute(
                builder: (BuildContext context) => PageID(context)));*/
            }
          },
          highlightColor: Colors.lightBlueAccent,
          splashColor: Colors.red,
          child: Container(
            padding: EdgeInsets.all(100.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 1.0),
                    child: Row(
                      children: <Widget>[
                        Image.network('${'https://image.tmdb.org/t/p/w200'}${repo.poster_path}'
                        ),
                      ],
                    ),
                  ),
                ]),
          )),
    );
  }


}