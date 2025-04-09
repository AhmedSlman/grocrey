import 'package:flutter/material.dart';
import 'package:grocery/core/theme/app_colors.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.lightGrey,
                  child: Icon(Icons.arrow_back_ios_outlined),
                ),
                SizedBox(width: 10),
                const Text(
                  "الصفحة الرئيسية",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ProfilePicture(),
        ],
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
            image: DecorationImage(
              image: NetworkImage('https://example.com/profile.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.edit, color: Colors.white, size: 20),
        ),
      ],
    );
  }
}
