import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/program_models.dart';

class BookmarkProvider extends ChangeNotifier {
  List<Bookmark> _bookmarks = [];
  static const String _storageKey = 'conference_bookmarks';

  List<Bookmark> get bookmarks => _bookmarks;

  BookmarkProvider() {
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? bookmarksJson = prefs.getString(_storageKey);
      
      if (bookmarksJson != null) {
        final List<dynamic> decoded = json.decode(bookmarksJson);
        _bookmarks = decoded
            .map((item) => Bookmark.fromMap(item as Map<String, dynamic>))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading bookmarks: $e');
    }
  }

  Future<void> _saveBookmarks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encoded = json.encode(
        _bookmarks.map((b) => b.toMap()).toList(),
      );
      await prefs.setString(_storageKey, encoded);
    } catch (e) {
      debugPrint('Error saving bookmarks: $e');
    }
  }

  bool isBookmarked(String itemId) {
    return _bookmarks.any((b) => b.itemId == itemId);
  }

  Future<void> toggleBookmark({
    required String itemId,
    required String type,
    required String title,
    required String date,
    required String time,
  }) async {
    final index = _bookmarks.indexWhere((b) => b.itemId == itemId);
    
    if (index >= 0) {
      // Remove bookmark
      _bookmarks.removeAt(index);
    } else {
      // Add bookmark
      final bookmark = Bookmark(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: type,
        itemId: itemId,
        title: title,
        date: date,
        time: time,
        createdAt: DateTime.now(),
      );
      _bookmarks.add(bookmark);
    }
    
    notifyListeners();
    await _saveBookmarks();
  }

  Future<void> removeBookmark(String itemId) async {
    _bookmarks.removeWhere((b) => b.itemId == itemId);
    notifyListeners();
    await _saveBookmarks();
  }

  Future<void> clearAll() async {
    _bookmarks.clear();
    notifyListeners();
    await _saveBookmarks();
  }

  List<Bookmark> getBookmarksByDate(String date) {
    return _bookmarks.where((b) => b.date == date).toList();
  }

  List<Bookmark> getBookmarksByType(String type) {
    return _bookmarks.where((b) => b.type == type).toList();
  }
}