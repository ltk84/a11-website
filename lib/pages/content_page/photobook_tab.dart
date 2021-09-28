import 'package:flutter/material.dart';

class PhotobookTab extends StatelessWidget {
  const PhotobookTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double scaleFactor = deviceWidth < 767 ? 0.7 : 0.5;
    final double gridScaleFactor = deviceWidth < 767 ? 0.45 : (deviceWidth < 1280 ? 0.55 : 1);
    final int gridColumn = deviceWidth < 767 ? 2 : (deviceWidth < 1280 ? 3 : 4);

    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Center(
                child: Text(
                  'Albums /',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                alignment: Alignment.center,
                child: _buildSearchBar(deviceWidth*scaleFactor),
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 150 * gridScaleFactor),
          sliver: SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: gridColumn),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  color: Colors.grey,
                );
              },
              childCount: 5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(double width) {
    return Container(
      height: 36,
      width: width,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF3F3F3),
          prefixIcon: Icon(Icons.search),
          hintText: 'Searching in Albums',
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
