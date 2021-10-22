// 可滚动组件是非常重要的一类组件
//6.1 可滚动组件简介

/**
 * Flutter 中有两种布局模型：
 *  1、基于RenderBox的盒模型布局。
 *  2、基于Sliver(RenderSliver)按需加载列表布局。
 *
 * 通常可滚动组件的子组件可能会非常多、占用的总高度也会非常大;
 * 如果要一次性将子组件全部构建出将会非常昂贵！为此，Flutter中提出一个Sliver（中文为“薄片”的意思）概念，Sliver 可以包含一个或多个子组件。
 * Sliver 的主要作用是配合：加载子组件并确定每一个子组件的布局和绘制信息，如果Sliver可以包含多个子组件时，通常会实现按需加载模型。
 *
 * 只有当Sliver出现在视口中时才会去构建它，这种模型也称为“基于Sliver的列表按需加载模型”。
 * 可滚动组件中有很多都支持基于Sliver的按需加载模型，如ListView、GridView，但是也有不支持该模型的，如SingleChildScrollView。
 *
 * */
/*
* 约定：后面如果我们说一个组件是Sliver则表示它是基于Sliver布局的组件，
* 同理，说一个组件是 RenderBox，则代表它是基于盒模型布局的组件，并不是说它就是 RenderBox 类的实例。
*
* */

/**
 *
 * Flutter 中的可滚动主要由三个角色组成：Scrollable、Viewport 和 Sliver：
 * Scrollable ：用于处理滑动手势，确定滑动偏移，滑动偏移变化时构建 Viewport 。
 * Viewport：显示的视窗，即列表的可视区域；
 * Sliver：视窗里显示的元素。
 *
 * 具体布局过程：
 * 1、Scrollable 监听到用户滑动行为后，根据最新的滑动偏移构建 Viewport。
 * 2、Viewport 将当前视口信息和配置信息通过 SliverConstraints 传递给 Sliver。
 * 3、Sliver 中对子组件（RenderBox）按需进行构建和布局，然后确认自身的位置、绘制等信息，保存在geometry中（一个SliverGeometry 类型的对象）。
 *
 *
 * **/

//Scrollable
/*
*  Scrollable
* 用于处理滑动手势，确定滑动偏移，滑动偏移变化时构建 Viewport，我们看一下其关键的属性：
* Scrollable({
  ...
  this.axisDirection = AxisDirection.down,
  this.controller,
  this.physics,
  required this.viewportBuilder, //后面介绍
})
*
* 1、axisDirection 滚动方向。
* 2、physics：此属性接受一个ScrollPhysics类型的对象，它决定可滚动组件如何响应用户操作，比如用户滑动完抬起手指后，继续执行动画；
* 3、controller：此属性接受一个ScrollController对象。ScrollController的主要作用是控制滚动位置和监听滚动事件。
* Widget树中会有一个默认的PrimaryScrollController，如果子树中的可滚动组件没有显式的指定controller，
* 并且primary属性值为true时（默认就为true），可滚动组件会使用这个默认的PrimaryScrollController。
* 这种机制带来的好处是父组件可以控制子树中可滚动组件的滚动行为，
* 例如，Scaffold正是使用这种机制在iOS中实现了点击导航栏回到顶部的功能。我们将在本章后面“滚动控制”一节详细介绍ScrollController。
* 4、viewportBuilder：构建Viewport的回调。当用户滑动时，Scrollable会调用此回调构建新的Viewport，
* 同时传递一个ViewportOffset类型的 offset 参数，该参数描述 Viewport 应该显示那一部分内容。
* 注意重新构建Viewport并不是一个昂贵的操作，应为 Viewport 本身也是 Widget，只是配置信息，
* Viewport 变化时对应的 RenderViewport 会更新信息，并不会随着 Widget 进行重新构建。
*
*
* "累计折旧"科目属于"固定资产"的调整科目，核算企业固定资产的累计折旧，货方登记企业计提的固定资产折旧，借方登记处置固定资产转出的累计折旧，期未贷方
余额，反映企业固定资产的累计折旧额。
* */


/**
 * 主轴和纵轴
 *
 * 在可滚动组件的坐标描述中，通常将滚动方向称为主轴，非滚动方向称为纵轴。
 * 由于可滚动组件的默认方向一般都是沿垂直方向，所以默认情况下主轴就是指垂直方向，水平方向同理。
 *
 **/


/*
*  6.2 SingleChildScrollView
*  SingleChildScrollView类似于Android中的ScrollView，它只能接收一个子组件，定义如下：
* SingleChildScrollView({
  this.scrollDirection = Axis.vertical, //滚动方向，默认是垂直方向
  this.reverse = false,
  this.padding,
  bool primary,
  this.physics,
  this.controller,
  this.child,
})
*
* primary属性:它表示是否使用widget树中默认的PrimaryScrollController(MaterialApp组件树中已经默认包含一个PrimaryScrollController了);
* 当滑动方向为垂直方向（scrollDirection值为Axis.vertical）并且没有指定controller时，primary默认为true。
* 需要注意的是，通常SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用，这是因为SingleChildScrollView不支持基于 Sliver 的延迟加载模型，
* 所以如果预计视口可能包含超出屏幕尺寸太多的内容时，那么使用SingleChildScrollView将会非常昂贵（性能差），此时应该使用一些支持Sliver延迟加载的可滚动组件，如ListView。
*
* */






