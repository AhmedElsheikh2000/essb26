class OnboardingModel {
  final String title;
  final String description;
  final String icon; // Emoji or icon representation

  OnboardingModel({
    required this.title,
    required this.description,
    required this.icon,
  });
}

List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    title: 'Welcome to ESSB & PATS\nConference 2025',
    description: 'Join the 24th Annual Conference of the Egyptian Scientific Society of Bronchology and the 4th Biennial Conference of the Pan African Thoracic Society in Cairo, Egypt',
    icon: '🌍',
  ),
  OnboardingModel(
    title: 'Explore Conference\nProgram & Schedule',
    description: 'Access comprehensive information about conference sessions, workshops, keynote speakers, and scientific presentations scheduled from December 3-5, 2025',
    icon: '📅',
  ),
  OnboardingModel(
    title: 'Connect with\nProfessionals Worldwide',
    description: 'Network with leading experts, researchers, and healthcare professionals from across Africa and the Middle East region at Marriott, Zamalek',
    icon: '🤝',
  ),
];