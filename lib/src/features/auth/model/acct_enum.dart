
import '../../../../packages.dart';

final acctTypeProvider = StateProvider<AccountType>((ref) {
  return AccountType.user;
});

enum AccountType {
  user,
  agent
}