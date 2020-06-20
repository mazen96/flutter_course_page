import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: _buildCarouselSection(),
          ),
        ],
      ),
    );
  }

  ////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon((Icons.arrow_back)),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon((Icons.share)),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon((Icons.star_border)),
          onPressed: () {},
        ),
      ],
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );
  }

  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////

  Widget _buildCarouselSection() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: 300.0,
                  child: Carousel(
                    dotSize: 5.0,
                    dotPosition: DotPosition.bottomLeft,
                    dotBgColor: Colors.transparent,
                    indicatorBgPadding: 10.0,
                    autoplay: true,
                    images: [
                      NetworkImage(
                          'http://skillzycp.com/upload/business/389_636896432064799384.jpg'),
                      NetworkImage(
                          'http://skillzycp.com/upload/business/389_636896432315268827.jpg'),
                      NetworkImage(
                          'http://skillzycp.com/upload/business/389_636896432445581923.jpg'),
                      NetworkImage(
                          'http://skillzycp.com/upload/business/389_636896432574644899.jpg')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////

}
