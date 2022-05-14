import 'package:flutter/widgets.dart';
import 'package:prayer_hotspot/app/app.dart';
import 'package:prayer_hotspot/home/home.dart';
import 'package:prayer_hotspot/login/login.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
