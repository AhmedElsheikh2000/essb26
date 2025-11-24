import 'package:flutter/material.dart';
import '../../../config/theme/text_styles.dart';

class PatsBoardScreen extends StatelessWidget {
  const PatsBoardScreen({super.key});

  // Conference Theme Colors
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;
  static const Color accentGold = Color(0xFFD4AF37); // For leadership

  @override
  Widget build(BuildContext context) {
    // 1. Leadership (7 أعضاء)
    final List<Map<String, String>> leadership = [
      {
        'name': 'Prof. Refiloe Masekela',
        'title': 'President',
        'image': 'assets/images/board_members/refiloe_masekela.jpg',
      },
      {
        'name': 'Dr. Joseph Aluoch',
        'title': 'Immediate Past President',
        'image': 'assets/images/board_members/joseph_aluoch.jpg',
      },
      {
        'name': 'Dr. Obianuju Ozoh',
        'title': 'Vice President – Anglophone',
        'image': 'assets/images/board_members/obianuju_ozoh.jpg',
      },
      {
        'name': 'Prof. Mbatchou Ngahane Bertrand Hugo',
        'title': 'Vice President – Francophone',
        'image': 'assets/images/board_members/mbatchou_ngahane.jpg',
      },
      {
        'name': 'Dr. Jacqueline Wanjiku Kagima',
        'title': 'General Secretary',
        'image': 'assets/images/board_members/wanjiku_kagima.jpg',
      },
      {
        'name': 'Dr. Diane Gray',
        'title': 'Treasurer',
        'image': 'assets/images/board_members/diane_gray.jpg',
      },
      {
        'name': 'Prof. Marco Zampoli',
        'title': 'Editor in Chief',
        'image': 'assets/images/board_members/marco_zampoli.jpg',
      },
    ];

    // 2. Executive Members (7 أعضاء)
    final List<Map<String, String>> executiveMembers = [
      {
        'name': 'Dr. Charl Verwey',
        'title': 'Executive Member',
        'image': 'assets/images/board_members/charl_verwey.jpg',
      },
      {
        'name': 'Dr. Diana Marangu-Boore',
        'title': 'Executive Member',
        'image': 'assets/images/board_members/diana_marangu_boore.jpg',
      },
      {
        'name': 'Prof. Heather Zar',
        'title': 'Executive Member',
        'image': 'assets/images/board_members/heather_zar.jpg',
      },
      {
        'name': 'Dr. Ivan Schewitz',
        'title': 'Executive Member',
        'image': 'assets/images/board_members/ivan_schewitz.jpg',
      },
      {
        'name': 'Dr. Joy Eze',
        'title': 'Executive Member',
        'image': 'assets/images/board_members/joy_eze.jpg',
      },
      {
        'name': 'Dr. Kevin Mortimer',
        'title': 'Executive Member',
        'image': 'assets/images/board_members/kevin_mortimer.jpg',
      },
      {
        'name': 'Dr. Sandra Kwarteng Owusu',
        'title': 'Executive Member',
        'image': 'assets/images/board_members/sandra_kwarteng_owusu.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        title: Column(
          children: [
            const Text('PATS Board'),
            Text(
              'Pan-Arab Trauma Society',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.normal,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [accentPurple, primaryPurple],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'PATS',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primaryPurple,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Leadership and Executive Committee',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 1️⃣ Leadership Section
            _buildSectionHeader('Leadership', Icons.star, accentGold),
            const SizedBox(height: 16),
            _buildMembersList(leadership),

            const SizedBox(height: 32),

            // 2️⃣ Executive Members Section
            _buildSectionHeader(
              'Executive Members',
              Icons.groups,
              accentPurple,
              subtitle: 'Alphabetical Order',
            ),
            const SizedBox(height: 16),
            _buildMembersList(executiveMembers),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    String title,
    IconData icon,
    Color color, {
    String? subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.h4.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTextStyles.caption.copyWith(
                      color: color.withOpacity(0.8),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembersList(List<Map<String, String>> members) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: members.length,
      itemBuilder: (context, index) {
        final member = members[index];
        return _buildMemberCard(member);
      },
    );
  }

  Widget _buildMemberCard(Map<String, String> member) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // صورة العضو
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: accentPurple,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: accentPurple.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  member['image']!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: accentPurple.withOpacity(0.1),
                      child: const Icon(
                        Icons.person,
                        size: 35,
                        color: accentPurple,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),

            // معلومات العضو
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member['name']!,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: accentPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      member['title']!,
                      style: AppTextStyles.caption.copyWith(
                        color: accentPurple,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}