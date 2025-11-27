import 'package:flutter/material.dart';
import '../../../config/theme/text_styles.dart';
import 'conference_board_screen.dart';
import 'essb_board_screen.dart';
import 'pats_board_screen.dart';

class BoardMainScreen extends StatelessWidget {
  const BoardMainScreen({super.key});

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
        title: const Text('Board Members'),
        centerTitle: true,
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
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
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: primaryPurple.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.groups_rounded,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Meet Our Leadership',
                    style: AppTextStyles.h3.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Select a board to view members',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Conference Board
            _buildSimpleCard(
              context,
              title: 'Congress Board',
              subtitle: 'Organizing Committee Members',
              icon: Icons.event_rounded,
              color: primaryPurple,
              screen: const ConferenceBoardScreen(),
            ),

            const SizedBox(height: 16),

            // ESSB Board
            _buildSimpleCard(
              context,
              title: 'ESSB Board',
              subtitle: 'Egyptian Scientific Society of Bronchology',
              icon: Icons.local_hospital_rounded,
              color: primaryPurple,
              screen: const EssbBoardScreen(),
            ),

            const SizedBox(height: 16),

            // PATS Board
            _buildSimpleCard(
              context,
              title: 'PATS Board',
              subtitle: 'Pan African Thoracic Society',
              icon: Icons.medical_services_rounded,
              color: accentPurple,
              screen: const PatsBoardScreen(),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget screen,
  }) {
    return Card(
      elevation: 3,
      shadowColor: color.withOpacity(0.2),
      color: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Icon Container
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: color,
                ),
              ),

              const SizedBox(width: 16),

              // Text Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: accentPurple,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // Arrow Icon
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}