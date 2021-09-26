import 'package:flutter/material.dart';

class PhotobookTab extends StatelessWidget {
  const PhotobookTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              _buildSearchBar(),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 300),
          sliver: SliverGrid(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.grey,
                  ),
                );
              },
              childCount: 5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 36,
      padding: EdgeInsets.symmetric(horizontal: 400),
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
