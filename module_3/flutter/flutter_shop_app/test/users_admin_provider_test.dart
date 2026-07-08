import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app/data/remote/api/userremotedatasource.dart';
import 'package:flutter_shop_app/domain/model/user.dart';
import 'package:flutter_shop_app/presentation/providers/usersadminprovider.dart';

class FakeUserRemoteDatasource implements UserRemoteDatasource {
  FakeUserRemoteDatasource(this._responses);

  final List<PaginatedUsers> _responses;
  int callCount = 0;

  @override
  Future<PaginatedUsers> getUsers({
    String? search,
    bool? isStaff,
    bool? isActive,
    int page = 1,
  }) async {
    callCount++;
    return _responses[page - 1];
  }

  @override
  Future<User> createUser(Map<String, dynamic> payload) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getStats() {
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(int id, Map<String, dynamic> payload) {
    throw UnimplementedError();
  }

  @override
  Future<bool> toggleActive(int id) {
    throw UnimplementedError();
  }
}

User _user(int id) => User(
      id: id,
      username: 'user$id',
      email: 'user$id@test.com',
      firstName: 'User',
      lastName: '$id',
      isStaff: false,
      isActive: true,
      dateJoined: '2024-01-01',
      numOrders: 0,
    );

void main() {
  test('loadMore appends users from the next page', () async {
    final datasource = FakeUserRemoteDatasource([
      PaginatedUsers(count: 2, next: 'next', results: [_user(1)]),
      PaginatedUsers(count: 2, next: null, results: [_user(2)]),
    ]);

    final container = ProviderContainer(
      overrides: [userDatasourceProvider.overrideWithValue(datasource)],
    );
    addTearDown(container.dispose);

    final notifier = container.read(usersAdminProvider.notifier);

    await notifier.load();
    expect(container.read(usersAdminProvider).users, hasLength(1));

    await notifier.loadMore();

    final state = container.read(usersAdminProvider);
    expect(state.users, hasLength(2));
    expect(state.users.map((u) => u.id), [1, 2]);
  });
}
