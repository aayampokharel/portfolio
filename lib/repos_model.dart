import 'package:flutter/material.dart';
import 'dart:io';

class ReposModel {
  final String? topic;
  final List<String>? technologiesUsed;
  final String? description;
  final String? githubLink;
  final String? imgURL;
  final String? youtubeLink;
  ReposModel(
      {required this.topic,
      required this.githubLink,
      required this.youtubeLink,
      required this.description,
      required this.technologiesUsed,
      required this.imgURL});
}
