import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import '../../../config/theme/text_styles.dart';
import '../../badge/screens/badge_screen.dart';
import '../../workshops/screens/workshops_screen.dart';
import '../../bookmarks/screens/bookmarks_screen.dart';
import '../../about/screens/about_screen.dart';
import '../../maps/screens/maps_screen.dart';
import '../../gallery/screens/gallery_screen.dart';
import '../../certificate/screens/certificate_screen.dart';
import '../../sponsers/screens/sponsers_screen.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  // Conference Theme Colors
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);
  static const Color whiteColor = Colors.white;
  static const Color goldColor = Color(0xFFD4AF37);

final ScrollController _scrollController = ScrollController();
double scrollSpeed = 40; // pixels per second

@override
void initState() {
  super.initState();
  _startAutoScroll();
}

void _startAutoScroll() {
  Future.delayed(const Duration(milliseconds: 300), () {
    _autoScroll();
  });
}

void _autoScroll() async {
  if (!mounted) return;

  final maxScroll = _scrollController.position.maxScrollExtent;

  await _scrollController.animateTo(
    maxScroll,
    duration: Duration(seconds: (maxScroll / scrollSpeed).round()),
    curve: Curves.linear,
  );

  if (!mounted) return;

  _scrollController.jumpTo(0);
  _autoScroll();
}

