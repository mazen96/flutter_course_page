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
          Flexible(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _buildCourseDetailsSection(),
                  Divider(thickness: 1.0),
                  _buildTrainerSection(),
                  Divider(thickness: 1.0),
                  _buildAboutCourseSection(),
                  Divider(thickness: 1.0),
                  _buildReservationTypesSection(),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: _buildReservationButton(),
          )
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

  Widget _buildCourseDetailsSection() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('# رياضة'),
          Text(
            'الاسم الكامل للدورة بشكل افتراضي من اجل اظهار شكل التصميم',
            style: Theme.of(context)
                .textTheme
                .headline6
                .apply(color: Colors.grey[600], fontWeightDelta: 1),
          ),
          SizedBox(height: 5.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.calendar_today,
                size: 15.0,
              ),
              SizedBox(width: 10.0),
              Text('الاربعاء 19 نيسان 7 مساءاً')
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.place,
                size: 15.0,
              ),
              SizedBox(width: 10.0),
              Text('عنوان الدورة او الحدث بشكل كامل')
            ],
          ),
        ],
      ),
    );
  }

  /////////////////////////////////////////////////////
  /////////////////////////////////////////////////////

  Widget _buildTrainerSection() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage(
                  "http://skillzycp.com/upload/trainer/389_BaseImage_636896408382239890.jpg",
                ),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(width: 10.0),
              Text('اسم المدرب',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .apply(fontWeightDelta: 50))
            ],
          ),
          SizedBox(height: 5.0),
          Text(
              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى'),
        ],
      ),
    );
  }

  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////

  Widget _buildAboutCourseSection() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'عن الدورة',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .apply(fontWeightDelta: 50),
          ),
          SizedBox(height: 5.0),
          Text(
              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.')
        ],
      ),
    );
  }

  /////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////

  Widget _buildReservationTypesSection() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'تكلفة الدورة',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .apply(fontWeightDelta: 50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text('الحجز العادي'), Text('40 SAR')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text('الحجز المميز'), Text('120 SAR')],
          ),
        ],
      ),
    );
  }

  ////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////

  Widget _buildReservationButton() {
    return Container(
      //padding: EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero)),
              onPressed: () {},
              child: Text(
                'قم بالحجز الاّن',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }

  ////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////

}
