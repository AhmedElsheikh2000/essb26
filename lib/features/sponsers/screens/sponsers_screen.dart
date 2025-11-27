import 'package:flutter/material.dart';
import '../../../config/theme/text_styles.dart';

class SponsersScreen extends StatefulWidget {
  const SponsersScreen({super.key});

  @override
  State<SponsersScreen> createState() => _SponsersScreenState();
}

class _SponsersScreenState extends State<SponsersScreen>
    with SingleTickerProviderStateMixin {
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
        title: const Text('Sponsors & Partners'),
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
              icon: Icon(Icons.verified),
              text: 'Endorsement',
            ),
            Tab(
              icon: Icon(Icons.handshake),
              text: 'Partners',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildEndorsementTab(),
          _buildPartnersTab(),
        ],
      ),
    );
  }

  // Endorsement Tab
  Widget _buildEndorsementTab() {
    final endorsedBy = [
      {
        'name': 'ERS',
        'fullName': 'The European Respiratory Society',
        'logo': 'assets/logos/ers.png', // Path to logo
        'color': Color(0xFF0066CC),
      },
      {
        'name': 'ATS',
        'fullName': 'The American Thoracic Society',
        'logo': 'assets/logos/ats.png',
        'color': Color(0xFF003DA5),
      },
      {
        'name': 'EACTS',
        'fullName': 'European Association for Cardio-Thoracic Surgery',
        'logo': 'assets/logos/eacts.png',
        'color': Color(0xFF8B0000),
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Header
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
                  Icons.verified,
                  size: 60,
                  color: whiteColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Endorsed By',
                style: AppTextStyles.h2.copyWith(
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'International Medical Societies',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: whiteColor.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Endorsed Organizations
        ...endorsedBy.map((org) => _buildEndorsementCard(
              org['name'] as String,
              org['fullName'] as String,
              org['logo'] as String,
              org['color'] as Color,
            )),

        const SizedBox(height: 24),

        // Approved By Section
        Text(
          'Approved By',
          style: AppTextStyles.h3.copyWith(
            color: darkText,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),

        _buildApprovedCard(
          'EthicalMedTech',
          'Ethical Medical Technology Standards',
          'assets/logos/ethicalmedtech.png',
          Color(0xFF4CAF50),
        ),
      ],
    );
  }

  // Partners Tab
  Widget _buildPartnersTab() {
    final partners = [
      {'name': 'Evapharma', 'logo': 'assets/logos/evapharma.png'},
      {'name': 'Pharco - Primary care', 'logo': 'assets/logos/pharco-yas.png'},
      {'name': 'Pharco -chronic care', 'logo': 'assets/logos/pharco-sher.png'},
      {'name': 'AstraZeneca', 'logo': 'assets/logos/astrazeneca.png'},
      {'name': 'Sanofi', 'logo': 'assets/logos/sanofi.png'},
      {'name': 'MDI', 'logo': 'assets/logos/mdi.png'},
      {'name': 'Respicare', 'logo': 'assets/logos/respicare.png'},
      {'name': 'Borg', 'logo': 'assets/logos/borg.png'},
      {'name': 'Global Napi', 'logo': 'assets/logos/global-napi.png'},
      {'name': 'GSK', 'logo': 'assets/logos/gsk.png'},
      {'name': 'Johnson & Johnson', 'logo': 'assets/logos/johnson-johnson.png'},
      {'name': 'Boehringer Ingelheim', 'logo': 'assets/logos/Boehringer_Ingelheim_Logo_RGB_Accent_Green.png'},
      {'name': 'Pectus Lab', 'logo': 'assets/logos/pectus-lab.png'},
      {'name': 'Advocure', 'logo': 'assets/logos/advocure.png'},
      {'name': 'Elitech Group', 'logo': 'assets/logos/eltech.png'},
      {'name': 'Medtronic', 'logo': 'assets/logos/medtronic.jpeg'},
      {'name': 'EGMED', 'logo': 'assets/logos/EGMED.jpeg'},
      {'name': 'Globe', 'logo': 'assets/logos/globe.png'},
      {'name': 'EIPICO', 'logo': 'assets/logos/eipico.png'},
      {'name': 'PharmaCon', 'logo': 'assets/logos/pharmacon.png'},
      {'name': 'Multicare', 'logo': 'assets/logos/multicare.png'},
      {'name': 'MTS', 'logo': 'assets/logos/mts.png'},
      {'name': 'Elixir', 'logo': 'assets/logos/elixir.png'},
      {'name': 'ELPI SANTE', 'logo': 'assets/logos/elpi-sante.png'},
      {'name': 'Exir Seha', 'logo': 'assets/logos/exir-seha.png'},
      {'name': 'MedXpert', 'logo': 'assets/logos/medxpert.png'},
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
                  Icons.handshake,
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
                      'Our Partners',
                      style: AppTextStyles.h4.copyWith(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Supporting medical excellence',
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

        // Partners Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: partners.length,
          itemBuilder: (context, index) {
            final partner = partners[index];
            return _buildPartnerCard(
              partner['name']!,
              partner['logo']!,
              index,
            );
          },
        ),

        const SizedBox(height: 24),

        // Thank You Message
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: primaryPurple.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              Icon(Icons.favorite, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              Text(
                'Thank You!',
                style: AppTextStyles.h3.copyWith(
                  color: darkText,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'To all our partners for making this conference possible',
                style: AppTextStyles.bodySmall.copyWith(
                  color: accentPurple,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEndorsementCard(
    String name,
    String fullName,
    String logoPath,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
        children: [
          // Logo Container
          Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color.withOpacity(0.3), width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                logoPath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.business,
                    size: 40,
                    color: color,
                  );
                },
              ),
            ),
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
                  fullName,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: accentPurple,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApprovedCard(
    String name,
    String description,
    String logoPath,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withOpacity(0.3), width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                logoPath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.verified_user,
                    size: 50,
                    color: color,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: AppTextStyles.h4.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTextStyles.bodySmall.copyWith(
              color: accentPurple,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPartnerCard(String name, String logoPath, int index) {
    final colors = [
      primaryPurple,
      accentPurple,
      goldColor,
      Color(0xFF2196F3),
      Color(0xFF4CAF50),
      Color(0xFFE91E63),
      Color(0xFFFF9800),
      Color(0xFF9C27B0),
    ];

    final color = colors[index % colors.length];

    return Container(
      padding: const EdgeInsets.all(16),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color.withOpacity(0.2)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                logoPath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.business,
                    size: 32,
                    color: color,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: AppTextStyles.caption.copyWith(
              color: darkText,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}