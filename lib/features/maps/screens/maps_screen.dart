import 'package:flutter/material.dart';
import '../../../config/theme/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> with SingleTickerProviderStateMixin {
  // Conference Theme Colors
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;
  static const Color goldColor = Color(0xFFD4AF37);

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        title: const Text('Venue Maps'),
        centerTitle: true,
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: goldColor,
          indicatorWeight: 3,
          labelColor: whiteColor,
          unselectedLabelColor: whiteColor.withOpacity(0.7),
          tabs: const [
            Tab(
              icon: Icon(Icons.location_on),
              text: 'Venue Location',
            ),
            Tab(
              icon: Icon(Icons.meeting_room),
              text: 'Floor Plan',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildVenueLocationTab(),
          _buildFloorPlanTab(),
        ],
      ),
    );
  }

  // Venue Location Tab
  Widget _buildVenueLocationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Venue Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
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
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: whiteColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.hotel,
                    size: 60,
                    color: whiteColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Cairo Marriott Hotel',
                  style: AppTextStyles.h2.copyWith(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Zamalek, Cairo',
                  style: AppTextStyles.h4.copyWith(
                    color: whiteColor.withOpacity(0.9),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Address Section
          _buildInfoCard(
            icon: Icons.location_on,
            title: 'Full Address',
            content: '16 Saray El Gezira St, Zamalek\nCairo, Egypt',
            color: primaryPurple,
          ),

          const SizedBox(height: 16),

          // Contact Section
          _buildInfoCard(
            icon: Icons.phone,
            title: 'Contact',
            content: '+20 2 2728 3000',
            color: accentPurple,
          ),

          const SizedBox(height: 16),

          // Transportation Section
          _buildInfoCard(
            icon: Icons.directions_car,
            title: 'How to Get There',
            content: '• By Taxi/Uber: Request "Marriott Zamalek"\n'
                '• By Metro: Closest station is "Opera" (Line 2)\n'
                '• Parking: Available on-site\n'
                '• Landmark: Next to Gezira Club',
            color: goldColor,
          ),

          const SizedBox(height: 24),

          // Map Placeholder Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                // Cairo Marriott Hotel coordinates
                final lat = 30.0618;
                final lng = 31.2246;
                
                // Try to open in Google Maps first
                final googleMapsUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
                
                if (await canLaunchUrl(googleMapsUrl)) {
                  await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Could not open maps'),
                        backgroundColor: primaryPurple,
                      ),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryPurple,
                foregroundColor: whiteColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.map),
              label: const Text('Open in Google Maps'),
            ),
          ),
        ],
      ),
    );
  }

  // Floor Plan Tab
  Widget _buildFloorPlanTab() {
    final halls = [
      {
        'name': 'Hall A',
        'rooms': 'AIDA 2 & 3',
        'color': primaryPurple,
        'icon': Icons.event_seat,
        'description': 'Main Conference Sessions',
      },
      {
        'name': 'Hall B',
        'rooms': 'AIDA 1',
        'color': accentPurple,
        'icon': Icons.people,
        'description': 'Pediatric Track Sessions',
      },
      {
        'name': 'Hall C',
        'rooms': 'AIDA 4',
        'color': goldColor,
        'description': 'Thoracic Surgery Track',
        'icon': Icons.medical_services,
      },
      {
        'name': 'SAKKARA',
        'rooms': 'VIP Registration & World Village',
        'color': Color(0xFF4CAF50),
        'icon': Icons.card_membership,
        'description': 'VIP Check-in & Exhibits',
      },
      {
        'name': 'THEBES',
        'rooms': 'Faculty Lounge 2',
        'color': Color(0xFF2196F3),
        'icon': Icons.coffee,
        'description': 'Faculty Rest Area',
      },
      {
        'name': 'VERDI',
        'rooms': 'Multipurpose Hall',
        'color': Color(0xFFE91E63),
        'icon': Icons.event,
        'description': 'Workshops & Special Events',
      },
      {
        'name': 'THE VIEW',
        'rooms': 'HERMES Exam Hall',
        'color': Color(0xFF9C27B0),
        'icon': Icons.edit_note,
        'description': 'Conference Examinations',
      },
      {
        'name': 'MEMPHIS',
        'rooms': 'Faculty Lounge 1',
        'color': Color(0xFFFF9800),
        'icon': Icons.lunch_dining,
        'description': 'Faculty Dining',
      },
      {
        'name': 'SALON VERT',
        'rooms': 'Registration',
        'color': Color(0xFF009688),
        'icon': Icons.app_registration,
        'description': 'Main Registration Desk',
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryPurple, accentPurple],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: whiteColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.map,
                  color: whiteColor,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Conference Floor Plan',
                      style: AppTextStyles.h4.copyWith(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Find your way around the venue',
                      style: AppTextStyles.caption.copyWith(
                        color: whiteColor.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Legend
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryPurple.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline, color: primaryPurple, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Quick Reference',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: darkText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildLegendItem(Icons.event_seat, 'Conference Halls', primaryPurple),
              _buildLegendItem(Icons.app_registration, 'Registration Areas', Color(0xFF009688)),
              _buildLegendItem(Icons.coffee, 'Lounges & Dining', Color(0xFFFF9800)),
              _buildLegendItem(Icons.event, 'Special Events', Color(0xFFE91E63)),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Halls List
        ...halls.map((hall) => _buildHallCard(
          hall['name'] as String,
          hall['rooms'] as String,
          hall['description'] as String,
          hall['color'] as Color,
          hall['icon'] as IconData,
        )),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
    required Color color,
  }) {
    return Container(
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: AppTextStyles.h4.copyWith(
                    color: darkText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: accentPurple,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHallCard(
    String name,
    String rooms,
    String description,
    Color color,
    IconData icon,
  ) {
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.h4.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    rooms,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: darkText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: AppTextStyles.caption.copyWith(
                      color: accentPurple,
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

  Widget _buildLegendItem(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: darkText,
            ),
          ),
        ],
      ),
    );
  }
}