import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import './photobook_tab.dart';
import '../../widgets/svg_icon.dart';

class ContentPage extends StatefulWidget {
  final Function onScroll;
  const ContentPage({Key? key, required this.onScroll}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final ScrollController scrollController = ScrollController();
  bool toPreviousPage = true;

  @override
  void initState() {
    tabController = TabController(initialIndex: 1, length: 3, vsync: this);
    scrollController.addListener(() {
      toPreviousPage = false;
      if (scrollController.position.atEdge && scrollController.position.pixels == 0) {
        toPreviousPage = true;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      // to detect scroll
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          if (toPreviousPage) {
            widget.onScroll(pointerSignal.scrollDelta.dy);
          }
        }
      },
      child: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      'A11',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 500),
                      child: _buildTabBar(),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    _buildHeaderDivider(),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Text('Yearbook'),
            PhotobookTab(),
            Text('Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: tabController,
      isScrollable: false,
      indicatorColor: Colors.transparent,
      labelColor: Theme.of(context).primaryColor,
      labelStyle: Theme.of(context).textTheme.headline2,
      unselectedLabelStyle:
      Theme.of(context).textTheme.headline2!.copyWith(
        fontSize: (Theme.of(context)
            .textTheme
            .headline2!
            .fontSize)! *
            0.75,
      ),
      tabs: [
        Tab(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Text('Yearbook'),
          ),
        ),
        Tab(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Text('Photobook'),
          ),
        ),
        Tab(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Text('Profile'),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderDivider() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 675),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Theme.of(context).primaryColor,
              thickness: 0.5,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: SvgIcon(
              iconPath: 'assets/icons/penguin.svg',
              size: 16,
            ),
          ),
          Expanded(
            child: Divider(
              color: Theme.of(context).primaryColor,
              thickness: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
