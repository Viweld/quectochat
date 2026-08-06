import 'package:home/data/dto/user_dto.dart';
import 'package:home/domain/entities/current_user.dart';
import 'package:home/domain/entities/family_role.dart';

CurrentUser mapUserDtoToCurrentUser(UserDto dto) {
  return CurrentUser(
    userId: dto.userId,
    displayName: dto.displayName,
    familyRole: _parseFamilyRole(dto.familyRole),
    inviterId: dto.inviterId,
  );
}

FamilyRole? _parseFamilyRole(String? value) {
  return switch (value) {
    'parent' => FamilyRole.parent,
    'child' => FamilyRole.child,
    _ => null,
  };
}
