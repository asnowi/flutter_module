import 'package:flutter/material.dart';
import 'package:flutter_module/common/utils/assets_provider.dart';
import 'package:flutter_module/common/utils/index.dart';
import 'package:flutter_module/common/widget/tab/custom_circular_rect_angle.dart';
import 'package:flutter_module/pages/any/any_view.dart';
import 'package:flutter_module/pages/fly/fly_view.dart';
import 'package:flutter_module/pages/mine/mine_view.dart';
import 'package:flutter_module/pages/star/star_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin{

  int _currentIndex = 0;
  late PageController _pageController;

  List<Widget> _pageList = [
    AnyView(),
    StarView(),
    FlyView(),
    MineView()
  ];

  List<String> textList= [
    '首页',
    '话题',
    '消息',
    '我的',
  ];

  List<String> defaultIcon =[
    AssetsProvider.imagePath('tab_icon_shouye_default'),
    AssetsProvider.imagePath('tab_icon_huati_default'),
    AssetsProvider.imagePath('tab_icon_tujian_default'),
    AssetsProvider.imagePath('tab_icon_wode_default')
  ];

  List<String> selectedIcon =[
    AssetsProvider.imagePath('tab_icon_shouye_selected'),
    AssetsProvider.imagePath('tab_icon_huati_selected'),
    AssetsProvider.imagePath('tab_icon_tujian_selected'),
    AssetsProvider.imagePath('tab_icon_wode_selected')
  ];


  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        resizeToAvoidBottomInset: false,
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: _pageList,
            onPageChanged: (page) {
            }
        ),
        bottomNavigationBar: _buildBottomAppBar(context),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: _buildFloatingActionButton(context)
    );
  }



  Widget _buildFloatingActionButton(BuildContext context){
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                radius: .3,
                colors: [
                  Colors.yellowAccent,
                  Theme.of(context).accentColor,
                ]),
            borderRadius: BorderRadius.circular(18)),
        width: 36,
        height: 36,
        child: Icon(Iconfont.floating,color: Colors.white,size: 20),
      ),
      onTap: (){

      },
    );
  }


  BottomAppBar _buildBottomAppBar(BuildContext context) {
    // final double itemWidth = getWidth()/5;
    final double itemWidth = getWidth()/4;
    return BottomAppBar(
      elevation: 6,
      notchMargin: 6.0,
      color: Colors.white,
      shape: CustomCircularNotchedRectangle(),
      // color: Colors.white,
      // shape: CircularNotchedRectangle(),
      child: Row(
        children: [
          SizedBox(height: 48, width: itemWidth, child: _buildItemBar(0)),
          SizedBox(height: 48, width: itemWidth, child: _buildItemBar(1)),
          // SizedBox(height: 48, width: itemWidth, child: Container()),
          SizedBox(height: 48, width: itemWidth, child: _buildItemBar(2)),
          SizedBox(height: 48, width: itemWidth, child: _buildItemBar(3)),
        ],
      ),
    );
  }


  Widget _buildItemBar(int index){
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(48),
        splashColor: Theme.of(context).accentColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(_currentIndex == index? selectedIcon[index]: defaultIcon[index],width: 18,height: 18,),
            Padding(padding: EdgeInsets.only(top: 2)),
            Text(textList[index],style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'FZDaLTJ',
                color: _currentIndex == index? Colors.redAccent:Colors.grey
            ))
          ],
        ),
        onTap: () {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(_currentIndex,
                curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 260));
          });
        },
      ),
    );
  }

  @override
  // 是否缓存tab页面数据
  bool get wantKeepAlive => false;
}
