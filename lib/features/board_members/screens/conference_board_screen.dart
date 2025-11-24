import 'package:flutter/material.dart';
import '../../../config/theme/text_styles.dart';

class ConferenceBoardScreen extends StatelessWidget {
  const ConferenceBoardScreen({super.key});

  // Conference Theme Colors
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    // الأعضاء اللي عندهم صور
    final List<Map<String, String>> boardMembersWithImages = [
      {
        'name': 'Prof. Refiloe Masekela',
        'title': 'Society President & Congress President',
        'subtitle': 'PATS',
        'image': 'assets/images/board_members/refiloe_masekela.jpg',
      },
      {
        'name': 'Prof. Ashraf Madkour',
        'title': 'Congress President',
        'subtitle': 'ESSB',
        'image': 'assets/images/board_members/ashraf_madkour.jpg',
      },
      {
        'name': 'Prof. Mohamed Hantira',
        'title': 'Congress President',
        'subtitle': 'ESSB',
        'image': 'assets/images/board_members/mohamed_hantira.jpg',
      },
      {
        'name': 'Prof. Diane Gray',
        'title': 'Congress Co-Chair',
        'subtitle': 'PATS',
        'image': 'assets/images/board_members/diane_gray.jpg',
      },
      {
        'name': 'Dr. Charl Verwey',
        'title': 'Congress Co-Chair',
        'subtitle': 'PATS Incoming Treasurer',
        'image': 'assets/images/board_members/charl_verwey.jpg',
      },
      {
        'name': 'Prof. Adel Khattab',
        'title': 'Congress Honorary President',
        'subtitle': 'ESSB',
        'image': 'assets/images/board_members/adel_khattab.jpg',
      },
      {
        'name': 'Prof. Ashraf Hatem',
        'title': 'Congress Honorary President',
        'subtitle': 'ESSB',
        'image': 'assets/images/board_members/ashraf_hatem.jpg',
      },
      {
        'name': 'Prof. Essam Gouda',
        'title': 'Congress Honorary President',
        'subtitle': 'ESSB',
        'image': 'assets/images/board_members/essam_gouda.jpg',
      },
      {
        'name': 'Prof. Nader Fasseeh',
        'title': 'Head of Scientific Committee',
        'subtitle': 'Pediatric track',
        'image': 'assets/images/board_members/nader_fasseeh.jpg',
      },
      {
        'name': 'Dr. Ivan Schewitz',
        'title': 'Head of Scientific Committee',
        'subtitle': 'Thoracic surgery track - PATS',
        'image': 'assets/images/board_members/ivan_schewitz.jpg',
      },
      {
        'name': 'Ahmed Gharib',
        'title': 'Congress General Secretary',
        'subtitle': 'Organizing Committee',
        'image': 'assets/images/board_members/ahmed_gharib.jpg',
      },
      {
        'name': 'Hussein El Khayat',
        'title': 'Congress Coordinator',
        'subtitle': 'Organizing Committee',
        'image': 'assets/images/board_members/hussein_el_khayat.jpg',
      },
    ];

    // جدول اللجان
    final List<Map<String, dynamic>> committeeTable = [
      {
        'title': 'Head of Scientific Committee – Adult track',
        'essb': 'Mohamed Hantira',
        'pats': 'Uju Ozoh, Wanjiku Kagima',
      },
      {
        'title': 'Head of Scientific Committee – Pediatric track',
        'essb': 'Nader Fasseeh',
        'pats': 'Diane Gray',
      },
      {
        'title': 'Head of Scientific Committee – Thoracic surgery track',
        'essb': 'Hussein El Khayat',
        'pats': 'Ivan Schewitz',
      },
      {
        'title': 'Members of Scientific Committee',
        'essb': 'Ragia Sharshar, Dalia Shaarawy, Ahmed Gharieb, Mohamed Tourky',
        'pats': 'Diane Gray, Refiloe Masekela, Charl Verwey',
      },
      {
        'title': 'Head of Workshops Committee',
        'essb': 'Ashraf Madkour',
        'pats': 'Charl Verwey',
      },
      {
        'title': 'Workshops Coordinator',
        'essb': 'Yasmin Hamdy',
        'pats': 'Charl Verwey',
      },
      {
        'title': 'Chest Ultrasound (Adult & Pediatric)',
        'essb': 'Gamal ElAgmy',
        'pats': 'Wanjiku Kagima',
      },
      {
        'title': 'Interventional Bronchoscopy',
        'essb': 'Emad Korraa',
        'pats': 'Andrew Owuor',
      },
      {
        'title': 'EBUS Mastery',
        'essb': 'Mohamed Hantira, Nehad Osman',
        'pats': 'Lamya',
      },
      {
        'title': 'Sleep Disorders (Adult & Pediatric)',
        'essb': 'Ahmed Gharib',
        'pats': 'Refica Ersu',
      },
      {
        'title': 'Lung Functions',
        'essb': 'Hossam Essawy',
        'pats': 'Lindsay Zurba, Diane Gray',
      },
      {
        'title': 'VATS',
        'essb': 'Hussein El Khayat',
        'pats': 'Ivan Schweitz',
      },
      {
        'title': 'CF',
        'essb': '—',
        'pats': 'Marco Zampoli',
      },
      {
        'title': 'Financial Affairs Revisor',
        'essb': 'Mohamed Hantira',
        'pats': 'Refiloe Masekela, Charl Verwey',
      },
      {
        'title': 'Member of Organizing Committee',
        'essb': 'Wael Emam, Eman Khater, Esraa Hamza',
        'pats': '–',
      },
    ];

    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        title: const Text('Conference Board'),
        centerTitle: true,
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
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
                  const Icon(
                    Icons.groups,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Meet the Leaders',
                    style: AppTextStyles.h3.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Behind ESSB & PATS Conference 2025',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Board Members with Images
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Board Members',
                style: AppTextStyles.h3.copyWith(
                  color: darkText,
                ),
              ),
            ),
            const SizedBox(height: 16),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: boardMembersWithImages.length,
              itemBuilder: (context, index) {
                final member = boardMembersWithImages[index];
                return _buildMemberCard(member);
              },
            ),

            const SizedBox(height: 32),

            // Congress Committee Table
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Congress Committee',
                style: AppTextStyles.h3.copyWith(
                  color: darkText,
                ),
              ),
            ),
            const SizedBox(height: 16),

            _buildCommitteeTable(committeeTable),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberCard(Map<String, String> member) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
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
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryPurple,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryPurple.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
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
                        size: 45,
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
                    style: AppTextStyles.h4.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: primaryPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      member['title']!,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: primaryPurple,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    member['subtitle']!,
                    style: AppTextStyles.caption.copyWith(
                      color: accentPurple,
                      fontSize: 11,
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

  Widget _buildCommitteeTable(List<Map<String, dynamic>> data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryPurple.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Title',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: primaryPurple,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'ESSB',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: primaryPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'PATS',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: primaryPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          // Table Rows
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final row = data[index];
              return Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        row['title'],
                        style: AppTextStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: darkText,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        row['essb'],
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 11,
                          color: accentPurple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        row['pats'],
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 11,
                          color: accentPurple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}