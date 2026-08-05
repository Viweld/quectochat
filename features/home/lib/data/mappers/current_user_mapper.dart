import 'package:home/data/dto/user_dto.dart';
import 'package:home/domain/entities/current_user.dart';

CurrentUser mapUserDtoToCurrentUser(UserDto dto) {
  return CurrentUser(userId: dto.userId, firstName: dto.firstName, lastName: dto.lastName);
}
