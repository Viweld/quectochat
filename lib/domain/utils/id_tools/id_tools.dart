import 'dart:convert';

import 'package:crypto/crypto.dart';

final class IdTools {
  static String getChatId(List<String> strings) {
    // Сортируем список для игнорирования порядка
    strings.sort();

    // Объединяем строки в одну
    var combinedString = strings.join(',');

    // Создаем хэш с использованием SHA-256
    var bytes = utf8.encode(combinedString); // Преобразуем строку в байты
    var digest = sha256.convert(bytes); // Генерируем хэш

    // Возвращаем хэш как строку
    return digest.toString();
  }
}
