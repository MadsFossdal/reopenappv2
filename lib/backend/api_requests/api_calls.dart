import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AddCall {
  static Future<ApiCallResponse> call({
    String? customerId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'add',
      apiUrl:
          'https://external-api.broadnet.no/homenet/crm/api/case/CreateCase?clientId=da127681-a030-496d-8b1c-4670cd33e8dd',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'CustomerId': customerId,
        'ShortDescription': "Faktura Gjenåpning",
        'Description': "SMS Gjenåpning",
        'CaseType': "Invoice",
        'Origin': 3,
        'CaseSubType': "Reopening",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      cache: false,
    );
  }

  static dynamic saksnummer(dynamic response) => getJsonField(
        response,
        r'''$.CaseNumber''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
