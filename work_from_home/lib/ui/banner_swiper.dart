
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<SwiperPage> {
  // Generate dialog

  List<String> bannerDatas = List();
  SwiperController _swiperController;

  @override
  void initState() {
    super.initState();

    bannerDatas.add("https://www.wanandroid.com/blogimgs/ade5fbf7-57d7-4fec-ad02-402dcf12acd2.jpeg");
    bannerDatas.add("https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png");
    bannerDatas.add("https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png");
    bannerDatas.add("https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png");

    _swiperController = SwiperController();
    _swiperController.startAutoplay();

  }


  @override
  void dispose() {
    _swiperController.stopAutoplay();
    _swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Using  Swiper"),
        ),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>
          [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Colors.blue,
                  child: Text("AlertDialog"),
                  onPressed: (){
                    showAlertDialog(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                getBanner(),
              ],
            )
          ],
        )
    )
    ;
  }


  Widget getBanner() {
    return Container(
      width: MediaQuery.of(context).size.width,
      //1.8是banner宽高比，0.8是viewportFraction的值
      height: MediaQuery.of(context).size.width / 1.8 * 0.8,
      padding: EdgeInsets.only(top: 10),
      child: Swiper(
        itemCount: bannerDatas.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((10.0)), // 圆角度
              image: DecorationImage(
                image: NetworkImage(bannerDatas[index]),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        loop: true,
        autoplay: false,
        autoplayDelay: 3000,
        //触发时是否停止播放
        autoplayDisableOnInteraction: true,
        duration: 600,
        //默认分页按钮
//        control: SwiperControl(),
        controller: _swiperController,
        //默认指示器
        pagination: SwiperPagination(
          // SwiperPagination.fraction 数字1/5，默认点
          builder: DotSwiperPaginationBuilder(size: 6, activeSize: 9),
        ),

        //视图宽度，即显示的item的宽度屏占比
        viewportFraction: 0.8,
        //两侧item的缩放比
        scale: 0.9,

        onTap: (int index) {
          //点击事件，返回下标
          print("index-----" + index.toString());
        },
      ),
    );
  }


}

void showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) =>
      new AlertDialog(
          title: new Text("Dialog Title"),
          content: new Text("This is my content"),
          actions: <Widget>[
            new FlatButton(child: new Text("CANCEL"), onPressed: () {
              Navigator.of(context).pop();
            },),
            new FlatButton(child: new Text("OK"), onPressed: () {
              Navigator.of(context).pop();
            },)
          ]

      ));
}


