import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String formatTimestamp(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  return DateFormat.jm().format(dateTime); // Formats as hh:mm a
}