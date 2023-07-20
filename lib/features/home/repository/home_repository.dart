import 'dart:convert';

import 'package:logger/logger.dart';

import '../../../components/base/base_repository.dart';
import '../../../components/util/state.dart';
import '../model/home_model.dart';
import 'home_datasource.dart';

class DummyRepository extends BaseRepository {
  final DummyDataSource _dataSource;
  final _logger = Logger();
  DummyRepository(this._dataSource);

  void loadFoods({
    required ResponseHandler<List<SampleModel>> response,
  }) async {
    try {
      final data = await _dataSource.apiFoods().then((value) {
        // Parse the JSON data
        final parsedData = jsonDecode(value);
        List<dynamic> teams = parsedData['teams'];

        // Convert the list of teams to List<SampleModel>
        List<SampleModel> items = teams
            .map((team) => SampleModel.fromJson(team))
            .toList(); // Assuming SampleModel.fromJson is correctly implemented.

        return items;
      });
      response.onSuccess.call(data);
      response.onDone.call();
    } catch (e) {
      _logger.e(e);
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
