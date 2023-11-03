import 'package:kitakerja/models/response/Terminal/ListTerminalResponse.dart';

abstract class ListTerminal{
  Future<ListTerminalResponse>listTerminal();
}