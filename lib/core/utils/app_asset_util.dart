import 'package:mico_learn/core/theme/app_asset.dart';

class AppAssetUtil {
  static String getRiveAsset(String riveName) {
    switch (riveName) {
      case 'pengantar-paket':
        return AppAsset.pengantarPaket;
      case 'belajar-menyulam':
        return AppAsset.belajarMenyulam;
      case 'mengisi-ember':
        return AppAsset.mengisiEmber;
      case 'teka-teki-hitungan':
        return AppAsset.tekaTekiHitungan;
      default:
        return '';
    }
  }
}
