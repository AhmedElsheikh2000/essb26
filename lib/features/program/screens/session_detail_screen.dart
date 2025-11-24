import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/theme/text_styles.dart';
import '../../../models/program_models.dart';
import '../../../providers/bookmark_provider.dart';

class SessionDetailScreen extends StatelessWidget {
  final Session session;
  final String date;

  const SessionDetailScreen({
    super.key,
    required this.session,
    required this.date,
  });

  // Conference Theme Colors
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = Provider.of<BookmarkProvider>(context);
    final isBookmarked = bookmarkProvider.isBookmarked(session.id);

    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        title: const Text('Session Details'),
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            ),
            onPressed: () {
              bookmarkProvider.toggleBookmark(
                itemId: session.id,
                type: 'session',
                title: session.title,
                date: date,
                time: '${session.startTime} - ${session.endTime}',
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),

            const SizedBox(height: 16),

            // Session Info
            _buildSessionInfo(),

            const SizedBox(height: 16),

            // Description
            if (session.description != null && session.description!.isNotEmpty)
              _buildDescription(),

            // Topics
            if (session.topics.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildTopicsSection(context, bookmarkProvider),
            ],

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryPurple, accentPurple],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            session.title,
            style: AppTextStyles.h3.copyWith(
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: whiteColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              session.type.toUpperCase(),
              style: AppTextStyles.caption.copyWith(
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: primaryPurple.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoRow(Icons.calendar_today, 'Date', date),
          const SizedBox(height: 12),
          _buildInfoRow(
            Icons.access_time,
            'Time',
            '${session.startTime} - ${session.endTime}',
          ),
          if (session.location != null) ...[
            const SizedBox(height: 12),
            _buildInfoRow(Icons.location_on, 'Location', session.location!),
          ],
          if (session.chairperson != null) ...[
            const SizedBox(height: 12),
            _buildInfoRow(Icons.person, 'Chairperson', session.chairperson!),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: primaryPurple.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: primaryPurple, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.caption.copyWith(
                  color: accentPurple,
                ),
              ),
              Text(
                value,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: darkText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: primaryPurple.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: AppTextStyles.h4.copyWith(
              color: darkText,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            session.description!,
            style: AppTextStyles.bodyMedium.copyWith(
              color: accentPurple,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicsSection(
    BuildContext context,
    BookmarkProvider bookmarkProvider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.topic, color: primaryPurple, size: 24),
              const SizedBox(width: 8),
              Text(
                'Topics',
                style: AppTextStyles.h4.copyWith(
                  color: darkText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: primaryPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${session.topics.length}',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: primaryPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: session.topics.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final topic = session.topics[index];
            return _buildTopicCard(topic, bookmarkProvider);
          },
        ),
      ],
    );
  }

  Widget _buildTopicCard(Topic topic, BookmarkProvider bookmarkProvider) {
    final isBookmarked = bookmarkProvider.isBookmarked(topic.id);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: accentPurple.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: accentPurple.withOpacity(0.08),
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
              Expanded(
                child: Text(
                  topic.title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked ? primaryPurple : accentPurple,
                  size: 20,
                ),
                onPressed: () {
                  bookmarkProvider.toggleBookmark(
                    itemId: topic.id,
                    type: 'topic',
                    title: topic.title,
                    date: date,
                    time: '${topic.startTime} - ${topic.endTime}',
                  );
                },
              ),
            ],
          ),

          if (topic.description != null && topic.description!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              topic.description!,
              style: AppTextStyles.bodySmall.copyWith(
                color: accentPurple,
                height: 1.5,
              ),
            ),
          ],

          const SizedBox(height: 12),

          Row(
            children: [
              Icon(Icons.access_time, size: 14, color: accentPurple),
              const SizedBox(width: 4),
              Text(
                '${topic.startTime} - ${topic.endTime}',
                style: AppTextStyles.caption.copyWith(
                  color: accentPurple,
                ),
              ),
              if (topic.location != null) ...[
                const SizedBox(width: 12),
                Icon(Icons.location_on, size: 14, color: accentPurple),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    topic.location!,
                    style: AppTextStyles.caption.copyWith(
                      color: accentPurple,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),

          if (topic.speakers.isNotEmpty) ...[
            const SizedBox(height: 16),
            ...topic.speakers.map((speaker) => _buildSpeakerItem(speaker)),
          ],
        ],
      ),
    );
  }

  Widget _buildSpeakerItem(Speaker speaker) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: primaryPurple.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: primaryPurple.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              color: primaryPurple,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  speaker.name,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
                Text(
                  speaker.title,
                  style: AppTextStyles.caption.copyWith(
                    color: accentPurple,
                  ),
                ),
                if (speaker.affiliation != null)
                  Text(
                    speaker.affiliation!,
                    style: AppTextStyles.caption.copyWith(
                      color: accentPurple.withOpacity(0.8),
                      fontSize: 10,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}