// import 'package:fz_cyber_quiz/test_01/domain/ads_helper.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// const int maxFailedLoadAttempts = 3;

// final _inlineAdIndex = 3;

// int _interstitialLoadAttempts = 0;

// late BannerAd bottomBannerAd;
// late BannerAd inlineBannerAd;
// InterstitialAd? interstitialAd;

// int getListViewItemIndex(int index, {isInlineBannerAdLoaded}) {
//   if (index >= _inlineAdIndex && isInlineBannerAdLoaded) {
//     return index - 1;
//   }
//   return index;
// }

// void createBottomBannerAd({required listener}) {
//   bottomBannerAd = BannerAd(
//       adUnitId: AdHelper.bannerAdUnitId,
//       size: AdSize.banner,
//       request: AdRequest(),
//       listener: listener);
//   bottomBannerAd.load();
// }

// void createInlineBannerAd({required listener}) {
//   inlineBannerAd = BannerAd(
//       adUnitId: AdHelper.bannerAdUnitId,
//       size: AdSize.mediumRectangle,
//       request: AdRequest(),
//       listener: listener);
//   inlineBannerAd.load();
// }

// void createInterstitialAd() {
//   InterstitialAd.load(
//       adUnitId: AdHelper.interstitialAdUnitId,
//       request: AdRequest(),
//       adLoadCallback:
//           InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
//         interstitialAd = ad;
//         _interstitialLoadAttempts = 0;
//       }, onAdFailedToLoad: (LoadAdError error) {
//         _interstitialLoadAttempts += 1;
//         interstitialAd = null;
//         if (_interstitialLoadAttempts <= maxFailedLoadAttempts) {
//           createInterstitialAd();
//         }
//       }));
// }

// void showInterstitialAd() {
//   if (interstitialAd != null) {
//     interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//         onAdDismissedFullScreenContent: (InterstitialAd ad) {
//       ad.dispose();
//       createInterstitialAd();
//     }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//       ad.dispose();
//       createInterstitialAd();
//     });
//     interstitialAd!.show();
//   }
// }
