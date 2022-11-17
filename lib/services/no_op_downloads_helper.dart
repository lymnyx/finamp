import 'package:flutter_downloader/src/models.dart';
import 'package:flutter/src/foundation/change_notifier.dart';

import 'package:finamp/models/jellyfin_models.dart';

import 'package:finamp/models/finamp_models.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dart:io';

import 'downloads_helper.dart';

class NoOpDownloadsHelper implements DownloadsHelper {
  @override
  List<String> queue = [];
  final _downloadedItemsBox = Hive.box<DownloadedSong>("DownloadedItems");

  @override
  void addDownloadedSong(DownloadedSong newDownloadedSong) {}

  @override
  Future<void> addDownloads(
      {required List<BaseItemDto> items,
      required BaseItemDto parent,
      required bool useHumanReadableNames,
      required DownloadLocation downloadLocation,
      required String viewId}) async {}

  @override
  Future<void> deleteDownloads(
      {required List<String> jellyfinItemIds, String? deletedFor}) async {}

  @override
  Future<int> downloadMissingImages() async {
    return 0;
  }

  @override
  // TODO: implement downloadedImages
  Iterable<DownloadedImage> get downloadedImages => const Iterable.empty();

  @override
  // TODO: implement downloadedItems
  Iterable<DownloadedSong> get downloadedItems => const Iterable.empty();

  @override
  // TODO: implement downloadedParents
  Iterable<DownloadedParent> get downloadedParents => const Iterable.empty();

  @override
  Future<int> getDirSize(Directory directory) async {
    return 0;
  }

  @override
  Future<List<DownloadTask>?> getDownloadStatus(List<String> itemIds) async {
    return List.empty();
  }

  @override
  DownloadedImage? getDownloadedImage(BaseItemDto item) {
    return null;
  }

  @override
  DownloadedImage? getDownloadedImageFromDownloadId(String downloadId) {
    return null;
  }

  // TODO - find a way to no op this
  @override
  ValueListenable<Box<DownloadedSong>> getDownloadedItemsListenable(
          {List<String>? keys}) =>
      _downloadedItemsBox.listenable(keys: keys);

  @override
  DownloadedParent? getDownloadedParent(String id) {
    return null;
  }

  @override
  DownloadedSong? getDownloadedSong(String id) {
    return null;
  }

  @override
  Future<List<DownloadTask>?> getDownloadsWithStatus(
      DownloadTaskStatus downloadTaskStatus) async {
    return null;
  }

  @override
  Future<List<DownloadTask>?> getIncompleteDownloads() async {
    return null;
  }

  @override
  DownloadedSong? getJellyfinItemFromDownloadId(String downloadId) {
    return null;
  }

  @override
  bool isAlbumDownloaded(String albumId) {
    return false;
  }

  @override
  Future<int> redownloadFailed() async {
    return 0;
  }

  @override
  Future<bool> verifyDownloadedImage(DownloadedImage downloadedImage) async {
    return true;
  }

  @override
  Future<bool> verifyDownloadedSong(DownloadedSong downloadedSong) async {
    return true;
  }
}
