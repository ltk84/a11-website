import 'package:a11_website/core/services/service_locator.dart';
import 'package:a11_website/core/view_models/photos_demo_view_model.dart';
import 'package:a11_website/widgets/album_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotobookTab extends StatefulWidget {
  const PhotobookTab({Key? key}) : super(key: key);

  @override
  _PhotobookTabState createState() => _PhotobookTabState();
}

class _PhotobookTabState extends State<PhotobookTab> {
  PhotosViewModel model = serviceLocator.get<PhotosViewModel>();

  @override
  void initState() {
    model.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double scaleFactor = deviceWidth < 767 ? 0.7 : 0.5;
    final double gridScaleFactor =
        deviceWidth < 767 ? 0.45 : (deviceWidth < 1280 ? 0.55 : 1);
    final int gridColumn = deviceWidth < 767 ? 1 : (deviceWidth < 1280 ? 2 : 3);

    // final List<String> photoURLs = [
    //   'https://drive.google.com/uc?export=view&id=1Smavx4SKGsgcpeyIa88whBEPbsywgAWc',
    //   'https://drive.google.com/uc?export=view&id=1F0egBqsxBASkMZY5bX2U73rO2NjqXB-6',
    //   'https://drive.google.com/uc?export=view&id=1kl8zJ33knSfgAzwoOUKYKrh5s1j-Jiwn',
    //   'https://drive.google.com/uc?export=view&id=1W4aeRJSauZpSIzpC9B8ZSsVCygyf6ltZ',
    //   'https://drive.google.com/uc?export=view&id=1hXhtXtL5Sk-c2NFakS32cbQHEF7TVWjf',
    //   'https://drive.google.com/uc?export=view&id=17utftkUMicHswkyggkjb0ZmdnE6Zszuv',
    // ];

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
      ),
      child: CustomScrollView(
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
                  child: _buildSearchBar(deviceWidth * scaleFactor),
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          ChangeNotifierProvider<PhotosViewModel>(
            create: (context) => model,
            child: Consumer<PhotosViewModel>(
              builder: (context, model, child) => SliverPadding(
                padding:
                    EdgeInsets.symmetric(horizontal: 150 * gridScaleFactor),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridColumn,
                    childAspectRatio: 0.88,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return AlbumPlaceholder(
                        photoURL: model.images[index].url,
                        title: 'Album',
                        subtitle: '1000 photos',
                      );
                    },
                    childCount: model.images.length,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
