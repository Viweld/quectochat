import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class BlocHelper {
  static EventTransformer<T> selectiveEventTransformer<T>(
    Map<Type, EventTransformer<T>> transformers,
  ) {
    return (events, mapper) {
      return events.transform(
        StreamTransformer.fromBind((stream) {
          return stream.asyncExpand((event) {
            // Выбираем нужный EventTransformer или по умолчанию concurrent<T>()
            final eventTransformer =
                transformers[event.runtimeType] ?? concurrent<T>();

            // Применяем EventTransformer
            return eventTransformer(
              Stream.value(event),
              mapper,
            );
          });
        }),
      );
    };
  }
}
