// Import the test package and Counter class
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prof_d/api_prof_d/api_json.models.swagger.dart';
import 'package:prof_d/modules/account/repos/account_repo.dart';

var result = [
  {
    "firstname": "eyden",
    "lastname": "lemaine",
    "id": "621d6e533c0b959d2e8e2e72"
  },
  {
    "firstname": "eyden",
    "lastname": "lemaine",
    "id": "62520fc153ed6fe1f5a15741"
  },
  {
    "firstname": "eyden",
    "lastname": "lemaine",
    "id": "6252123064f6540582fa0802"
  },
  {
    "firstname": "eyden3",
    "lastname": "lemaine2",
    "id": "6252123c64f6540582fa080b"
  }
];

var newChild = AddChildDto.fromJson({
  "firstname": "eyden3",
  "lastname": "lemaine2",
  "dateOfBirth": "2021-05-25T00:00:00.0Z",
  "numberOfBrotherAndSister": 2,
  "placeInTheSiblingGroup": "Au fond de la classe",
  "placeOfSchooling": "Vichy",
  "classLevel": "CE2",
  "followUpsInProgress": "Orthophoniste",
  "identifiedDisordersAndOrDifficulties":
  "Il ne parle pas quand et il a du mal à ce mélanger au autre",
  "arrangementsInTheClassroom": "Horaires aménagés"
});

final addChildProvider = FutureProvider((ref) async {
  final accountRepository = ref.read(accountRepositoryProvider);
  return accountRepository.addChild(newChild);
});

void main() {
}

class FakeAccountRepository implements AccountRepo {
  @override
  addChild(AddChildDto newChild) {
    return result;
  }

  @override
  Future<List> getChildList() {
    // TODO: implement getChildList
    throw UnimplementedError();
  }
}
