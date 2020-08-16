import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/blocks/about_me.dart';
import 'package:portfolio/components/blocks/contacts_block.dart';
import 'package:portfolio/components/blocks/technologies_block.dart';
import 'package:portfolio/components/development_direction_item.dart';
import 'package:portfolio/components/endDrawer.dart';
import 'package:portfolio/components/nav_button.dart';
import 'package:portfolio/components/techonology_item.dart';
import 'package:portfolio/components/web_scaffold.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/tools/adaptive_padding.dart';

class HomePage extends StatefulWidget {
  final Size screenSize;

  const HomePage({Key key, this.screenSize = const Size(1366, 768)})
      : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final blockItems = [
    BlockNavItem("Services", 0),
    BlockNavItem("Development", 1),
    BlockNavItem("Contacts", 3)
  ];

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  final PageController _scrollController = PageController();

  int currentBlock = 0;

  @override
  initState() {
    _scrollController.addListener(() {
      onScrollPositionChanged();
    });
    super.initState();
  }

  openDrawer() {
    _scaffold.currentState.openEndDrawer();
  }

  onScrollPositionChanged() {
    final _cblock = _scrollController.page.floor();
    if (_cblock != currentBlock &&
        blockItems.any((element) => element.index == _cblock)) {
      setState(() {
        currentBlock = _cblock;
      });
    }
  }

  navigateBlock(int) {
    setState(() {
      currentBlock = int;
    });
    _scrollController.animateToPage(int,
        duration: Duration(milliseconds: 900), curve: Curves.easeOutQuad);
  }

  Widget _buildAppBar(bool wrap) {
    final nav = blockItems
        .map((e) => NavButton(
              text: e.blockName,
              isActive: currentBlock == e.index,
              onPressed: () {
                navigateBlock(e.index);
              },
            ))
        .toList();

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        child: PageScaffold(
          logo: SizedBox(
              width: 38,
              height: 38,
              child: Image.asset('assets/images/logo.png')),
          bgColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 8),
          navigation: wrap
              ? nav
              : [
                  InkWell(
                    child: Icon(Icons.menu, color: Cl.white),
                    onTap: openDrawer,
                  )
                ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.screenSize.width;
    final horizontalPaddingValue =
        AdaptivePadding.getHorizontalPaddingRelativeValue(width, 0.115);
    final verticalPaddingValue = 35.0;
    final blockHeight = widget.screenSize.height - (verticalPaddingValue * 2);
    final padding = EdgeInsets.symmetric(
        vertical: verticalPaddingValue, horizontal: horizontalPaddingValue);
    final nav = blockItems
        .map((e) => NavButton(
              text: e.blockName,
              activeColor: Cl.dark,
              isActive: currentBlock == e.index,
              onPressed: () {
                navigateBlock(e.index);
              },
            ))
        .toList();

    final blocks = [
      Stack(
        children: [
          PageScaffold(
            padding: padding,
            showAppbar: false,
            body: AboutMe(blockHeight: blockHeight),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPaddingValue),
            child: _buildAppBar(width > 1225),
          ),
        ],
      ),
      PageScaffold(
        bgColor: Cl.white,
        padding: padding,
        showAppbar: false,
        body: TechnologiesBlock(
            blockHeight: blockHeight,
            technologies: [
              TechnologyItem(
                image: Image.asset('assets/icons/flutter.png'),
                technology: 'Flutter',
                expierenence: '1.5+ years',
              ),
              TechnologyItem(
                image: Image.asset('assets/icons/angular.png'),
                technology: 'Angular',
                expierenence: '0.5+ years',
              ),
              TechnologyItem(
                image: Image.asset('assets/icons/react.png'),
                technology: 'React',
                expierenence: '0.5+ years',
              )
            ],
            directions: [
              DevelopmentDirectionItem(
                image: Image.asset(
                  'assets/images/cross-mobile.png',
                ),
                title: 'Cross-platform\nApp',
                subtitle: 'Development',
                text:
                    'Create cross-platform native apps with unprecedented code-sharing between different platforms (Android, IOS, etc).',
              ),
              DevelopmentDirectionItem(
                image: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/images/web.png',
                  ),
                ),
                title: 'Front-end\nWeb',
                subtitle: 'Development',
                text:
                    'Develop front-end web applications, including SPA, PWA using standard web technologies, frameworks or libraries.',
              ),
            ],
            title: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text(
                  "Development ",
                  style: TextStyle(
                      color: Cl.dark,
                      fontSize: 26,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "directions",
                  style: TextStyle(
                      color: Cl.dark,
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
            titleHeight: 50.0),
      ),
      PageScaffold(
        bgColor: Cl.dark,
        padding: padding,
        showAppbar: false,
        body: TechnologiesBlock(
          bgColor: Cl.dark,
          blockHeight: blockHeight,
          titleHeight: 0,
          technologies: [
            TechnologyItem(
              image: Image.asset('assets/icons/node.png'),
              technology: 'NodeJS',
              expierenence: '1.5+ years',
              style: ItemStyle(
                  titleColor: Cl.white,
                  subtitleColor: Cl.primaryGray,
                  textColor: Cl.white),
            ),
            TechnologyItem(
              image: Image.asset('assets/icons/firebase.png'),
              technology: 'Firebase',
              expierenence: '1.5+ years',
              style: ItemStyle(
                  titleColor: Cl.white,
                  subtitleColor: Cl.primaryGray,
                  textColor: Cl.white),
            ),
            TechnologyItem(
              image: SizedBox(
                  width: 75, child: Image.asset('assets/icons/asp.png')),
              technology: 'ASP.Net',
              expierenence: '0.5+ years',
              style: ItemStyle(
                  titleColor: Cl.white,
                  subtitleColor: Cl.primaryGray,
                  textColor: Cl.white),
            )
          ],
          directions: [
            DevelopmentDirectionItem(
              image: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/api.png',
                ),
              ),
              style: ItemStyle(
                  titleColor: Cl.white,
                  subtitleColor: Cl.primaryGray,
                  textColor: Cl.white),
              title: 'Web API',
              subtitle: 'Development',
              text:
                  'Develop fast and flexible web APs for your mobile applications or websites.',
            ),
            DevelopmentDirectionItem(
              image: Image.asset(
                'assets/images/serverless_white.png',
              ),
              style: ItemStyle(
                  titleColor: Cl.white,
                  subtitleColor: Cl.primaryGray,
                  textColor: Cl.white),
              title: 'Serverless',
              subtitle: 'Development',
              text:
                  'Reduce development time and costs by using new generation cloud & serverless technologies.',
            ),
          ],
          title: Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Text(
                "Development ",
                style: TextStyle(
                    color: Cl.dark,
                    fontSize: 26,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "directions",
                style: TextStyle(
                    color: Cl.dark,
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      ),
      PageScaffold(
        bgColor: Cl.white,
        padding: padding,
        showAppbar: false,
        body: ContactsBlock(blockHeight: blockHeight),
      ),
    ];

    return Scaffold(
      key: _scaffold,
      backgroundColor: Cl.dark,
      endDrawer:
          EndDrawer(expandedWidth: 360, navigation: nav, bgColor: Cl.white),
      body: Container(
        child: width > 750
            ? PageView(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                children: [...blocks],
              )
            : LiveList(
                showItemDuration: Duration(milliseconds: 0),
                itemCount: blocks.length,
                itemBuilder: (context, index, anim) => blocks[index],
              ),
      ),
    );
  }
}

class BlockNavItem {
  final String blockName;
  final int index;

  BlockNavItem(this.blockName, this.index);
}
