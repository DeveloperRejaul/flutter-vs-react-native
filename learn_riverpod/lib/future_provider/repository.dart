// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

// User model
@immutable
class User {
  final String name;
  const User({
    required this.name,
  });

  //  automatically crate all of fn when we click dart data class generator

  User copyWith({
    String? name,
  }) {
    return User(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

// creating a simple repo provider
@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(ref);
}

// creating a repo for contain all future function
class UserRepository {
  final Ref ref;
  UserRepository(this.ref);

  Future<User> getUser() async {
    String url = "https://jsonplaceholder.typicode.com/users/1";
    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }
}
