// import 'package:esmartpms/controller/profile_controller/profile_controller.dart';
// import 'package:flutter/material.dart';
// import 'profile_controller.dart';

// class ProfileEditScreen extends StatefulWidget {
//   const ProfileEditScreen({Key? key}) : super(key: key);

//   @override
//   _ProfileEditScreenState createState() => _ProfileEditScreenState();
// }

// class _ProfileEditScreenState extends State<ProfileEditScreen> {
//   final ProfileController profileController = ProfileController();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;
//   String _message = '';

//   void _editProfile() async {
//     setState(() {
//       _isLoading = true;
//       _message = '';
//     });

//     try {
//       final result = await profileController.fetchUserProfile(
//         '442',
//         _nameController.text,
//         _emailController.text,
//         _passwordController.text,
//       );

//       setState(() {
//         _message = result['message'] ?? 'Profile updated successfully';
//         _isLoading = false;
//       });
//     } catch (error) {
//       setState(() {
//         _message = 'Error updating profile: $error';
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             _isLoading
//                 ? const CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: _editProfile,
//                     child: const Text('Update Profile'),
//                   ),
//             const SizedBox(height: 20),
//             Text(_message),
//           ],
//         ),
//       ),
//     );
//   }
// }
