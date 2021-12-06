import 'package:logger/logger.dart';

late Logger myLogger;

readyForLogger(){
  myLogger = Logger (
    printer: PrettyPrinter (
      methodCount: 2,       // Number of method calls to be displayed
      errorMethodCount: 8,  // Number of method calls if stacktrace is provided
      lineLength: 120,      // width of the output
      colors: true,         // Colorful log nessages
      printEmojis: true,    // Print an emoji for each log message
      printTime: false,     // Should each log print contain a timestamp
    ),
  );
}