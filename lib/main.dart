import 'package:flutter/material.dart';

//ListView

/*
* ListView是最常用的可滚动组件之一，它可以沿一个方向线性排布所有子组件，并且它也支持列表项懒加载（在需要时才会创建）
* ListView的默认构造函数定义：
* ListView({
  ...
  //可滚动widget公共参数
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  ScrollController? controller,
  bool? primary,
  ScrollPhysics? physics,
  EdgeInsetsGeometry? padding,

  //ListView各个构造函数的共同参数
  double? itemExtent,
  Widget? prototypeItem, //列表项原型，后面解释
  bool shrinkWrap = false,
  bool addAutomaticKeepAlives = true,
  bool addRepaintBoundaries = true,
  double? cacheExtent, // 预渲染区域长度

  //子widget列表
  List<Widget> children = const <Widget>[],
})
*
* 1、itemExtent：该参数如果不为null，则会强制children的“长度”为itemExtent的值;
*
* */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '滚动视图'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    //下划线widget预定义以供复用。
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);

    // return Scaffold(
    //   appBar: AppBar(
    //
    //     title: Text(widget.title),
    //   ),
    //   body: Center(
    //     child: Column(
    //       // mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //
    //       ],
    //     ),
    //   ),
    // );
    return ListView.separated(
      itemCount: 100,
      padding: const EdgeInsets.all(20.0),
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index%2==0?divider1:divider2;
      },
    );
  }
}

/*
*
* "固定资产"科目核算企业固定资产的原价，借方登记企业增加的固定资产原价，贷方登记企业减少的固定资产原价，期末借方余额，反映企业期末固定资产的账面原价。
* 企业应当设置"固定资产登记簿"和"固定资产卡片"，按固定资产类别，使用部门和每项固定资产进行明细核算。
* */