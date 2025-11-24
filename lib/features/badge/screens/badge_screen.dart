import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../config/theme/text_styles.dart';

class BadgeScreen extends StatefulWidget {
  const BadgeScreen({super.key});

  @override
  State<BadgeScreen> createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {
  // Conference Theme Colors
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;
  static const Color goldColor = Color(0xFFD4AF37);

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  bool _isDataSaved = false;
  String _qrData = '';
  String _completePhoneNumber = ''; // Full phone with country code

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // Load saved data
  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('badge_name') ?? '';
      _completePhoneNumber = prefs.getString('badge_phone') ?? '';
      _emailController.text = prefs.getString('badge_email') ?? '';
      
      if (_completePhoneNumber.isNotEmpty) {
        _isDataSaved = true;
        _generateQRData();
      }
    });
  }

  // Save data
  Future<void> _saveData() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('badge_name', _nameController.text);
      await prefs.setString('badge_phone', _completePhoneNumber);
      await prefs.setString('badge_email', _emailController.text);

      setState(() {
        _isDataSaved = true;
        _generateQRData();
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Badge information saved successfully!'),
            backgroundColor: primaryPurple,
          ),
        );
      }
    }
  }

  // Generate QR data - vCard format saves with Full Name
  void _generateQRData() {
    _qrData = 'BEGIN:VCARD\n'
        'VERSION:3.0\n'
        'FN:${_nameController.text}\n'
        'TEL:$_completePhoneNumber\n'
        'EMAIL:${_emailController.text}\n'
        'NOTE:ESSB & PATS 2025\n'
        'END:VCARD';
  }

  // Share on WhatsApp
  Future<void> _shareOnWhatsApp() async {
    final text = 'Connect with me at ESSB & PATS 2025!\n\n'
        'Name: ${_nameController.text}\n'
        'Phone: $_completePhoneNumber\n'
        'Email: ${_emailController.text}';
    
    final whatsappUrl = Uri.parse('https://wa.me/?text=${Uri.encodeComponent(text)}');
    
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open WhatsApp')),
        );
      }
    }
  }

  // Share via other apps
  Future<void> _shareViaOthers() async {
    final text = 'Connect with me at ESSB & PATS 2025!\n\n'
        'Name: ${_nameController.text}\n'
        'Phone: $_completePhoneNumber\n'
        'Email: ${_emailController.text}';
    
    await Share.share(text);
  }

  // Call phone number
  Future<void> _callPhone(String phone) async {
    final phoneUrl = Uri.parse('tel:$phone');
    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
    }
  }

  // Send email
  Future<void> _sendEmail(String email) async {
    final emailUrl = Uri.parse('mailto:$email');
    if (await canLaunchUrl(emailUrl)) {
      await launchUrl(emailUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        title: const Text('My Badge'),
        centerTitle: true,
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
        actions: [
          if (_isDataSaved)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isDataSaved = false;
                });
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: _isDataSaved ? _buildBadgeView() : _buildInputForm(),
      ),
    );
  }

  // Input Form
  Widget _buildInputForm() {
    return Form(
      key: _formKey,
      child: Column(
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
                    Icons.badge,
                    size: 60,
                    color: whiteColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Create Your Badge',
                  style: AppTextStyles.h2.copyWith(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Fill in your information to generate your conference badge',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: whiteColor.withOpacity(0.9),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Form Fields
          Container(
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
              children: [
                _buildTextField(
                  controller: _nameController,
                  label: 'Full Name',
                  icon: Icons.person,
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Please enter your name' : null,
                ),
                const SizedBox(height: 16),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                  initialCountryCode: 'EG', // Egypt default
                  dropdownTextStyle: AppTextStyles.bodyMedium.copyWith(
                    color: darkText,
                  ),
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: darkText,
                  ),
                  onChanged: (phone) {
                    _completePhoneNumber = phone.completeNumber;
                  },
                  validator: (phone) {
                    if (phone == null || phone.number.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _emailController,
                  label: 'Email Address',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email';
                    }
                    if (!value!.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Save Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _saveData,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryPurple,
                foregroundColor: whiteColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
              icon: const Icon(Icons.save),
              label: Text(
                'Generate Badge',
                style: AppTextStyles.h4.copyWith(color: whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Badge View
  Widget _buildBadgeView() {
    return Column(
      children: [
        // Digital Badge Card
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [primaryPurple, accentPurple],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: primaryPurple.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              // Conference Logo
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: whiteColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.medical_services,
                  size: 40,
                  color: primaryPurple,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                'ESSB & PATS 2025',
                style: AppTextStyles.h3.copyWith(
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              // QR Code
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: QrImageView(
                  data: _qrData,
                  version: QrVersions.auto,
                  size: 200,
                  backgroundColor: whiteColor,
                ),
              ),
              const SizedBox(height: 24),

              // User Info
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: whiteColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _nameController.text,
                  style: AppTextStyles.h3.copyWith(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Contact Info Card
        Container(
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
                'Contact Information',
                style: AppTextStyles.h4.copyWith(
                  color: darkText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildContactRow(
                Icons.phone,
                _completePhoneNumber,
                () => _callPhone(_completePhoneNumber),
              ),
              const SizedBox(height: 12),
              _buildContactRow(
                Icons.email,
                _emailController.text,
                () => _sendEmail(_emailController.text),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Share Section
        Container(
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
            children: [
              Row(
                children: [
                  Icon(Icons.share, color: primaryPurple, size: 24),
                  const SizedBox(width: 12),
                  Text(
                    'Share & Connect',
                    style: AppTextStyles.h4.copyWith(
                      color: darkText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Share your badge to network and connect with other attendees',
                style: AppTextStyles.bodySmall.copyWith(
                  color: accentPurple,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _shareOnWhatsApp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF25D366),
                        foregroundColor: whiteColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.chat),
                      label: const Text('WhatsApp'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _shareViaOthers,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentPurple,
                        foregroundColor: whiteColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.share),
                      label: const Text('More'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Scan QR Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              // TODO: Implement QR Scanner
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('QR Scanner feature coming soon!'),
                  backgroundColor: primaryPurple,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: goldColor,
              foregroundColor: darkText,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
            ),
            icon: const Icon(Icons.qr_code_scanner),
            label: Text(
              'Scan Attendee Badge',
              style: AppTextStyles.h4.copyWith(color: darkText),
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Instructions
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: goldColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: goldColor.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: goldColor, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Share your QR code with others to exchange contact information instantly!',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: darkText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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

  Widget _buildContactRow(IconData icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: lightBeige,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: primaryPurple, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: darkText,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: accentPurple),
          ],
        ),
      ),
    );
  }
}