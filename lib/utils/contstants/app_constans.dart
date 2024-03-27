class AppConstants {
  static RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  static RegExp passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  static RegExp textRegExp = RegExp("[a-zA-Z]");
  static RegExp phoneRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

  static String clientID = "699471060311-boktfei0alnfbjc140gako8vvncn4opj.apps.googleusercontent.com";

  static String categories = "categories";
  static String products = "products";
  static String key = "AAAAgJtLgyk:APA91bFAvJXNxtScO-oOReMv_86xFXt4mi_dvt4fLUYN2rAujjJneQUpmzXKDp3osuC-do8BRBVQ_5Z40wnzzuCdbVvcyd-8e42FGSNG4bfXvt048e-B76uNGdLzbcgiL2t-Rnm-VPr7";
}