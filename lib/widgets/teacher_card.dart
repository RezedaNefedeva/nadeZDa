
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nadezda/animation/custom_page_route.dart';
import 'package:nadezda/export.dart';
import 'package:nadezda/widgets/shared_data.dart';

class TeacherCard extends StatefulWidget {
  const TeacherCard({super.key,
    required this.teacher_surname,
    required this.teacher_name,
    required this.teacher_lastname,
    required this.teacher_profession,
    required this.push
  });
  final String teacher_surname;
  final String teacher_name;
  final String teacher_lastname;
  final String teacher_profession;
  final VoidCallback push;

  @override
  State<TeacherCard> createState() => _TeacherCardState();
}

class _TeacherCardState extends State<TeacherCard> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10,),
      child: InkWell(
          onTap: widget.push,
          child: GreyBtn(
              width: MediaQuery.of(context).size.width-40,
              height: 120,
              first_text: widget.teacher_surname,
              first_text_style: theme.textTheme.bodyMedium,
              second_text: widget.teacher_name,
              second_text_style: theme.textTheme.labelLarge,
              third_text: widget.teacher_lastname,
              third_text_style: theme.textTheme.labelLarge,
              fouth_text: widget.teacher_profession,
              fouth_text_style: theme.textTheme.bodyLarge,
          ),
        ),
    );
  }
}
