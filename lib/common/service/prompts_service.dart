import 'package:injectable/injectable.dart';
import 'package:onsite_analytics/common/common.dart';

@injectable
class PromptsService {
  PromptsService({
    required PromptsRepository promptsRepository,
  }) : _promptsRepository = promptsRepository;

  final PromptsRepository _promptsRepository;

  Stream<List<String>> prompts() => _promptsRepository.prompts();

  Future<void> addPrompt(String prompt) => _promptsRepository.addPrompt(prompt);
}
