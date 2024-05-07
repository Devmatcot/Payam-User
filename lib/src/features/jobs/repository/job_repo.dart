import 'package:fpdart/fpdart.dart';

import '../../../../packages.dart';
import '../model/agent_job.dart';
import '../model/create_job.dart';
import '../model/job_model.dart';
import '../model/job_type.dart';
import '/src/features/jobs/model/job_full.dart';

final jobRepoProvider = Provider<JobRepository>((ref) {
  return JobRepository(
      dioClient: ref.watch(dioClientProvider),
      localStorage: ref.watch(localStorageProvider));
});

class JobRepository {
  final DioClient _dioClient;
  final LocalStorage _localStorage;
  JobRepository(
      {required DioClient dioClient, required LocalStorage localStorage})
      : _dioClient = dioClient,
        _localStorage = localStorage;

  FutureEither<List<JobModel>> getAlljobs() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.allJobs,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      List jobs = res.data['data'];
      return right(jobs.map((json) => JobModel.fromJson(json)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<List<AgentJobModel>> getAllAgentjobs() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.allAgentJobs,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      List jobs = res.data['data'];
      print(jobs);
      return right(jobs.map((json) => AgentJobModel.fromJson(json)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<JobFullDetails> getJobsById(String id) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.getJobDetailbyId(id),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      final jobs = res.data['data'];

      return right(JobFullDetails.fromJson(jobs));
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureVoid createJob(CreateJob job) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      print(job.toJson());
      await _dioClient.post(
        Endpoints.createJobs,
        data: job.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return right(null);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureVoid updateJob(CreateJob job, String id) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      print(job.toJson());
      await _dioClient.patch(
        Endpoints.updateJobById(id),
        data: job.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return right(null);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureVoid deleteJob(String id) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);

      await _dioClient.delete(
        Endpoints.deleteJobById(id),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return right(null);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<List<OptionsType>> getJobType() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.allJobsType,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      List jobType = res.data['data'];
      return right(jobType.map((e) => OptionsType.fromJson(e)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<EditJob> getFullJobDetail(String job) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);

      final res = await _dioClient.get(
        Endpoints.getJobFullDetailbyId(job),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      print(res.data);
      return right(EditJob.fromJson(res.data['data']));
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }
}
