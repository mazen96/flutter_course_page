import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttercoursepage/core/models/course.dart';
import 'package:fluttercoursepage/core/services/course_api.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /////////////////////////////////////////////
  CourseApi api = new CourseApi();
  Course course;
  bool _isLoading = true;
  IconData _favIconData = Icons.star_border;

  void initCourse() async {
    course = await api.getCourse();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initCourse();
  }

  /////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Scaffold(
            backgroundColor: Colors.deepPurple,
            body: Center(
              child: SpinKitPouringHourglass(
                color: Colors.white,
              ),
            ),
          )
        : Scaffold(
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
                Expanded(
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
          icon: Icon((_favIconData)),
          onPressed: () {
            setState(() {
              _favIconData =
                  _favIconData.codePoint == Icons.star_border.codePoint
                      ? Icons.star
                      : Icons.star_border;
            });
          },
        ),
      ],
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );
  }

  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////

  Widget _buildCarouselSection() {
    List<CachedNetworkImage> carouselImagesList =
        new List<CachedNetworkImage>();
    for (int i = 0; i < course.img.length; i++) {
      CachedNetworkImage cachedNetworkImage = new CachedNetworkImage(
        imageUrl: course.img[i],
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) =>
            new Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
      );
      carouselImagesList.add(cachedNetworkImage);
    }
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
                    dotSpacing: 15.0,
                    dotPosition: DotPosition.bottomLeft,
                    dotBgColor: Colors.transparent,
                    indicatorBgPadding: 10.0,
                    autoplay: true,
                    images: carouselImagesList,
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
    DateTime localDateTime = course.date.toLocal();
    var formatter = DateFormat('EEEE, dd LLLL, hh a', 'ar');
    String formattedDate = formatter.format(localDateTime);
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('# ${course.interest}'),
          Text(
            course.title,
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
              Text(formattedDate)
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
              Text(course.address)
            ],
          ),
        ],
      ),
    );
  }

  /////////////////////////////////////////////////////
  /////////////////////////////////////////////////////

  Widget _buildTrainerSection() {
    ///////////////////////////////////////////////////////////////////////////
    /// I removed the 's' in the https protocol so I can request on a protected
    /// asset.
    String trainerImgSrc = course.trainerImg.replaceFirst(new RegExp(r's'), '');
    //////////////////////////////////////////////////////////////////////////
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 15.0,
                backgroundImage: CachedNetworkImageProvider(trainerImgSrc),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(width: 10.0),
              Text(course.trainerName,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .apply(fontWeightDelta: 50))
            ],
          ),
          SizedBox(height: 5.0),
          Text(course.trainerInfo),
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
          Text(course.occasionDetail),
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
          _buildAllReservTypes(),
        ],
      ),
    );
  }

  Widget _buildAllReservTypes() {
    List<Widget> reservTypesRows = new List<Widget>();

    for (int i = 0; i < course.reservTypes.length; i++) {
      Widget newRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(course.reservTypes[i].name),
          Text('${course.reservTypes[i].price} SAR')
        ],
      );
      reservTypesRows.add(newRow);
    }
    return Column(
      children: reservTypesRows,
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
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
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
