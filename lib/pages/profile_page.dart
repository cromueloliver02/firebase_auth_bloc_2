import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const id = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image:
                    'https://images.pexels.com/photos/2775196/pexels-photo-2775196.jpeg',
                height: 350,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                'Profile Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(
                        Icons.fingerprint,
                        size: 30,
                      ),
                      title: Text('few3-d3rdfef-f32f-f23frwef'),
                      subtitle: Text('Account ID'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        size: 30,
                      ),
                      title: Text('Cromuel Barut'),
                      subtitle: Text('Name'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.email,
                        size: 30,
                      ),
                      title: Text('crom@gmail.com'),
                      subtitle: Text('Email Address'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.score,
                        size: 30,
                      ),
                      title: Text('0'),
                      subtitle: Text('Points'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.emoji_events,
                        size: 30,
                      ),
                      title: Text('Bronze'),
                      subtitle: Text('Rank'),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
