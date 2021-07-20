import 'dart:io';
import 'dart:typed_data';

import 'package:mime/mime.dart';

import '../models/chat_message.dart';

bool isTxtFile(String? filePath,
    {Uint8List? fileBytes, bool ignorePath = false}) {
  try {
    final filePathReferenced = ignorePath ? '' : filePath ?? '';
    final mime = lookupMimeType(filePathReferenced, headerBytes: fileBytes);
    if (mime != null) return mime.contains('text/plain');
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}

bool isZipFile(String? filePath,
    {Uint8List? fileBytes, bool ignorePath = false}) {
  try {
    final filePathReferenced = ignorePath ? '' : filePath ?? '';
    final mime = lookupMimeType(filePathReferenced, headerBytes: fileBytes);
    if (mime != null) return mime.contains('application/zip');
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}

bool isImageFile(String? filePath,
    {Uint8List? fileBytes, bool ignorePath = false}) {
  try {
    final filePathReferenced = ignorePath ? '' : filePath ?? '';
    final mime = lookupMimeType(filePathReferenced, headerBytes: fileBytes);
    if (mime != null) return mime.contains('image');
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}

bool isVideoFile(String? filePath,
    {Uint8List? fileBytes, bool ignorePath = false}) {
  try {
    final filePathReferenced = ignorePath ? '' : filePath ?? '';
    final mime = lookupMimeType(filePathReferenced, headerBytes: fileBytes);
    if (mime != null) return mime.contains('video');
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}

bool isAudioFile(String? filePath,
    {Uint8List? fileBytes, bool ignorePath = false}) {
  try {
    final filePathReferenced = ignorePath ? '' : filePath ?? '';
    final mime = lookupMimeType(filePathReferenced, headerBytes: fileBytes);
    if (mime != null) return mime.contains('audio');
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}

AttachmentType? determineAttachmentType(File? file) {
  if (file != null) {
    if (isImageFile(file.path)) {
      return AttachmentType.image;
    } else if (isAudioFile(file.path)) {
      return AttachmentType.audio;
    } else if (isVideoFile(file.path)) {
      return AttachmentType.video;
    }
    return AttachmentType.other;
  }
  return null;
}
