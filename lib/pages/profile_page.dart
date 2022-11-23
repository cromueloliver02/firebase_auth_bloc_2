import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recase/recase.dart';

import '../models/models.dart';
import '../blocs/blocs.dart';
import '../cubits/cubits.dart';
import '../utils/utils.dart';

class ProfilePage extends StatefulWidget {
  static const id = '/profile';

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _fetchProfile() {
    final uid = context.read<AuthBloc>().state.user!.uid;
    context.read<ProfileCubit>().fetchProfile(uid);
  }

  void _profileListener(BuildContext ctx, ProfileState state) {
    if (state.status == ProfileStatus.error) {
      showErrorMessageDialog(ctx, state.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: _profileListener,
        builder: (ctx, state) {
          final status = state.status;

          if (status == ProfileStatus.initial) return const SizedBox.shrink();

          if (status == ProfileStatus.loading) return const _Loader();

          if (status == ProfileStatus.error) return const _ErrorMessage();

          final User user = state.user;

          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: user.profileImage,
                  height: 400,
                  width: double.infinity,
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
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.fingerprint,
                          size: 30,
                        ),
                        title: Text(user.id),
                        subtitle: const Text('Account ID'),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: Text(user.name),
                        subtitle: const Text('Name'),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(
                          Icons.email,
                          size: 30,
                        ),
                        title: Text(user.email),
                        subtitle: const Text('Email Address'),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(
                          Icons.score,
                          size: 30,
                        ),
                        title: Text('${user.point}'),
                        subtitle: const Text('Points'),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(
                          Icons.emoji_events,
                          size: 30,
                        ),
                        title: Text(user.rank.titleCase),
                        subtitle: const Text('Rank'),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }
}

class _Loader extends StatelessWidget {
  const _Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_a2chheio.json',
            width: 200,
          ),
          const SizedBox(height: 10),
          const Text(
            'LOADING...',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/error.png',
            width: 75,
            height: 75,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          const Text(
            'Something went wrong\nPlease try again',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
