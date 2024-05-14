import 'package:flutter/material.dart';

class Choice {
  const Choice({
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
}

bool isDeveloper = true;

const List<Choice> choices = <Choice>[
  Choice(title: 'Manage Deals', icon: Icons.assignment_add),
  Choice(title: 'Profile', icon: Icons.person_2_outlined),
  Choice(title: 'Notification', icon: Icons.notifications_none_outlined),
  Choice(title: 'My Dependants', icon: Icons.call),
  Choice(title: 'Settings', icon: Icons.settings),
  Choice(title: 'Complaints', icon: Icons.person),
  Choice(title: 'Visitors', icon: Icons.people_alt_outlined),
  Choice(title: 'Contact Admin', icon: Icons.person),
  Choice(title: 'Parking Code', icon: Icons.qr_code),
  Choice(title: 'Access Control Code', icon: Icons.qr_code_2_outlined),
  Choice(title: 'Announcement', icon: Icons.announcement_rounded),
  Choice(title: 'Over Due Invoices', icon: Icons.library_books_outlined),
  Choice(title: 'Events', icon: Icons.history),
  // Choice(title: 'Messages', icon: Icons.message_outlined),
];
