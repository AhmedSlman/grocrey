import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "البيانات الشخصية",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://example.com/profile.jpg",
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "محمد علي",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text("+201029673915", style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),

          // Listview.
        ],
      ),
    );
  }
}

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.person, size: 30),
        const SizedBox(width: 10),
        const Text("البيانات الشخصية", style: TextStyle(fontSize: 18)),
        const Spacer(),
        Icon(Icons.arrow_forward_ios, size: 20),
      ],
    );
  }
}
