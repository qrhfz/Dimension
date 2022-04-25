import 'dart:async';
import 'dart:isolate';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html2md/html2md.dart';
import 'package:async/async.dart';

final htmlMDConverterProvider = Provider((_) => HtmlMDConverter());

class HtmlMDConverter {
  static final p = ReceivePort();
  static StreamQueue<dynamic>? events;
  static SendPort? sendPort;
  late Future _doneFuture;

  HtmlMDConverter() {
    _doneFuture = _init();
  }

  Future _init() async {
    await Isolate.spawn(_convert2MD, p.sendPort);
    events = StreamQueue<dynamic>(p);

    sendPort = await events?.next;
  }

  Future<String> sendAndReceive(String html) async {
    await _doneFuture;
    sendPort?.send(html);

    final message = await events?.next;

    return message;
  }

  static Future<void> _convert2MD(SendPort p) async {
    final commandPort = ReceivePort();
    p.send(commandPort.sendPort);

    await for (final message in commandPort) {
      if (message is String) {
        p.send(convert(message));
      } else if (message == null) {
        break;
      }
    }

    Isolate.exit();
  }

  void dispose() async {
    sendPort?.send(null);

    await events?.cancel();
  }
}