@override
void dispose() {
  _scrollController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    // Conference start: December 3, 2025 at 8:00 AM
    final conferenceDate = DateTime(2025, 12, 3, 8, 0);
    final endTime = conferenceDate.millisecondsSinceEpoch;

    return Scaffold(
      backgroundColor: lightBeige,
      appBar: AppBar(
        backgroundColor: primaryPurple,
        foregroundColor: whiteColor,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: whiteColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.medical_services, size: 20),
            ),
            const SizedBox(width: 8),
            const Text('ESSB & PATS 2025'),
          ],
        ),
        actions: [
          // Search Icon
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ConferenceSearchDelegate(),
              );
            },
          ),
          // Notifications Icon
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('No new notifications'),
                  backgroundColor: primaryPurple,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildBannerCarousel(),
            const SizedBox(height: 24),
            _buildCountdownSection(endTime),
            const SizedBox(height: 24),
            _buildAccreditationBar(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Quick Access',
                style: AppTextStyles.h3.copyWith(
                  color: darkText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildQuickActions(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }


  Widget _buildBannerCarousel() {
    // Egyptian themed colors from the banner image
    final List<String> banners = [
  'assets/images/designs.jpeg',
  'assets/images/design3.jpeg',
  'assets/images/design2.jpeg',
  'assets/images/design4.jpeg'];
return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayCurve: Curves.easeInOut,
      ),

items: banners.map((imgPath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.fill, //stretched shwaya , contain mkhlyaha cropped
              ),
          
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          );
        },
      );
    }).toList(),
  );
}




  Widget _buildAccreditationBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [primaryPurple, accentPurple],
        ),
      ),
      child: ListView.builder(      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(), // prevent touch
      itemCount: 25, // long loop = smooth scrolling
      itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                // Accreditation Logo
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset(
  'assets/images/AACME.png', 
  width: 26,
  height: 26, 
)
                ),
                const SizedBox(width: 16),
                // Text
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Accredited by',
                      style: AppTextStyles.caption.copyWith(
                        color: whiteColor.withOpacity(0.9),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '37 CME Hours',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 32),
                // Divider
                Container(
                  height: 40,
                  width: 2,
                  decoration: BoxDecoration(
                    color: whiteColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCountdownSection(int endTime) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.access_time, color: whiteColor, size: 24),
              const SizedBox(width: 8),
              Text(
                'Congress Starts In',
                style: AppTextStyles.h4.copyWith(
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'December 3, 2025 • 8:00 AM',
            style: AppTextStyles.caption.copyWith(
              color: whiteColor.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 20),
          CountdownTimer(
            endTime: endTime,
            widgetBuilder: (_, time) {
              if (time == null) {
                return Column(
                  children: [
                    const Icon(Icons.celebration, color: goldColor, size: 48),
                    const SizedBox(height: 8),
                    Text(
                      'Congress Started!',
                      style: AppTextStyles.h3.copyWith(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTimeCard(time.days ?? 0, 'Days'),
                  _buildTimeCard(time.hours ?? 0, 'Hours'),
                  _buildTimeCard(time.min ?? 0, 'Min'),
                  _buildTimeCard(time.sec ?? 0, 'Sec'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimeCard(int value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: primaryPurple,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: accentPurple,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      {
        'icon': Icons.badge_outlined,
        'label': 'My Badge',
        'screen': const BadgeScreen(),
        'color': primaryPurple,
      },
      {
        'icon': Icons.work_outline,
        'label': 'Workshops',
        'screen': const WorkshopsScreen(),
        'color': accentPurple,
      },
      {
        'icon': Icons.bookmark_outline,
        'label': 'Bookmarks',
        'screen': const BookmarksScreen(),
        'color': goldColor,
      },
      {
        'icon': Icons.info_outline,
        'label': 'About',
        'screen': const AboutScreen(),
        'color': const Color(0xFF2196F3),
      },
      {
        'icon': Icons.map_outlined,
        'label': 'Maps',
        'screen': const MapsScreen(),
        'color': const Color(0xFF4CAF50),
      },
      // {
      //   'icon': Icons.photo_library_outlined,
      //   'label': 'Gallery',
      //   'screen': const GalleryScreen(),
      //   'color': const Color(0xFFE91E63),
      // },
      {
        'icon': Icons.card_membership_outlined,
        'label': 'Certificate',
        'screen': const CertificateScreen(),
        'color': const Color(0xFFFF9800),
      },
      {
        'icon': Icons.handshake_outlined,
        'label': 'Partners',
        'screen': const SponsersScreen(),
        'color': const Color(0xFF9C27B0),
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85,
        ),
        itemCount: actions.length,
        itemBuilder: (context, index) {
          final action = actions[index];
          return _buildActionCard(
            context,
            action['icon'] as IconData,
            action['label'] as String,
            action['screen'] as Widget,
            action['color'] as Color,
          );
        },
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    IconData icon,
    String label,
    Widget screen,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
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
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 28,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                label,
                style: AppTextStyles.caption.copyWith(
                  fontWeight: FontWeight.w600,
                  color: darkText,
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Search Delegate
class ConferenceSearchDelegate extends SearchDelegate<String> {
  static const Color primaryPurple = Color(0xFF3D2B5C);
  static const Color lightBeige = Color(0xFFF5E6D3);
  static const Color accentPurple = Color(0xFF6B5189);
  static const Color darkText = Color(0xFF2C1B3D);

  final List<Map<String, dynamic>> searchItems = [
    {'title': 'Program', 'subtitle': 'Conference schedule', 'icon': Icons.calendar_today},
    {'title': 'Speakers', 'subtitle': 'Faculty & presenters', 'icon': Icons.people},
    {'title': 'Workshops', 'subtitle': 'Pre-conference workshops', 'icon': Icons.work_outline},
    {'title': 'Maps', 'subtitle': 'Venue & floor plan', 'icon': Icons.map},
    {'title': 'Gallery', 'subtitle': 'Photo gallery', 'icon': Icons.photo_library},
    {'title': 'Certificate', 'subtitle': 'Request certificate', 'icon': Icons.card_membership},
    {'title': 'Sponsors', 'subtitle': 'Our partners', 'icon': Icons.handshake},
    {'title': 'About', 'subtitle': 'Conference info', 'icon': Icons.info},
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: primaryPurple,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryPurple,
        foregroundColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = searchItems.where((item) {
      return item['title'].toString().toLowerCase().contains(query.toLowerCase()) ||
          item['subtitle'].toString().toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Container(
      color: lightBeige,
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final item = results[index];
          return ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: primaryPurple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(item['icon'], color: primaryPurple),
            ),
            title: Text(
              item['title'],
              style: const TextStyle(color: darkText, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              item['subtitle'],
              style: const TextStyle(color: accentPurple),
            ),
            onTap: () {
              close(context, item['title']);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opening ${item['title']}...')),
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? searchItems
        : searchItems.where((item) {
            return item['title'].toString().toLowerCase().contains(query.toLowerCase()) ||
                item['subtitle'].toString().toLowerCase().contains(query.toLowerCase());
          }).toList();

    return Container(
      color: lightBeige,
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final item = suggestions[index];
          return ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: primaryPurple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(item['icon'], color: primaryPurple),
            ),
            title: Text(
              item['title'],
              style: const TextStyle(color: darkText, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              item['subtitle'],
              style: const TextStyle(color: accentPurple),
            ),
            onTap: () {
              query = item['title'];
              showResults(context);
            },
          );
        },
      ),
    );
  }
}