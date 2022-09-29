import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
class Categorys extends Equatable{
  final String name;
  final String imageUrl;
   Categorys({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
    name,imageUrl,
  ];
  static Categorys fromSnapshot(DocumentSnapshot snap){
    Categorys categorys = Categorys(name: snap['name'],imageUrl:snap['imageUrl']);
    return categorys;
  }
}