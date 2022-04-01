import 'package:flutter/material.dart';

class AdCard extends StatelessWidget {
  const AdCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var adBanner = BannerAd(
    //   // TODO: Create actual IDs
    //   adUnitId: 'ca-app-pub-3940256099942544/2934735716', // TEST AD ID
    //   // adUnitId: Platform.isIOS
    //   //     ? 'ca-app-pub-8911581163547766/3745890500' // ca-app-pub-8911581163547766~5659422189
    //   //     : 'ca-app-pub-8911581163547766/3772142369', // ca-app-pub-8911581163547766~1043705548
    //   size: AdSize.banner,
    //   request: AdRequest(),
    //   listener: BannerAdListener(),
    // );

    // adBanner.load();

    // return Container(
    //   alignment: Alignment.center,
    //   child: AdWidget(ad: adBanner),
    //   width: adBanner.size.width.toDouble(),
    //   height: adBanner.size.height.toDouble(),
    // );
    return Container(
      height: 20,
      color: Colors.grey,
    );
  }
}
