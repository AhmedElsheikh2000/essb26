import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/theme/text_styles.dart';
import '../../../providers/bookmark_provider.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  // Conference Theme Colors
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        title: const Text('My Bookmarks'),
        centerTitle: true,
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
        actions: [
          Consumer<BookmarkProvider>(
            builder: (context, bookmarkProvider, child) {
              if (bookmarkProvider.bookmarks.isEmpty) return const SizedBox();
              
              return PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (value) {
                  if (value == 'clear') {
                    _showClearDialog(context, bookmarkProvider);
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'clear',
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline, color: Colors.red),
                        SizedBox(width: 12),
                        Text('Clear All'),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Consumer<BookmarkProvider>(
        builder: (context, bookmarkProvider, child) {
          final bookmarks = bookmarkProvider.bookmarks;

          if (bookmarks.isEmpty) {
            return _buildEmptyState(context);
          }

          // Group bookmarks by date
          final Map<String, List<dynamic>> groupedBookmarks = {};
          for (var bookmark in bookmarks) {
            if (!groupedBookmarks.containsKey(bookmark.date)) {
              groupedBookmarks[bookmark.date] = [];
            }
            groupedBookmarks[bookmark.date]!.add(bookmark);
          }

          // Sort dates
          final sortedDates = groupedBookmarks.keys.toList()
            ..sort((a, b) => a.compareTo(b));

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sortedDates.length + 1, // +1 for header
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildHeader(bookmarks.length);
              }

              final dateIndex = index - 1;
              final date = sortedDates[dateIndex];
              final dateBookmarks = groupedBookmarks[date]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (dateIndex > 0) const SizedBox(height: 24),
                  _buildDateHeader(date, dateBookmarks.length),
                  const SizedBox(height: 12),
                  ...dateBookmarks.map((bookmark) {
                    return Column(
                      children: [
                        _buildBookmarkCard(
                          context,
                          bookmark,
                          bookmarkProvider,
                        ),
                        const SizedBox(height: 12),
                      ],
                    );
                  }),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: primaryPurple.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.bookmark_border,
              size: 80,
              color: primaryPurple,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'No Bookmarks Yet',
            style: AppTextStyles.h3.copyWith(
              color: darkText,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              'Save your favorite sessions and topics from the program',
              style: AppTextStyles.bodyMedium.copyWith(
                color: accentPurple,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryPurple,
              foregroundColor: whiteColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.event_note),
            label: const Text('Browse Program'),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(int count) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryPurple.withOpacity(0.1), accentPurple.withOpacity(0.1)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: primaryPurple.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primaryPurple.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.bookmark,
              color: primaryPurple,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saved Items',
                  style: AppTextStyles.h4.copyWith(
                    color: darkText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$count bookmark${count != 1 ? 's' : ''}',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: accentPurple,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateHeader(String date, int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: primaryPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.calendar_today, size: 16, color: primaryPurple),
          const SizedBox(width: 8),
          Text(
            date,
            style: AppTextStyles.bodyMedium.copyWith(
              color: primaryPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: primaryPurple,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$count',
              style: AppTextStyles.caption.copyWith(
                color: whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookmarkCard(
    BuildContext context,
    dynamic bookmark,
    BookmarkProvider bookmarkProvider,
  ) {
    final isSession = bookmark.type == 'session';
    final iconData = isSession ? Icons.event_note : Icons.topic;
    final color = isSession ? primaryPurple : accentPurple;

    return Dismissible(
      key: Key(bookmark.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        bookmarkProvider.removeBookmark(bookmark.itemId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Bookmark removed'),
            backgroundColor: primaryPurple,
            action: SnackBarAction(
              label: 'UNDO',
              textColor: whiteColor,
              onPressed: () {
                bookmarkProvider.toggleBookmark(
                  itemId: bookmark.itemId,
                  type: bookmark.type,
                  title: bookmark.title,
                  date: bookmark.date,
                  time: bookmark.time,
                );
              },
            ),
          ),
        );
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 32,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(iconData, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          bookmark.type.toUpperCase(),
                          style: AppTextStyles.caption.copyWith(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark, color: primaryPurple),
                  onPressed: () {
                    bookmarkProvider.removeBookmark(bookmark.itemId);
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              bookmark.title,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 14, color: accentPurple),
                const SizedBox(width: 4),
                Text(
                  bookmark.time,
                  style: AppTextStyles.caption.copyWith(
                    color: accentPurple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showClearDialog(BuildContext context, BookmarkProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Clear All Bookmarks?',
          style: AppTextStyles.h4.copyWith(
            color: darkText,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'This will remove all your saved sessions and topics. This action cannot be undone.',
          style: AppTextStyles.bodyMedium.copyWith(
            color: accentPurple,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: accentPurple),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              provider.clearAll();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('All bookmarks cleared'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: whiteColor,
            ),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }
}