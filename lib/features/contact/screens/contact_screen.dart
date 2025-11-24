import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../config/theme/text_styles.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
        title: const Text('Contact Us'),
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
                  colors: [primaryPurple, accentPurple],
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.contact_support_rounded,
                    size: 50,
                    color: whiteColor,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Contact Us',
                    style: AppTextStyles.h3.copyWith(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We\'re the organizing company for the ESSB–PATS 2025 Congress.\nReach us anytime.',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: whiteColor.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Egypt Office
            _buildSectionTitle('Egypt Office', Icons.location_city),
            const SizedBox(height: 12),
            _buildOfficeCard(
              city: 'Alexandria, Egypt',
              address: '142 El-Shaheed Galal El-Desouky, Bab Sharqi WA Wabour Al Meyah, Alexandria',
              phones: [
                '+20 103 334 1374',
                '+20 103 334 1372',
                '+20 101 033 9007',
              ],
              mapUrl: 'https://maps.google.com/?q=142+El-Shaheed+Galal+El-Desouky,Bab+Sharqi,Alexandria,Egypt',
              context: context,
            ),

            const SizedBox(height: 24),

            // UAE Office
            _buildSectionTitle('UAE Office', Icons.location_city),
            const SizedBox(height: 12),
            _buildOfficeCard(
              city: 'Ras Al Khaimah, UAE',
              address: 'Compass Building, Al Shohada Road, AL Hamra Industrial Zone-FZ, Ras Al Khaimah, United Arab Emirates',
              phones: ['+971 56 932 1279'],
              mapUrl: 'https://maps.google.com/?q=Compass+Building,Al+Shohada+Road,Ras+Al+Khaimah,UAE',
              context: context,
            ),

            const SizedBox(height: 24),

            // Email Contacts
            _buildSectionTitle('Email Contacts', Icons.email_rounded),
            const SizedBox(height: 12),
            
            // Sponsorship
            _buildEmailSection(
              title: 'Sponsorship Inquiries',
              emails: ['Yehia.Magdy@foldergroup.com'],
              icon: Icons.business_center_rounded,
              color: accentPurple,
            ),
            
            const SizedBox(height: 12),
            
            // Registration & General
            _buildEmailSection(
              title: 'Registration & General Inquiries',
              emails: [
                'ESSB-PATS@foldergroup.com',
                'Mariam.Emad@foldergroup.com',
                'Sandra.Adel@foldergroup.com',
              ],
              icon: Icons.info_rounded,
              color: primaryPurple,
            ),

            const SizedBox(height: 24),

            // Social Media - Congress
            _buildSectionTitle('Congress Social Media', Icons.campaign_rounded),
            const SizedBox(height: 12),
            _buildSocialMediaCard(
              title: 'Follow Our Congress',
              context: context,
              platforms: [
                {
                  'name': 'Facebook',
                  'icon': Icons.facebook,
                  'url': 'https://www.facebook.com/profile.php?id=61573771034995',
                },
                {
                  'name': 'X (Twitter)',
                  'icon': Icons.close, // X icon
                  'url': 'https://twitter.com/ESSBPATS',
                },
                {
                  'name': 'LinkedIn',
                  'icon': Icons.work_rounded,
                  'url': 'https://www.linkedin.com/company/essbandpatsconference',
                },
              ],
            ),

            const SizedBox(height: 24),

            // Social Media - Folder Group
            _buildSectionTitle('Folder Group Social Media', Icons.business_rounded),
            const SizedBox(height: 12),
            _buildSocialMediaCard(
              title: 'Follow Folder Group',
              context: context,
              platforms: [
                {
                  'name': 'Facebook',
                  'icon': Icons.facebook,
                  'url': 'https://www.facebook.com/foldermiddleeast',
                },
                {
                  'name': 'Instagram',
                  'icon': Icons.camera_alt,
                  'url': 'https://www.instagram.com/foldermiddleeast',
                },
                {
                  'name': 'X (Twitter)',
                  'icon': Icons.close,
                  'url': 'https://twitter.com/FOLDERmiddleast',
                },
                {
                  'name': 'LinkedIn',
                  'icon': Icons.work_rounded,
                  'url': 'https://www.linkedin.com/company/folder-group',
                },
                {
                  'name': 'TikTok',
                  'icon': Icons.music_note,
                  'url': 'https://www.tiktok.com/@folder_group',
                },
                {
                  'name': 'YouTube',
                  'icon': Icons.play_circle_outline,
                  'url': 'https://www.youtube.com/@FolderGroup',
                },
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primaryPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
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
    );
  }

  Widget _buildOfficeCard({
    required String city,
    required String address,
    required List<String> phones,
    required String mapUrl,
    required BuildContext context,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // City
            Row(
              children: [
                Icon(Icons.location_on, color: primaryPurple, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    city,
                    style: AppTextStyles.h4.copyWith(
                      color: primaryPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Address
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: lightBeige.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                address,
                style: AppTextStyles.bodySmall.copyWith(
                  color: darkText,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Phones
            Text(
              'Phone Numbers:',
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: darkText,
              ),
            ),
            const SizedBox(height: 8),
            ...phones.map((phone) => _buildPhoneRow(phone, context)),

            const SizedBox(height: 16),

            // Map Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _launchURL(mapUrl, context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPurple,
                  foregroundColor: whiteColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.map, size: 20),
                label: const Text('Open in Google Maps'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneRow(String phone, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: primaryPurple.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: primaryPurple.withOpacity(0.2),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.phone, color: primaryPurple, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      phone,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: darkText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Copy Button
          IconButton(
            onPressed: () => _copyToClipboard(phone, context),
            icon: const Icon(Icons.copy, size: 18),
            color: accentPurple,
            tooltip: 'Copy',
            style: IconButton.styleFrom(
              backgroundColor: accentPurple.withOpacity(0.1),
            ),
          ),
          // Call Button
          IconButton(
            onPressed: () => _launchPhone(phone),
            icon: const Icon(Icons.call, size: 18),
            color: primaryPurple,
            tooltip: 'Call',
            style: IconButton.styleFrom(
              backgroundColor: primaryPurple.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailSection({
    required String title,
    required List<String> emails,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: darkText,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...emails.map((email) => _buildEmailRow(email, color)),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailRow(String email, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => _launchEmail(email),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: color.withOpacity(0.2),
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.email_outlined, color: color, size: 18),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  email,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: color, size: 14),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaCard({
    required String title,
    required List<Map<String, dynamic>> platforms,
    required BuildContext context,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: platforms.map((platform) {
                return _buildSocialButton(
                  name: platform['name'],
                  icon: platform['icon'],
                  url: platform['url'],
                  context: context,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String name,
    required IconData icon,
    required String url,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () => _launchURL(url, context),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: primaryPurple.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: primaryPurple.withOpacity(0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: primaryPurple, size: 20),
            const SizedBox(width: 8),
            Text(
              name,
              style: AppTextStyles.bodySmall.copyWith(
                color: primaryPurple,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url, BuildContext context) async {
    try {
      final Uri uri = Uri.parse(url);
      
      // Try different launch modes
      bool launched = false;
      
      // First try: External application
      try {
        if (await canLaunchUrl(uri)) {
          launched = await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
        }
      } catch (e) {
        launched = false;
      }
      
      // Second try: Platform default
      if (!launched) {
        try {
          launched = await launchUrl(
            uri,
            mode: LaunchMode.platformDefault,
          );
        } catch (e) {
          launched = false;
        }
      }
      
      // Third try: External non-browser
      if (!launched) {
        try {
          launched = await launchUrl(
            uri,
            mode: LaunchMode.externalNonBrowserApplication,
          );
        } catch (e) {
          launched = false;
        }
      }
      
      if (!launched && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not open: ${_getSocialMediaName(url)}'),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Copy Link',
              textColor: Colors.white,
              onPressed: () {
                Clipboard.setData(ClipboardData(text: url));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Link copied to clipboard!'),
                    backgroundColor: primaryPurple,
                  ),
                );
              },
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Copy Link',
              textColor: Colors.white,
              onPressed: () {
                Clipboard.setData(ClipboardData(text: url));
              },
            ),
          ),
        );
      }
    }
  }
  
  String _getSocialMediaName(String url) {
    if (url.contains('facebook')) return 'Facebook';
    if (url.contains('instagram')) return 'Instagram';
    if (url.contains('twitter') || url.contains('x.com')) return 'Twitter/X';
    if (url.contains('linkedin')) return 'LinkedIn';
    if (url.contains('tiktok')) return 'TikTok';
    if (url.contains('youtube')) return 'YouTube';
    if (url.contains('maps.google')) return 'Google Maps';
    return 'this link';
  }

  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=ESSB PATS 2025 Inquiry',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  void _launchPhone(String phone) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied: $text'),
        backgroundColor: primaryPurple,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}