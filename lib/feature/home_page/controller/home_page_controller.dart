import 'package:get/get.dart';

class HomePageController extends GetxController {
  var tasks = <Task>[
    Task(
      title: "Beautiful Lake",
      subtitle: "Relax and enjoy nature",
      description: "Create a clean, responsive header section for the landing page. Include logo, navigation menu, search bar, and a primary call-to-action button. Ensure mobile responsiveness and use the brand green",
    ),
    Task(
      title: "Mountain View",
      subtitle: "Adventure awaits",
       description: "Create a clean, responsive header section for the landing page. Include logo, navigation menu, search bar, and a primary call-to-action button. Ensure mobile responsiveness and use the brand green",
    ),
    Task(
      title: "City Lights",
      subtitle: "Feel the nightlife",
       description: "Create a clean, responsive header section for the landing page. Include logo, navigation menu, search bar, and a primary call-to-action button. Ensure mobile responsiveness and use the brand green",
    ),
    Task(
      title: "Mountain View",
      subtitle: "Adventure awaits",
       description: "Create a clean, responsive header section for the landing page. Include logo, navigation menu, search bar, and a primary call-to-action button. Ensure mobile responsiveness and use the brand green",
    ),
    Task(
      title: "City Lights",
      subtitle: "Feel the nightlife",
       description: "Create a clean, responsive header section for the landing page. Include logo, navigation menu, search bar, and a primary call-to-action button. Ensure mobile responsiveness and use the brand green",
    ),
  ].obs;
}

class Task {
  final String title;
  final String subtitle;
  final String description;

  Task({
    required this.title,
    required this.subtitle,
    required this.description,
  });
}
