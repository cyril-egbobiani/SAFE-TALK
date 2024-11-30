import 'package:flutter/material.dart';
import 'package:safetalk/helpers/functions/navigation.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CategoriesScreen(),
//     );
//   }
// }

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  static const String path = '/Category';

  final List<Map<String, String>> categories = [
    {
      'title': 'Balancing academic as a Tech Bro | Sis',
      'image':
          'https://via.placeholder.com/150', // Replace with actual image URL
    },
    {
      'title': 'Mental stress from academics',
      'image':
          'https://via.placeholder.com/150', // Replace with actual image URL
    },
    {
      'title': 'Can I still get that CGPA?',
      'image':
          'https://via.placeholder.com/150', // Replace with actual image URL
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            pushReplacement(page: 'BottomNavBar');
          },
        ),
        title: const Text('CategoriesS'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    // child: Image.network(
                    //   category['image']!,
                    //   width: 100,
                    //   height: 100,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      category['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Join button click
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Join'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
