import 'media_library_initial_params.dart';

class MediaLibraryState {
final bool loading;
const MediaLibraryState({required this.loading});

factory MediaLibraryState.initial() => const MediaLibraryState(loading: false);

MediaLibraryState copyWith({bool? loading}) => MediaLibraryState(loading: loading??this.loading);
}
