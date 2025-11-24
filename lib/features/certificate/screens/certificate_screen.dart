import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../config/theme/text_styles.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  // Conference Theme Colors
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;
  static const Color goldColor = Color(0xFFD4AF37);

  final _formKey = GlobalKey<FormState>();
  
  // Form fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _organizationController = TextEditingController();
  
  // Survey questions
  int _overallRating = 0;
  int _venueRating = 0;
  int _speakersRating = 0;
  int _organizationRating = 0;
  String _feedback = '';
  
  // Certificate selection
  String? _selectedCertificate;
  
  final List<Map<String, dynamic>> _certificateOptions = [
    {
      'id': 'congress',
      'title': 'Congress Certificate',
      'subtitle': 'Full conference attendance',
      'icon': Icons.workspace_premium,
      'color': Color(0xFFD4AF37),
    },
    {
      'id': 'ws1',
      'title': 'Workshop 1 - EBUS Mastery',
      'subtitle': 'Hands-On Simulation & Live Bronchoscopy',
      'icon': Icons.work_outline,
      'color': Color(0xFF4CAF50),
    },
    {
      'id': 'ws2',
      'title': 'Workshop 2 - Interventional Bronchoscopy',
      'subtitle': 'Advanced techniques workshop',
      'icon': Icons.work_outline,
      'color': Color(0xFF3D2B5C),
    },
    {
      'id': 'ws3',
      'title': 'Workshop 3 - Lung Functions',
      'subtitle': 'Spirometry and Oscillometry',
      'icon': Icons.work_outline,
      'color': Color(0xFF6B5189),
    },
    {
      'id': 'ws4',
      'title': 'Workshop 4 - VATS',
      'subtitle': 'Video-Assisted Thoracic Surgery',
      'icon': Icons.work_outline,
      'color': Color(0xFF2196F3),
    },
    {
      'id': 'ws5',
      'title': 'Workshop 5 - Sleep Disorders',
      'subtitle': 'Adult & Pediatric Diagnosis & Management',
      'icon': Icons.work_outline,
      'color': Color(0xFFE91E63),
    },
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _organizationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        title: const Text('Certificate Request'),
        centerTitle: true,
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
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
                      Icons.card_membership,
                      size: 60,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Request Your Certificate',
                    style: AppTextStyles.h2.copyWith(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Complete the survey and select your certificate',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: whiteColor.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Personal Information Section
            _buildSectionCard(
              title: 'Personal Information',
              icon: Icons.person,
              child: Column(
                children: [
                  _buildTextField(
                    controller: _nameController,
                    label: 'Full Name',
                    icon: Icons.person_outline,
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Please enter your name' : null,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email Address',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) return 'Please enter your email';
                      if (!value!.contains('@')) return 'Please enter a valid email';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _phoneController,
                    label: 'Phone Number',
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _organizationController,
                    label: 'Organization/Hospital',
                    icon: Icons.business_outlined,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Survey Section
            _buildSectionCard(
              title: 'Conference Survey',
              icon: Icons.poll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRatingQuestion(
                    'Overall Conference Experience',
                    _overallRating,
                    (rating) => setState(() => _overallRating = rating),
                  ),
                  const SizedBox(height: 20),
                  _buildRatingQuestion(
                    'Venue & Facilities',
                    _venueRating,
                    (rating) => setState(() => _venueRating = rating),
                  ),
                  const SizedBox(height: 20),
                  _buildRatingQuestion(
                    'Quality of Speakers',
                    _speakersRating,
                    (rating) => setState(() => _speakersRating = rating),
                  ),
                  const SizedBox(height: 20),
                  _buildRatingQuestion(
                    'Organization & Coordination',
                    _organizationRating,
                    (rating) => setState(() => _organizationRating = rating),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Additional Feedback',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Share your thoughts and suggestions...',
                      filled: true,
                      fillColor: whiteColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: primaryPurple.withOpacity(0.2)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: primaryPurple.withOpacity(0.2)),
                      ),
                    ),
                    onChanged: (value) => _feedback = value,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Certificate Selection
            _buildSectionCard(
              title: 'Select Certificate Type',
              icon: Icons.workspace_premium,
              child: Column(
                children: _certificateOptions.map((option) {
                  return _buildCertificateOption(
                    id: option['id'] as String,
                    title: option['title'] as String,
                    subtitle: option['subtitle'] as String,
                    icon: option['icon'] as IconData,
                    color: option['color'] as Color,
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 32),

            // Submit Button
            ElevatedButton(
              onPressed: _submitRequest,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryPurple,
                foregroundColor: whiteColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.send),
                  const SizedBox(width: 8),
                  Text(
                    'Submit Request',
                    style: AppTextStyles.h4.copyWith(color: whiteColor),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Widget child,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: primaryPurple, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: AppTextStyles.h4.copyWith(
                  color: darkText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: primaryPurple),
        filled: true,
        fillColor: lightBeige,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryPurple.withOpacity(0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryPurple.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryPurple, width: 2),
        ),
      ),
    );
  }

  Widget _buildRatingQuestion(String question, int rating, Function(int) onRate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: darkText,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) {
            final starValue = index + 1;
            return InkWell(
              onTap: () => onRate(starValue),
              child: Icon(
                starValue <= rating ? Icons.star : Icons.star_border,
                color: goldColor,
                size: 36,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildCertificateOption({
    required String id,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    final isSelected = _selectedCertificate == id;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isSelected ? color.withOpacity(0.1) : lightBeige,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? color : primaryPurple.withOpacity(0.2),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: RadioListTile<String>(
        value: id,
        groupValue: _selectedCertificate,
        onChanged: (value) => setState(() => _selectedCertificate = value),
        activeColor: color,
        title: Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: darkText,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.caption.copyWith(
            color: accentPurple,
          ),
        ),
        secondary: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
      ),
    );
  }

  Future<void> _submitRequest() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedCertificate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a certificate type'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_overallRating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please rate your overall experience'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Prepare email content
    final selectedCert = _certificateOptions.firstWhere(
      (cert) => cert['id'] == _selectedCertificate,
    );

    final emailBody = '''
CERTIFICATE REQUEST & SURVEY SUBMISSION
=====================================

PERSONAL INFORMATION:
--------------------
Name: ${_nameController.text}
Email: ${_emailController.text}
Phone: ${_phoneController.text}
Organization: ${_organizationController.text}

CERTIFICATE REQUESTED:
---------------------
${selectedCert['title']}
${selectedCert['subtitle']}

CONFERENCE SURVEY:
-----------------
Overall Experience: $_overallRating/5 stars
Venue & Facilities: $_venueRating/5 stars
Quality of Speakers: $_speakersRating/5 stars
Organization: $_organizationRating/5 stars

ADDITIONAL FEEDBACK:
-------------------
$_feedback

=====================================
Submitted via ESSB & PATS Conference App
Date: ${DateTime.now().toString().split('.')[0]}
''';

    final emailSubject = 'Certificate Request - ${_nameController.text} - ${selectedCert['title']}';
    
    final emailUrl = Uri(
      scheme: 'mailto',
      path: 'essb_pats@foldergroup.com',
      query: 'subject=${Uri.encodeComponent(emailSubject)}&body=${Uri.encodeComponent(emailBody)}',
    );

    try {
      if (await canLaunchUrl(emailUrl)) {
        await launchUrl(emailUrl);
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Opening email app...'),
              backgroundColor: primaryPurple,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      } else {
        throw 'Could not launch email';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open email app. Please ensure you have an email client installed.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }
}