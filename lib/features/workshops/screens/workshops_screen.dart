import 'package:flutter/material.dart';
import '../../../config/theme/text_styles.dart';

class WorkshopsScreen extends StatelessWidget {
  const WorkshopsScreen({super.key});

  // Conference Theme Colors
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;
  static const Color goldColor = Color(0xFFD4AF37);
  static const Color greenColor = Color(0xFF4CAF50);

  @override
  Widget build(BuildContext context) {
    final workshops = [
      {
        'id': 'WS1',
        'title': 'EBUS Mastery: Hands-On Simulation, Needle Skills & Live Bronchoscopy',
        'shortDescription': 'Advance your EBUS skills through expert-led lectures, live bronchoscopy cases, and simulation-based needle training.',
        'date': 'Monday, 1 Dec 2025',
        'location': 'Ain Shams University, El-Demerdash Hospital',
        'color': greenColor,
        'duration': '09:00 - 15:45',
        'sessions': [
          {'time': '09:00 - 09:30', 'title': 'Registration', 'speaker': ''},
          {'time': '09:30 - 09:45', 'title': 'Welcome & Introduction', 'speaker': 'Ashraf Madkour'},
          {'time': '09:45 - 10:15', 'title': 'Mediastinum: Anatomy, CT-lymph node mapping and nodal lung cancer staging', 'speaker': 'Ashraf Madkour'},
          {'time': '10:15 - 10:45', 'title': 'EBUS: Anatomic landmarks and nodal stations', 'speaker': 'Nehad Osman'},
          {'time': '10:45 - 11:00', 'title': 'EBUS equipment: Radial probe & Convex probe', 'speaker': 'Hind Janah'},
          {'time': '11:00 - 11:15', 'title': 'Needles, ROSE, Specimen handling', 'speaker': 'Essam Mekhaiel'},
          {'time': '11:15 - 11:30', 'title': 'EBUS: Preparations & Anesthesia', 'speaker': 'Mohamed Hantira'},
          {'time': '11:30 - 12:00', 'title': 'Coffee break', 'speaker': ''},
          {'time': '12:00 - 13:00', 'title': 'EBUS case live transmission from bronchoscopy suite', 'speaker': 'Ashraf Madkour, Wael Imam'},
          {'time': '13:00 - 13:15', 'title': 'Troubleshooting EBUS', 'speaker': 'Essam Mekhaiel'},
          {'time': '13:15 - 13:30', 'title': 'Using the EBUS scope in the Esophagus (EUS-B)', 'speaker': 'Wael Imam'},
          {'time': '13:30 - 15:30', 'title': 'Simulation training / Needle demonstration / Specimen handling', 'speaker': 'Wael Imam, Esraa Hamza, Eman Khater'},
          {'time': '15:30 - 15:45', 'title': 'EBUS quiz: Test your knowledge', 'speaker': 'Mohamed Torki'},
        ],
      },
      {
        'id': 'WS2',
        'title': 'Interventional Bronchoscopy Workshop',
        'shortDescription': 'Join us for an immersive, hands-on workshop designed to enhance your skills in interventional bronchoscopy.',
        'date': 'Tuesday, 2 Dec 2025',
        'location': 'Ain Shams University, El-Demerdash Hospital',
        'color': primaryPurple,
        'duration': '09:30 - 15:00',
        'sessions': [
          {'time': '09:30 - 09:35', 'title': 'Welcome and Introduction', 'speaker': 'Tarek Safwat'},
          {'time': '09:35 - 09:45', 'title': 'Overview of Rigid Bronchoscopy Equipment', 'speaker': 'Emad Korraa'},
          {'time': '09:45 - 09:55', 'title': 'Basic Techniques in Rigid Bronchoscopy', 'speaker': 'Essam Mekhaiel'},
          {'time': '09:55 - 10:10', 'title': 'Bronchoscopic Thermal Therapies for CAO (Electrocautery & APC)', 'speaker': 'Grigoris Stratakos'},
          {'time': '10:10 - 10:20', 'title': 'Bronchoscopic Principals of Cryo diagnosis', 'speaker': 'Haytham Sami'},
          {'time': '10:20 - 10:30', 'title': 'Airway Stent Application Techniques', 'speaker': 'Grigoris Stratakos'},
          {'time': '10:30 - 10:40', 'title': 'Video Demonstrations of Interventional Bronchoscopy Procedures', 'speaker': 'Nehad Osman'},
          {'time': '10:40 - 10:50', 'title': 'Clinical Case Scenarios in Interventional Bronchoscopy', 'speaker': 'Essam Mekhaiel'},
          {'time': '10:50 - 11:05', 'title': 'Coffee Break', 'speaker': ''},
          {'time': '11:05 - 12:30', 'title': 'Live case from bronchoscopy suite', 'speaker': 'Emad Korraa, Haytham Sami'},
          {'time': '12:30 - 15:00', 'title': 'Extended Hands-On Practice: Phantom Models & Goat Carcass Airways', 'speaker': 'Haytham Sami, Grigoris Stratakos, Eman Khater, Essam Mekhaiel, Nehad Osman, Emad Korraa, Esraa Hamza'},
        ],
      },
      {
        'id': 'WS3',
        'title': 'Lung Functions: Spirometry and Oscillometry',
        'shortDescription': 'Learn how to perform and interpret spirometry, identify abnormal flow-volume loops, apply LLN, conduct 6MWT, and more.',
        'date': 'Tuesday, 2 Dec 2025',
        'location': 'Cairo Marriott Hotel',
        'color': accentPurple,
        'duration': '09:00 - 16:00',
        'sessions': [
          {'time': '09:00 - 09:30', 'title': 'Registration', 'speaker': ''},
          {'time': '09:30 - 09:40', 'title': 'Introduction', 'speaker': ''},
          {'time': '09:40 - 10:00', 'title': 'Module 1: Spirometry equipment and indications & contraindications of spirometry', 'speaker': 'Lindsay Zurba'},
          {'time': '10:00 - 10:20', 'title': 'Module 2: Spirogram and spirometric parameters of common disorders', 'speaker': 'Eman Badawy'},
          {'time': '10:20 - 10:40', 'title': 'Module 3: Spirometry technique, Acceptability criteria', 'speaker': 'Khaled Wagh'},
          {'time': '10:40 - 11:00', 'title': 'Module 4: LLN and standard deviation importance; reference ranges', 'speaker': 'Lindsay Zurba'},
          {'time': '11:00 - 11:20', 'title': 'Module 5: Evaluation of Spirometric Results, Bronchodilator responsiveness test, Upper airway obstruction', 'speaker': 'Hossam Esawy'},
          {'time': '11:20 - 11:40', 'title': 'Module 6: Bridging Spirometry and Oscillometry', 'speaker': 'Lindsay Zurba'},
          {'time': '11:40 - 12:10', 'title': 'Coffee Break', 'speaker': ''},
          {'time': '12:10 - 12:30', 'title': 'Module 7: Oscillometry equipment and indications for testing', 'speaker': 'Di Gray'},
          {'time': '12:30 - 12:50', 'title': 'Module 8: Oscillogram and oscillometry parameters', 'speaker': 'Di Gray'},
          {'time': '12:50 - 13:10', 'title': 'Module 9: Oscillometry technique, acceptability criteria', 'speaker': 'Lindsay Zurba'},
          {'time': '13:10 - 13:40', 'title': 'Module 10: Evaluation of Oscillometry Results, Bronchodilator responsiveness test, small airway obstruction', 'speaker': 'Lindsay Zurba'},
          {'time': '13:40 - 14:00', 'title': 'Module 11: How to perform 6 min walk test (6MWT)', 'speaker': 'Heba Shalaby'},
          {'time': '14:00 - 14:30', 'title': 'Module 12: Case-study presentations', 'speaker': 'Hossam Esawy (adult), Di Gray (paed)'},
          {'time': '14:30 - 16:00', 'title': 'Module 13: Hands-on learning', 'speaker': 'All Groups'},
        ],
      },
      {
        'id': 'WS4',
        'title': 'VATS Workshop',
        'shortDescription': 'This workshop will combine cutting-edge educational methods with practical training, making it a unique opportunity for surgeons.',
        'date': 'Tuesday, 2 Dec 2025',
        'location': 'Cairo Marriott Hotel',
        'color': Color(0xFF2196F3),
        'duration': '09:00 - 16:30',
        'sessions': [
          {'time': '09:00 - 09:30', 'title': 'Welcome and orientation', 'speaker': ''},
          {'time': '09:30 - 10:00', 'title': 'VATS basic set up', 'speaker': 'Ivan Schewitz'},
          {'time': '10:00 - 10:30', 'title': 'Minor VATS operations', 'speaker': 'Adamu Issaka'},
          {'time': '10:30 - 11:00', 'title': 'How to build your VATS program', 'speaker': 'Hatem Beshir'},
          {'time': '11:00 - 11:30', 'title': 'How to accelerate your VATS learning curve', 'speaker': 'Kostas Kostopanagiotou'},
          {'time': '11:30 - 12:30', 'title': 'Dry lab VR simulator', 'speaker': ''},
          {'time': '12:30 - 13:00', 'title': 'Break', 'speaker': ''},
          {'time': '13:00 - 13:30', 'title': 'Step by step: VATS lobectomy', 'speaker': 'Hany Hasan Elsayed'},
          {'time': '13:30 - 14:00', 'title': 'VATS economics; how to get the fund', 'speaker': 'Mohamed Haggag'},
          {'time': '14:00 - 14:30', 'title': 'Bleeding control during VATS', 'speaker': 'Hussein Elkhayat'},
          {'time': '14:30 - 16:30', 'title': 'Wetlab VATS lobectomy', 'speaker': ''},
          {'time': '16:30', 'title': 'Closure', 'speaker': ''},
        ],
      },
      {
        'id': 'WS5',
        'title': 'Obstructive Sleep Apnea Made Easy: Diagnosis & Management',
        'shortDescription': 'Gain a comprehensive understanding of obstructive sleep apnea from diagnostic challenges to troubleshooting solutions. This workshop covers diagnostic techniques, interpretation of sleep studies, and practical treatment approaches. Ideal for physicians, therapists, and nurses aiming to improve outcomes in sleep medicine.',
        'date': 'Thursday, 4 Dec 2025',
        'location': 'Cairo Marriott Hotel',
        'color': Color(0xFFE91E63),
        'duration': '08:30 - 12:00',
        'sessions': [
          {'time': '08:30 - 09:00', 'title': 'Registration', 'speaker': ''},
          {'time': '09:00 - 09:40', 'title': 'Sleep Neurobiology and EEG Waves: Why Do They Matter?', 'speaker': 'Aliaa Adel Saleh'},
          {'time': '09:40 - 10:20', 'title': 'Obstructive Sleep Apnea from Pathophysiology to CPAP and BiPAP: When, How and Why?', 'speaker': 'Safi Kaddah'},
          {'time': '10:20 - 11:00', 'title': 'Case-based Interactive Discussion: A Patient Journey from Diagnosis to Treatment – Challenges and Troubleshooting', 'speaker': 'Iman Abdel Rehim'},
          {'time': '11:00 - 11:40', 'title': 'Group Rotation – Hands-on Stations: 1. Polysomnography, 2. Mask Fitting, CPAP and BiPAP Machines', 'speaker': 'Sameh Ghabbour, Mahmoud Kamal'},
          {'time': '11:40 - 12:00', 'title': 'Innovations in the diagnosis and treatment of OSA: UK experience', 'speaker': 'Ahmed Elkarn'},
        ],
      },
    ];

    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        title: const Text('Pre-Conference Workshops'),
        centerTitle: true,
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workshops.length,
        itemBuilder: (context, index) {
          final workshop = workshops[index];
          return _buildWorkshopSummaryCard(context, workshop);
        },
      ),
    );
  }

  Widget _buildWorkshopSummaryCard(BuildContext context, Map<String, dynamic> workshop) {
    final color = workshop['color'] as Color;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorkshopDetailScreen(workshop: workshop),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        workshop['id'],
                        style: AppTextStyles.caption.copyWith(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 16, color: color),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  workshop['title'],
                  style: AppTextStyles.h4.copyWith(
                    color: darkText,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  workshop['shortDescription'],
                  style: AppTextStyles.bodySmall.copyWith(
                    color: accentPurple,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: color),
                    const SizedBox(width: 6),
                    Text(
                      workshop['date'],
                      style: AppTextStyles.caption.copyWith(color: darkText),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: color),
                    const SizedBox(width: 6),
                    Text(
                      workshop['duration'],
                      style: AppTextStyles.caption.copyWith(color: darkText),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: color),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        workshop['location'],
                        style: AppTextStyles.caption.copyWith(color: darkText),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Detail Screen
class WorkshopDetailScreen extends StatelessWidget {
  final Map<String, dynamic> workshop;

  const WorkshopDetailScreen({super.key, required this.workshop});

  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final color = workshop['color'] as Color;
    final sessions = workshop['sessions'] as List<Map<String, String>>;

    return Scaffold(
      backgroundColor: lightBeige,
      body: CustomScrollView(
        slivers: [
          // App Bar with Gradient
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: color,
            foregroundColor: whiteColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [color, color.withOpacity(0.7)],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: whiteColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            workshop['id'],
                            style: AppTextStyles.bodySmall.copyWith(
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          workshop['title'],
                          style: AppTextStyles.h3.copyWith(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Info Section
                Container(
                  margin: const EdgeInsets.all(16),
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
                        'About This Workshop',
                        style: AppTextStyles.h4.copyWith(
                          color: darkText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        workshop['shortDescription'],
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: accentPurple,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildInfoRow(Icons.calendar_today, 'Date', workshop['date'], color),
                      const SizedBox(height: 12),
                      _buildInfoRow(Icons.access_time, 'Duration', workshop['duration'], color),
                      const SizedBox(height: 12),
                      _buildInfoRow(Icons.location_on, 'Location', workshop['location'], color),
                    ],
                  ),
                ),

                // Program Section
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                      Row(
                        children: [
                          Icon(Icons.schedule, color: color, size: 24),
                          const SizedBox(width: 8),
                          Text(
                            'Workshop Program',
                            style: AppTextStyles.h4.copyWith(
                              color: darkText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${sessions.length} Sessions',
                              style: AppTextStyles.caption.copyWith(
                                color: color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Sessions Timeline
                      ...sessions.asMap().entries.map((entry) {
                        final index = entry.key;
                        final session = entry.value;
                        final isLast = index == sessions.length - 1;

                        return _buildSessionItem(
                          session['time']!,
                          session['title']!,
                          session['speaker']!,
                          color,
                          isLast,
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.caption.copyWith(
                  color: accentPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: darkText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSessionItem(String time, String title, String speaker, Color color, bool isLast) {
    final isBreak = title.toLowerCase().contains('break') ||
        title.toLowerCase().contains('coffee') ||
        title.toLowerCase().contains('registration');

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: isBreak ? accentPurple : color,
                  shape: BoxShape.circle,
                  border: Border.all(color: whiteColor, width: 2),
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 50,
                  color: color.withOpacity(0.2),
                ),
            ],
          ),
          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isBreak ? accentPurple.withOpacity(0.05) : color.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isBreak ? accentPurple.withOpacity(0.2) : color.withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: isBreak ? accentPurple : color,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: AppTextStyles.caption.copyWith(
                          color: isBreak ? accentPurple : color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: darkText,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                  if (speaker.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.person, size: 12, color: accentPurple),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            speaker,
                            style: AppTextStyles.caption.copyWith(
                              color: accentPurple,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}