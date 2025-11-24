import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../config/theme/text_styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
        title: const Text('About'),
        centerTitle: true,
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Header Section
            _buildHeroHeader(),

            const SizedBox(height: 24),

            // Section 1: Joint Societies
            _buildJointSocietiesSection(),

            const SizedBox(height: 24),

            // Section 2: ESSB Society
            _buildESSBSection(),

            const SizedBox(height: 24),

            // Section 3: PATS Society
            _buildPATSSection(),

            const SizedBox(height: 24),

            // Section 4: Mission & Vision
            _buildMissionVisionSection(),

            const SizedBox(height: 24),

            // Section 5: Venue & Date
            _buildVenueSection(),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryPurple, accentPurple],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            // Conference Logo/Icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.medical_services,
                size: 60,
                color: primaryPurple,
              ),
            ),
            const SizedBox(height: 20),

            Text(
              'ESSB & PATS',
              style: AppTextStyles.h2.copyWith(
                color: whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Conference 2025',
              style: AppTextStyles.h3.copyWith(
                color: whiteColor.withOpacity(0.9),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBadge('ESSB • 24th Annual'),
                const SizedBox(width: 12),
                _buildBadge('PATS • 4th Conference'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: whiteColor, size: 18),
                const SizedBox(width: 6),
                Text(
                  'Cairo, Egypt • 2025',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: whiteColor.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: whiteColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: whiteColor.withOpacity(0.3),
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(
          color: whiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }

  Widget _buildJointSocietiesSection() {
    return Column(
      children: [
        _buildSectionHeader(
          '2025 Joint Societies',
          'A historic collaboration in Bronchology & Thoracic Medicine',
          Icons.handshake_rounded,
        ),
        const SizedBox(height: 16),

        // Main Content Card
        _buildContentCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Pan-African Collaboration'),
              const SizedBox(height: 12),
              _buildBodyText(
                'The 24th Annual Conference of the Egyptian Scientific Society of Bronchology (ESSB) & the 4th Conference of the Pan African Thoracic Society (PATS) marks a historic collaboration in the field of bronchology and thoracic medicine.',
              ),
              const SizedBox(height: 12),
              _buildBodyText(
                'Recognizing the need for stronger scientific partnerships within Africa, ESSB sought to establish a strategic alliance with a leading continental organization. At the same time, PATS was searching for a distinguished host for its upcoming conference. With Egypt at the forefront of bronchology and thoracic advancements, Cairo was selected as the ideal location to bring together experts, researchers, and clinicians from across Africa and beyond.',
              ),
              const SizedBox(height: 12),
              _buildBodyText(
                'This joint conference represents a landmark event, fostering cross-border collaboration, knowledge exchange, and innovation in respiratory medicine. By uniting the efforts of ESSB and PATS, we aim to elevate bronchology and pulmonary healthcare standards across the region, ensuring a lasting impact on clinical practice and patient care.',
              ),
              const SizedBox(height: 20),
              
              // Quote
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: primaryPurple.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: primaryPurple.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.format_quote, color: primaryPurple, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Bringing Africa\'s respiratory experts together for a healthier future.',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: primaryPurple,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Features Cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _buildFeatureCard(
                icon: Icons.people_rounded,
                title: 'Cross-border Networking',
                description: 'Meet clinicians, researchers, and industry partners from across Africa and beyond.',
                color: primaryPurple,
              ),
              const SizedBox(height: 12),
              _buildFeatureCard(
                icon: Icons.school_rounded,
                title: 'Cutting-edge Sessions',
                description: 'Workshops, courses, and symposia focused on bronchology & thoracic advances.',
                color: accentPurple,
              ),
              const SizedBox(height: 12),
              _buildFeatureCard(
                icon: Icons.trending_up_rounded,
                title: 'Regional Impact',
                description: 'Practical outcomes to uplift clinical practice and patient care in the region.',
                color: primaryPurple,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildESSBSection() {
    return Column(
      children: [
        _buildSectionHeader(
          'ESSB Society',
          'Egyptian Scientific Society of Bronchology',
          Icons.local_hospital_rounded,
        ),
        const SizedBox(height: 16),

        _buildContentCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo Placeholder
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: primaryPurple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      'ESSB',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: primaryPurple,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Center(
                child: Text(
                  'Egyptian Scientific Society of Bronchology (ESSB)',
                  style: AppTextStyles.h4.copyWith(
                    color: primaryPurple,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Leading excellence in broncho-pulmonary medicine across Egypt, the Middle East, and Africa.',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: accentPurple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),

              // Quick Facts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickFact('Founded', '20 Oct 2001'),
                  Container(width: 1, height: 40, color: primaryPurple.withOpacity(0.2)),
                  _buildQuickFact('Registration', '#1628'),
                  Container(width: 1, height: 40, color: primaryPurple.withOpacity(0.2)),
                  _buildQuickFact('Focus', 'Bronchoscopy & IP'),
                ],
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('About ESSB'),
              const SizedBox(height: 12),
              _buildBodyText(
                'The Egyptian Scientific Society of Bronchology is a non-governmental scientific organization established on October 20th, 2001 (registration #1628), dedicated to broncho-pulmonary medicine with a special focus on bronchoscopy and interventional pulmonology.',
              ),
              const SizedBox(height: 12),
              _buildBodyText(
                'ESSB\'s mission is to promote lung health throughout Egypt, the Middle East, and Africa by advancing clinical excellence and supporting high-quality research that benefits patients.',
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('What We Do'),
              const SizedBox(height: 12),

              _buildBulletPoint(
                'Continuous Medical Education',
                'Conferences, academic events, post-graduate courses, symposia, and hands-on workshops.',
              ),
              const SizedBox(height: 12),
              _buildBulletPoint(
                'Research & Innovation',
                'Developing and improving techniques to raise the standard of pulmonary care.',
              ),
              const SizedBox(height: 12),
              _buildBulletPoint(
                'Publications',
                'The Egyptian Journal of Bronchology — published since March 2007.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPATSSection() {
    return Column(
      children: [
        _buildSectionHeader(
          'PATS Society',
          'Pan African Thoracic Society',
          Icons.public_rounded,
        ),
        const SizedBox(height: 16),

        _buildContentCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo Placeholder
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: accentPurple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      'PATS',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: accentPurple,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Center(
                child: Text(
                  'Pan African Thoracic Society (PATS)',
                  style: AppTextStyles.h4.copyWith(
                    color: accentPurple,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Advancing respiratory health across Africa through collaboration, education, and impactful initiatives.',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: accentPurple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),

              // Quick Facts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickFact('Founded', '2003'),
                  Container(width: 1, height: 40, color: accentPurple.withOpacity(0.2)),
                  _buildQuickFact('Members', '43 countries'),
                  Container(width: 1, height: 40, color: accentPurple.withOpacity(0.2)),
                  _buildQuickFact('Languages', 'Anglophone &\nFrancophone'),
                ],
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('Who We Are'),
              const SizedBox(height: 12),
              _buildBodyText(
                'The Society was formed in 2003 to create a forum to address the concern that optimal management and control of respiratory diseases is not being achieved in many African settings. Furthermore, PATS was concerned at the late or misdiagnosis of respiratory diseases in Africa.',
              ),
              const SizedBox(height: 12),
              _buildBodyText(
                'Formed initially as a virtual organization, PATS currently has a membership composed of professionals from 43 African countries—both Anglophone and Francophone.',
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('Impact & Health Systems'),
              const SizedBox(height: 12),
              _buildBodyText(
                'The Covid-19 pandemic highlighted key gaps in health systems across the continent, including access to oxygen therapy, health workforce challenges, and intensive care capacity. PATS has focused on practical responses to bridge these gaps.',
              ),

              const SizedBox(height: 16),

              _buildIconListItem(
                Icons.air_rounded,
                'Access to Oxygen',
                'Advocacy and position statements for affordable oxygen in Africa.',
              ),
              const SizedBox(height: 12),
              _buildIconListItem(
                Icons.school_rounded,
                'Capacity Building',
                'Training, webinars, and linkages to key initiatives across the region.',
              ),
              const SizedBox(height: 12),
              _buildIconListItem(
                Icons.language_rounded,
                'Global Partnerships',
                'Active engagement with ERS, ATS, BTS, and FIRS to influence global respiratory health.',
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('Programs & Achievements'),
              const SizedBox(height: 12),
              _buildBodyText(
                'PATS MECOR research training program pivoted online in 2021 and completed a course in Nairobi, Kenya (June 2023), supported by the NIHR Global Health Group – IMPALA for six years.',
              ),
              const SizedBox(height: 12),
              _buildBodyText(
                'The Pan African Thoracic Society Journal has grown steadily over the past three years with BTS support. Short-term fellowship attachments in 2022 and 2023 further strengthened expertise across the UK and Africa.',
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('Leadership'),
              const SizedBox(height: 12),
              _buildBodyText(
                'We congratulate our new Executive Committee (EXCO) who took office in June 2023. Over the coming years, PATS aims to expand its reach, improve the lives of people with respiratory disease, and advocate for lung health across Africa.',
              ),

              const SizedBox(height: 16),

              // Quote
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: accentPurple.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: accentPurple.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.format_quote, color: accentPurple, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Together, we can transform respiratory health across Africa.',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: accentPurple,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMissionVisionSection() {
    return Column(
      children: [
        _buildSectionHeader(
          'Our Mission & Vision',
          'Driving excellence in bronchology and thoracic medicine',
          Icons.flag_rounded,
        ),
        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Mission Card
              Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: primaryPurple.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.track_changes_rounded,
                          color: primaryPurple,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Our Mission',
                        style: AppTextStyles.h4.copyWith(
                          color: primaryPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'To advance the field of bronchology and thoracic medicine by fostering scientific exchange, professional collaboration, and cutting-edge research among specialists in Egypt, Africa, and beyond.',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: darkText,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Through this landmark conference, we aim to enhance knowledge, improve patient care, and promote innovation in bronchoscopic techniques, pulmonary interventions, and thoracic disease management.',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: accentPurple,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Vision Card
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: accentPurple.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: accentPurple.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.visibility_rounded,
                          color: accentPurple,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Our Vision',
                        style: AppTextStyles.h4.copyWith(
                          color: accentPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'To establish the ESSB-PATS collaboration as a leading platform for bronchology and thoracic medicine in Africa and the Middle East, driving continuous education, research, and cross-border cooperation.',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: darkText,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'By strengthening ties between Egyptian and African experts, we aspire to set new standards in pulmonary care, inspire future generations of specialists, and shape the future of respiratory health across the continent.',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: accentPurple,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Quote
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: primaryPurple.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: primaryPurple.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.format_quote, color: primaryPurple, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Uniting vision and mission to transform respiratory health in Africa.',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: primaryPurple,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVenueSection() {
    return Column(
      children: [
        _buildSectionHeader(
          'Venue & Date — Cairo, Egypt',
          'Ancient wonders, modern energy, and perfect weather',
          Icons.place_rounded,
        ),
        const SizedBox(height: 16),

        _buildContentCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quick Info
              Row(
                children: [
                  Expanded(
                    child: _buildInfoBadge(Icons.location_city, 'City', 'Cairo'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildInfoBadge(Icons.flag, 'Country', 'Egypt'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildInfoBadge(Icons.access_time, 'Time Zone', 'GMT+2'),

              const SizedBox(height: 24),

              _buildSectionTitle('📍 Venue Details — Marriott, Zamalek'),
              const SizedBox(height: 12),
              _buildBodyText(
                'The conference venue is the Marriott (Zamalek) in the heart of Cairo — a central island district known for its leafy streets, cafés, and easy access to major attractions.',
              ),

              const SizedBox(height: 16),

              _buildFeaturePill('Neighborhood: Zamalek'),
              const SizedBox(height: 8),
              _buildFeaturePill('Central Location'),
              const SizedBox(height: 8),
              _buildFeaturePill('Easy Access to Nile & Downtown'),

              const SizedBox(height: 16),

              // Map & Accommodation Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _launchURL(
                        'https://maps.google.com/?q=Marriott+Zamalek+Cairo',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryPurple,
                        foregroundColor: whiteColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.map, size: 18),
                      label: const Text('Google Maps'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: primaryPurple,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(color: primaryPurple),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.hotel, size: 18),
                      label: const Text('Hotels'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              _buildSectionTitle('Why Visit Cairo?'),
              const SizedBox(height: 12),
              _buildBodyText(
                'Cairo is a city that never sleeps, offering a dynamic blend of ancient wonders and modern experiences. Whether you\'re exploring the Pyramids of Giza, cruising along the Nile, or enjoying the city\'s vibrant nightlife, Cairo has something for everyone.',
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('🌤 Cairo Weather in December'),
              const SizedBox(height: 12),

              _buildWeatherItem(
                'Temperature',
                '18–24°C (64–75°F) daytime; evenings 10–14°C (50–57°F)',
              ),
              const SizedBox(height: 8),
              _buildWeatherItem(
                'Clothing Tips',
                'Light layers, a jacket for evenings, and comfy walking shoes',
              ),
              const SizedBox(height: 8),
              _buildWeatherItem(
                'Rainfall',
                'Minimal — great for outdoor activities',
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('💰 Travel Essentials'),
              const SizedBox(height: 12),

              _buildTravelItem(Icons.monetization_on, 'Currency',
                  'Egyptian Pound (EGP). Cards widely accepted in major venues'),
              const SizedBox(height: 8),
              _buildTravelItem(
                  Icons.access_time, 'Time Zone', 'GMT+2'),
              const SizedBox(height: 8),
              _buildTravelItem(Icons.language, 'Language',
                  'Arabic (English widely spoken in tourist areas)'),
            ],
          ),
        ),
      ],
    );
  }

  // Helper Widgets
  Widget _buildSectionHeader(String title, String subtitle, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primaryPurple.withOpacity(0.1),
            accentPurple.withOpacity(0.1),
          ],
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
            child: Icon(icon, color: primaryPurple, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.h4.copyWith(
                    color: primaryPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
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

  Widget _buildContentCard({required Widget child}) {
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
      child: child,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.h4.copyWith(
        color: darkText,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildBodyText(String text) {
    return Text(
      text,
      style: AppTextStyles.bodyMedium.copyWith(
        color: darkText,
        height: 1.6,
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: accentPurple,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickFact(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: accentPurple,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.bold,
            color: darkText,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: primaryPurple,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: AppTextStyles.bodySmall.copyWith(
                  color: accentPurple,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconListItem(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: accentPurple.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: accentPurple.withOpacity(0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: accentPurple, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: accentPurple,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBadge(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: primaryPurple.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: primaryPurple.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: primaryPurple, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.caption.copyWith(
                    color: accentPurple,
                    fontSize: 10,
                  ),
                ),
                Text(
                  value,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: darkText,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturePill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: primaryPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, color: primaryPurple, size: 16),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTextStyles.bodySmall.copyWith(
              color: primaryPurple,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: lightBeige.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodySmall.copyWith(
                color: accentPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTravelItem(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: primaryPurple, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
              Text(
                value,
                style: AppTextStyles.bodySmall.copyWith(
                  color: accentPurple,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}