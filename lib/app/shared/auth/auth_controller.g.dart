// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthController, Store {
  late final _$loginWithLocalDataAsyncAction =
      AsyncAction('_AuthController.loginWithLocalData', context: context);

  @override
  Future<dynamic> loginWithLocalData() {
    return _$loginWithLocalDataAsyncAction
        .run(() => super.loginWithLocalData());
  }

  late final _$loginWithEmailAsyncAction =
      AsyncAction('_AuthController.loginWithEmail', context: context);

  @override
  Future<dynamic> loginWithEmail({required String email}) {
    return _$loginWithEmailAsyncAction
        .run(() => super.loginWithEmail(email: email));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
