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
      if (scrollController.position.atEdge &&
          scrollController.position.pixels == 0) {
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
    final double textScaleFactor = MediaQuery.of(context).size.width < 767 ? 0.8 : 1.0;
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
                            fontSize: Theme.of(context).textTheme.headline1!.fontSize! * textScaleFactor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: _buildTabBar(textScaleFactor),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: _buildHeaderDivider(textScaleFactor),
                    ),
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

  Widget _buildTabBar(double textScaleFactor) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      indicatorColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      labelColor: Theme.of(context).primaryColor,
      labelStyle: Theme.of(context).textTheme.headline2!.copyWith(
        fontSize: (Theme.of(context).textTheme.headline2!.fontSize)! * textScaleFactor,
      ),
      unselectedLabelStyle: Theme.of(context).textTheme.headline2!.copyWith(
            fontSize: (Theme.of(context).textTheme.headline2!.fontSize)! * textScaleFactor * 0.75,
          ),
      tabs: [
        Container(
          width: 120 * textScaleFactor,
          alignment: Alignment.bottomRight,
          child: Tab(
            text: 'Yearbook',
          ),
        ),
        Container(
          width: 180 * textScaleFactor,
          child: Tab(
            text: 'Photobook',
          ),
        ),
        Container(
          width: 120 * textScaleFactor,
          alignment: Alignment.bottomLeft,
          child: Tab(
            text: 'Profile',
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderDivider(double textScaleFactor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50 * textScaleFactor,
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
        Container(
          width: 50 * textScaleFactor,
          child: Divider(
            color: Theme.of(context).primaryColor,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
