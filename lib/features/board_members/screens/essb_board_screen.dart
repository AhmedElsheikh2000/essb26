import 'package:flutter/material.dart';
import '../../../config/theme/text_styles.dart';

class EssbBoardScreen extends StatelessWidget {
  const EssbBoardScreen({super.key});

  // Conference Theme Colors
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;
  static const Color accentGold = Color(0xFFD4AF37); // For leadership

  @override
  Widget build(BuildContext context) {
    // 1. Leadership (4 أعضاء)
    final List<Map<String, String>> leadership = [
      {
        'name': 'Prof. Tarek Safwat',
        'title': 'President',
        'image': 'assets/images/board_members/tarek_safwat.jpg',
      },
      {
        'name': 'Prof. Adel Khattab',
        'title': 'Deputy President',
        'image': 'assets/images/board_members/adel_khattab.jpg',
      },
      {
        'name': 'Prof. Essam Gouda',
        'title': 'Secretary-General',
        'image': 'assets/images/board_members/essam_gouda.jpg',
      },
      {
        'name': 'Prof. Yasser Mostafa',
        'title': 'Treasurer',
        'image': 'assets/images/board_members/yasser_mostafa.jpg',
      },
    ];

    // 2. Board Members (11 عضو)
    final List<Map<String, String>> boardMembers = [
      {
        'name': 'Prof. Ahmed Al Halfawy',
        'title': 'Board Member',
        'image': 'assets/images/board_members/ahmed_al_halfawy.jpg',
      },
      {
        'name': 'Prof. Ahmed Gharib',
        'title': 'Board Member',
        'image': 'assets/images/board_members/ahmed_gharib.jpg',
      },
      {
        'name': 'Prof. Amr Shoukri',
        'title': 'Board Member',
        'image': 'assets/images/board_members/amr_shoukri.jpg',
      },
      {
        'name': 'Prof. Ashraf Hatem',
        'title': 'Board Member',
        'image': 'assets/images/board_members/ashraf_hatem.jpg',
      },
      {
        'name': 'Prof. Ashraf Madkour',
        'title': 'Board Member',
        'image': 'assets/images/board_members/ashraf_madkour.jpg',
      },
      {
        'name': 'Prof. Assem El Essawy',
        'title': 'Board Member',
        'image': 'assets/images/board_members/assem_el_essawy.jpg',
      },
      {
        'name': 'Prof. Emad Korraa',
        'title': 'Board Member',
        'image': 'assets/images/board_members/emad_korraa.jpg',
      },
      {
        'name': 'Prof. Gamal Rabie Agamy',
        'title': 'Board Member',
        'image': 'assets/images/board_members/gamal_rabie_agamy.jpg',
      },
      {
        'name': 'Prof. Khaled Wagih',
        'title': 'Board Member',
        'image': 'assets/images/board_members/khaled_wagih.jpg',
      },
      {
        'name': 'Prof. Mohamed Hantira',
        'title': 'Board Member',
        'image': 'assets/images/board_members/mohamed_hantira.jpg',
      },
      {
        'name': 'Prof. Mostafa El Shazly',
        'title': 'Board Member',
        'image': 'assets/images/board_members/mostafa_el_shazly.jpg',
      },
    ];

    // 3. Committee Members (6 أعضاء)
    final List<Map<String, String>> committeeMembers = [
      {
        'name': 'Prof. Ayman Ibrahim Baess',
        'title': 'Committee Member',
        'image': 'assets/images/board_members/ayman_ibrahim_baess.jpg',
      },
      {
        'name': 'Prof. Mohamed Torky',
        'title': 'Committee Member',
        'image': 'assets/images/board_members/mohamed_torky.jpg',
      },
      {
        'name': 'Prof. Nehad Osman',
        'title': 'Committee Member',
        'image': 'assets/images/board_members/nehad_osman.jpg',
      },
      {
        'name': 'Prof. Tamer M. Ali',
        'title': 'Committee Member',
        'image': 'assets/images/board_members/tamer_m_ali.jpg',
      },
      {
        'name': 'Prof. Waleed El Sorougy',
        'title': 'Committee Member',
        'image': 'assets/images/board_members/waleed_el_sorougy.jpg',
      },
      {
        'name': 'Prof. Yasmin Hamdy',
        'title': 'Committee Member',
        'image': 'assets/images/board_members/yasmin_hamdy.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        title: Column(
          children: [
            const Text('ESSB Board'),
            Text(
              'Egyptian Society of Surgical & Basic Science',
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
                  colors: [
                    primaryPurple,
                    accentPurple,
                  ],
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
                        'ESSB',
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
                    'Leadership, Board Members and Committees',
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
            _buildMembersList(leadership, showImages: true),

            const SizedBox(height: 32),

            // 2️⃣ Board Members Section
            _buildSectionHeader(
              'Board Members',
              Icons.people,
              primaryPurple,
              subtitle: 'Alphabetical Order',
            ),
            const SizedBox(height: 16),
            _buildMembersList(boardMembers, showImages: true),

            const SizedBox(height: 32),

            // 3️⃣ Committee Members Section
            _buildSectionHeader(
              'Committee Members',
              Icons.groups,
              accentPurple,
              subtitle: 'Alphabetical Order',
            ),
            const SizedBox(height: 16),
            _buildMembersList(committeeMembers, showImages: true),

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

  Widget _buildMembersList(
    List<Map<String, String>> members, {
    required bool showImages,
  }) {
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
                  color: primaryPurple,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryPurple.withOpacity(0.2),
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
                      color: primaryPurple.withOpacity(0.1),
                      child: const Icon(
                        Icons.person,
                        size: 35,
                        color: primaryPurple,
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
                      color: primaryPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      member['title']!,
                      style: AppTextStyles.caption.copyWith(
                        color: primaryPurple,
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