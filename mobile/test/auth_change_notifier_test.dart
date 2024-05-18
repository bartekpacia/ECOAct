import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/state/auth_change_notifier.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  late MockFirebaseAuth mockAuth;
  late AuthChangeNotifier authChangeNotifier;
  late StreamController<User?> streamController;

  group('AuthChangeNotifier', () {
    setUp(() {
      mockAuth = MockFirebaseAuth();

      streamController = StreamController.broadcast();
      when(() => mockAuth.authStateChanges()).thenAnswer((_) {
        return streamController.stream;
      });

      authChangeNotifier = AuthChangeNotifier(auth: mockAuth);
    });

    tearDown(() {
      // streamController.close();
      // verify(() => mockAuth.dispose()).called(once);
    });

    test('user getter returns the current user from FirebaseAuth', () {
      final mockUser = MockUser();
      when(() => mockAuth.currentUser).thenReturn(mockUser);

      expect(authChangeNotifier.user, mockUser);
    });

    group('signUp', () {
      test('returns true on successful signup', () async {
        when(
          () => mockAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => MockUserCredential());

        final mockUser = MockUser();
        when(() => mockUser.updateDisplayName(any())).thenAnswer(
          (_) async {},
        );

        when(() => mockAuth.currentUser).thenReturn(mockUser);

        final result = await authChangeNotifier.signUp(
          email: '',
          displayName: '',
          password: '',
        );

        expect(result, true);
      });

      test('returns false on FirebaseAuthException', () async {
        final error = FirebaseAuthException(code: 'some-error');
        when(
          () => mockAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(error);

        final result = await authChangeNotifier.signUp(
          email: '',
          displayName: '',
          password: '',
        );

        expect(result, false);
      });

      test('rethrows other exceptions', () async {
        final error = Exception();
        when(
          () => mockAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(error);

        expect(
          () => authChangeNotifier.signUp(
            email: '',
            displayName: '',
            password: '',
          ),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('signIn', () {
      test('returns true on successful signin', () async {
        when(
          () => mockAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => MockUserCredential());

        final result = await authChangeNotifier.signIn(email: '', password: '');

        expect(result, true);
      });

      test('returns false on FirebaseAuthException', () async {
        final error = FirebaseAuthException(code: 'some-error');
        when(
          () => mockAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(error);

        final result = await authChangeNotifier.signIn(email: '', password: '');

        expect(result, false);
      });

      test('rethrows other exceptions', () async {
        final error = Exception();
        when(
          () => mockAuth.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(error);

        expect(
          () => authChangeNotifier.signIn(email: '', password: ''),
          throwsA(isA<Exception>()),
        );
      });
    });

    test('signOut calls signOut on FirebaseAuth', () async {
      when(() => mockAuth.signOut()).thenAnswer((_) async {});

      await authChangeNotifier.signOut();

      verify(() => mockAuth.signOut()).called(1);
    });
  });
}
