import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewFullScreen extends GetxController{
   final Uri url = Uri.parse('https://flutter.dev');
  Future<void> _launchUrl() async {

  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}



}