part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onBackButtonPresses;
  final Widget child;
  final Color backColor;

  GeneralPage(
      {this.title = "Title",
      this.subtitle = "subtitle",
      this.onBackButtonPresses,
      this.child,
      this.backColor});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        SafeArea(
          child: Container(
            color: backColor ?? Colors.white,
          ),
        ),
        ListView(
          children: [
            Column(
              children: [
                Container(
                  //margin: EdgeInsets.only(bottom: defaultMargin),
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      onBackButtonPresses != null
                          ? GestureDetector(
                              onTap: () {
                                if (onBackButtonPresses != null) {
                                  onBackButtonPresses();
                                }
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                margin: EdgeInsets.only(right: 26),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/back_arrow.png'))),
                              ),
                            )
                          : SizedBox(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.poppins(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            subtitle,
                            style: GoogleFonts.poppins(
                                color: "8D92A3".toColor(),
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: defaultMargin,
                  width: double.infinity,
                  color: "FAFAFC".toColor(),
                ),
                child ?? SizedBox(),
                //Text('data')
              ],
            )
          ],
        )
      ],
    ));
  }
}
