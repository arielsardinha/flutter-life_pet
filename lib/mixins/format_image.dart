import 'dart:io';
import 'dart:typed_data';

mixin FormatImageMixin {
  Uint8List convertImageUint8List(File file) {
    return File(file.path).readAsBytesSync();
  }
}
