import '../model/agent_job.dart';
import '../model/create_job.dart';
import '../model/job_model.dart';
import '../model/job_type.dart';
import '../repository/job_repo.dart';
import '/packages.dart';
import '/src/features/jobs/model/job_full.dart';
import 'job_enum.dart';

final jobControlerProvider = StateNotifierProvider<JobControler, bool>((ref) {
  return JobControler(jobRepository: ref.watch(jobRepoProvider), ref: ref);
});

final allJobProvider = FutureProvider<List<JobModel>>((ref) async {
  return ref.read(jobControlerProvider.notifier).getAlljobs();
});
final jobFullDetailProvider =
    FutureProvider.family<EditJob, String>((ref, jobId) async {
  return ref.read(jobControlerProvider.notifier).getFullJobDetail(jobId);
});
final allJobTypeProvider = FutureProvider<List<OptionsType>>((ref) async {
  final res = await ref.read(jobControlerProvider.notifier).getJobType();
  ref.read(jobTypeListProvider.notifier).update((state) {
    state.addAll(res);
    return state;
  });
  return res;
});

final allAgentJobProvider = FutureProvider<List<AgentJobModel>>((ref) async {
  return ref.read(jobControlerProvider.notifier).getAllAgentjobs();
});

final getJobByIdProvider =
    FutureProvider.family<JobFullDetails, String>((ref, id) async {
  return ref.read(jobControlerProvider.notifier).getJobsById(id);
});

final JobDurationProvider = StateProvider<JobDuration>((ref) {
  return JobDuration.days;
});

final jobTypeListProvider = StateProvider<List<OptionsType>>((ref) {
  List<OptionsType> jobType = [
    OptionsType(
      id: '001',
      name: 'Select job type',
    )
  ];
  return jobType;
});

class JobControler extends StateNotifier<bool> {
  Ref _ref;
  JobRepository _jobRepository;
  JobControler({required JobRepository jobRepository, required Ref ref})
      : _jobRepository = jobRepository,
        _ref = ref,
        super(false);

  Future<List<JobModel>> getAlljobs() async {
    final res = await _jobRepository.getAlljobs();
    return res.fold(
        (l) => AppConfig.handleErrorMessage(l.error), (jobs) => jobs);
  }

  Future<List<AgentJobModel>> getAllAgentjobs() async {
    final res = await _jobRepository.getAllAgentjobs();
    return res.fold(
        (l) => AppConfig.handleErrorMessage(l.error), (jobs) => jobs);
  }

  Future<JobFullDetails> getJobsById(String id) async {
    final res = await _jobRepository.getJobsById(id);
    return res.fold(
        (l) => AppConfig.handleErrorMessage(l.error), (jobs) => jobs);
  }

  createJob(BuildContext context, CreateJob job) async {
    state = true;
    final res = await _jobRepository.createJob(job);
    return res.fold((l) {
      state = false;
      AppConfig.handleErrorMessage(l.error);
    }, (_) async {
      AppConfig.showToast('Job successfully submitted');
      await Future.delayed(Duration(seconds: 3)).then((value) => pop(context));
      state = false;
      await _ref.refresh(allAgentJobProvider.future);
    });
  }

  updateJob(BuildContext context, CreateJob job, String id) async {
    state = true;
    final res = await _jobRepository.updateJob(job, id);
    return res.fold((l) {
      state = false;
      AppConfig.handleErrorMessage(l.error);
    }, (_) async {
      AppConfig.showToast('Job successfully updated');
      await Future.delayed(Duration(seconds: 3)).then((value) => pop(context));
      state = false;
      await _ref.refresh(allAgentJobProvider.future);
    });
  }

  deleteJob(BuildContext context, String id) async {
    state = true;
    final res = await _jobRepository.deleteJob(id);
    return res.fold((l) {
      state = false;
      AppConfig.handleErrorMessage(l.error);
    }, (_) async {
      AppConfig.showToast('Job successfully deleted');
      await Future.delayed(Duration(seconds: 3)).then((value) => pop(context));
      state = false;
      await _ref.refresh(allAgentJobProvider.future);
    });
  }

  Future<List<OptionsType>> getJobType() async {
    final res = await _jobRepository.getJobType();
    return res.fold(
        (l) => AppConfig.handleErrorMessage(l.error), (data) => data);
  }

  Future<EditJob> getFullJobDetail(String job) async {
    print('call this');
    final res = await _jobRepository.getFullJobDetail(job);
    return res.fold(
        (l) => AppConfig.handleErrorMessage(l.error), (data) => data);
  }
}
