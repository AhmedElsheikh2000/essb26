import 'package:flutter/material.dart';
import '../../../config/theme/text_styles.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  // Conference Theme Colors
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;
  static const Color goldColor = Color(0xFFD4AF37);

  @override
  Widget build(BuildContext context) {
    // Sample gallery categories
    final categories = [
      {
        'title': 'Conference Days',
        'subtitle': 'Main sessions & presentations',
        'icon': Icons.event,
        'color': primaryPurple,
        'count': 'Coming Soon',
      },
      {
        'title': 'Workshops',
        'subtitle': 'Hands-on training sessions',
        'icon': Icons.work_outline,
        'color': accentPurple,
        'count': 'Coming Soon',
      },
      {
        'title': 'Speakers',
        'subtitle': 'Faculty & guest speakers',
        'icon': Icons.people,
        'color': goldColor,
        'count': 'Coming Soon',
      },
      {
        'title': 'Social Events',
        'subtitle': 'Gala dinner & networking',
        'icon': Icons.celebration,
        'color': Color(0xFFE91E63),
        'count': 'Coming Soon',
      },
      {
        'title': 'Venue',
        'subtitle': 'Cairo Marriott Hotel',
        'icon': Icons.location_city,
        'color': Color(0xFF2196F3),
        'count': 'Coming Soon',
      },
      {
        'title': 'Awards Ceremony',
        'subtitle': 'Recognition & achievements',
        'icon': Icons.emoji_events,
        'color': Color(0xFF4CAF50),
        'count': 'Coming Soon',
      },
    ];

    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        centerTitle: true,
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryPurple, accentPurple],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: primaryPurple.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: whiteColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.photo_library,
                      size: 60,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Conference Moments',
                    style: AppTextStyles.h2.copyWith(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Photos will be available during and after the conference',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: whiteColor.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Info Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: primaryPurple.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: primaryPurple, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Check back during the conference for live updates!',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: darkText,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Categories Title
            Text(
              'Gallery Categories',
              style: AppTextStyles.h3.copyWith(
                color: darkText,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Gallery Categories Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return _buildCategoryCard(
                  title: category['title'] as String,
                  subtitle: category['subtitle'] as String,
                  icon: category['icon'] as IconData,
                  color: category['color'] as Color,
                  count: category['count'] as String,
                );
              },
            ),

            const SizedBox(height: 32),

            // Social Media Section
            Container(
              padding: const EdgeInsets.all(24),
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
                  Icon(Icons.share, color: primaryPurple, size: 40),
                  const SizedBox(height: 16),
                  Text(
                    'Share Your Moments',
                    style: AppTextStyles.h4.copyWith(
                      color: darkText,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tag us on social media with #ESSB2025 #PATS2025',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: accentPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildSocialButton(
                        icon: Icons.camera_alt,
                        label: 'Instagram',
                        color: Color(0xFFE1306C),
                      ),
                      _buildSocialButton(
                        icon: Icons.facebook,
                        label: 'Facebook',
                        color: Color(0xFF1877F2),
                      ),
                      _buildSocialButton(
                        icon: Icons.link,
                        label: 'Twitter/X',
                        color: Color(0xFF1DA1F2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required String count,
  }) {
    return Container(
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Will be available during conference
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 36),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: darkText,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyles.caption.copyWith(
                    color: accentPurple,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: goldColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    count,
                    style: AppTextStyles.caption.copyWith(
                      color: goldColor.withOpacity(0.8),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}