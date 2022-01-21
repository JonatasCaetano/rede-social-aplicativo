import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:social_network_application/scoped_model/support/language_model.dart';
import 'package:social_network_application/scoped_model/support/theme_model.dart';
import 'package:social_network_application/view/tabs%20datasheet/category_0.dart';
import 'package:social_network_application/view/tabs%20datasheet/category_1.dart';
import 'package:social_network_application/view/tabs%20datasheet/category_2.dart';
import 'package:social_network_application/view/tabs%20datasheet/category_3.dart';
import 'package:social_network_application/view/tabs%20datasheet/category_4.dart';
import 'package:social_network_application/view/tabs%20datasheet/category_5.dart';
import 'package:social_network_application/view/tabs%20datasheet/category_6.dart';
import 'package:social_network_application/view/tabs%20datasheet/category_7.dart';
import 'package:social_network_application/view/tabs%20datasheet/category_8.dart';

// ignore: must_be_immutable
class Datasheet extends StatefulWidget {
  int index;
  bool isUser;
  String idUser;
  Datasheet(
      {required this.index,
      required this.isUser,
      required this.idUser,
      Key? key})
      : super(key: key);

  @override
  _DatasheetState createState() => _DatasheetState();
}

class _DatasheetState extends State<Datasheet>
    with AutomaticKeepAliveClientMixin<Datasheet> {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(builder: (context, child, theme) {
      return Scaffold(
          //backgroundColor: Colors.black,
          body: Container(
        margin: const EdgeInsets.only(top: 24.0),
        child: DefaultTabController(
            length: 9,
            child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      //backgroundColor: Color(0xff0f1b1b),
                      toolbarHeight: 40.0,
                      floating: false,
                      pinned: false,
                      snap: false,
                      flexibleSpace: FlexibleSpaceBar(
                          titlePadding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 0.0),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 16, bottom: 8),
                            child: Text(
                              LanguageModel()
                                  .typeEntitiesMini[widget.index]
                                  .toString(),
                              style: TextStyle(
                                color: theme.title,
                                fontSize: 24.0,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )),
                      actions: const [],
                    ),
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(
                        TabBar(
                          isScrollable: true,
                          labelColor: theme.title,
                          indicatorColor: theme.emphasis,
                          unselectedLabelColor: theme.subtitle,
                          tabs: [
                            Tab(
                              child: Text(
                                LanguageModel().entitiesCategories[widget.index]
                                    [0],
                                style: const TextStyle(
                                  fontSize: 19,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                LanguageModel().entitiesCategories[widget.index]
                                    [1],
                                style: const TextStyle(
                                  fontSize: 19,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                LanguageModel().entitiesCategories[widget.index]
                                    [2],
                                style: const TextStyle(
                                  fontSize: 19,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                LanguageModel().entitiesCategories[widget.index]
                                    [3],
                                style: const TextStyle(
                                  fontSize: 19,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                LanguageModel().entitiesCategories[widget.index]
                                    [4],
                                style: const TextStyle(
                                  fontSize: 19,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                LanguageModel().entitiesCategories[widget.index]
                                    [5],
                                style: const TextStyle(
                                  fontSize: 19,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                LanguageModel().entitiesCategories[widget.index]
                                    [6],
                                style: const TextStyle(
                                  fontSize: 19,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                LanguageModel().entitiesCategories[widget.index]
                                    [7],
                                style: const TextStyle(
                                  fontSize: 19,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                LanguageModel().entitiesCategories[widget.index]
                                    [8],
                                style: const TextStyle(
                                  fontSize: 19,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      pinned: true,
                      floating: false,
                    ),
                  ];
                },
                body: Container(
                  margin: EdgeInsets.zero,
                  child: const TabBarView(children: [
                    Category0(),
                    Category1(),
                    Category2(),
                    Category3(),
                    Category4(),
                    Category5(),
                    Category6(),
                    Category7(),
                    Category8(),
                  ]),
                ))),
      ));
    });
  }

  @override
  bool get wantKeepAlive => true;
}

// ignore: unused_element
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        // decoration: const BoxDecoration(
        //   border: Border(
        //       bottom: BorderSide(
        //           //color: Colors.grey,
        //           //width: 1.0,
        //           )),
        //   //color: Color(0xff0f1b1b),
        // ),
        child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
