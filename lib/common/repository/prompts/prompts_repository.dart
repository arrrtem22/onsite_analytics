import 'package:cached_repository/cached_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:onsite_analytics/common/repository/prompts/prompts_state.dart';

@injectable
class PromptsRepository {
  PromptsRepository()
      : _cachedRepo = CachedRepository.persistent(
          'prompts',
          fetch: (_, [__]) async =>
              const PromptsState(prompts: ['one', 'two', 'three']),
          // random initial prompts
          decode: (json) => PromptsState.fromJson(json),
          cacheDuration: const Duration(days: 30000),
        );

  final CachedRepository<String, PromptsState> _cachedRepo;

  static const _key = '';

  Stream<List<String>> prompts() => _cachedRepo
      .stream(_key)
      .where((event) => event.hasData)
      .map((event) => event.data?.prompts ?? []);

  void setPrompts(List<String> prompts) {
    _cachedRepo.putValue(_key, PromptsState(prompts: prompts));
  }

  Future<void> addPrompt(String prompt) =>
      _cachedRepo.updateValue(_key, (value) {
        if (value?.prompts == null) return PromptsState(prompts: [prompt]);
        final prompts = value!.prompts.toList();
        if (prompts.contains(prompt)) {
          prompts.remove(prompt); // to change order
        }
        return PromptsState(prompts: prompts..add(prompt));
      });
}
