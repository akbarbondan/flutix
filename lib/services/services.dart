import 'dart:convert';
import 'dart:core';

import 'package:bwa_fllutix/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bwa_fllutix/extension/extensions.dart';
import 'package:bwa_fllutix/shared/shared.dart';
import 'package:http/http.dart' as http;
part 'auth_services.dart';
part 'user_services.dart';
part 'movie_services.dart';
part 'tickets_services.dart';
part 'transaction_services.dart';