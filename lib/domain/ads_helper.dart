import 'dart:io';

class AdHelper {
  static String get apId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9483658528214202~2409933776";
    } else if (Platform.isIOS) {
      return "ca-app-pub- ";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9483658528214202/4442831056";
    } else if (Platform.isIOS) {
      return "ca-app-pub-  ";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/8691691433";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/5135589807";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}