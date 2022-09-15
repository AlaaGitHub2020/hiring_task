import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiring_task/domain/core/utilities/config.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/injection.dart';
import 'package:hiring_task/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

final log = getLogger();

void main() async {
  try {
    log.i("main Started ");
    await appConfiguration();
    runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const AppWidget(),
      ),
    );
  } catch (e) {
    log.e("ERROR:$e");
  }
}

Future<void> appConfiguration() async {
  try {
    log.i("appConfiguration Started ");
    WidgetsFlutterBinding.ensureInitialized();
    addFontLicense();

    prepareTheLogger();
    await Config().load();
    await configureInjection(Environment.prod);
  } catch (e) {
    log.e("ERROR:$e");
  }
}

void addFontLicense() {
  try {
    log.i("addFontLicense Started ");
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
  } catch (e) {
    log.e("ERROR:$e");
  }
}

void prepareTheLogger() {
  try {
    log.i("prepareTheLogger Started ");
    if (kReleaseMode) {
      Logger.level = Level.info;
    } else {
      Logger.level = Level.debug;
    }
  } catch (e) {
    log.e("ERROR:$e");
  }
}
