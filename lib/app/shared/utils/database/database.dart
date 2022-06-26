export 'database.dart';

Map<String, dynamic> getAllUsers() {
  return {
    "users": [
      {
        "userName": "Ethel Fletcher",
        "userTipe": "comum",
        "userEmail": "ethel.fletcher@example.com",
        "userBirthday": "02/02/1993",
        "userAddress": "5211 E North St",
        "userPhone": "(451)-503-3034"
      },
      {
        "userName": "Marjorie Gonzales",
        "userTipe": "comum",
        "userEmail": "marjorie.gonzales@example.com",
        "userBirthday": "05/07/1964",
        "userAddress": "8817 Pecan Acres Ln",
        "userPhone": "(891)-682-1950"
      },
      {
        "userName": "Nicole Carroll",
        "userTipe": "adm",
        "userEmail": "nicole.carroll@example.com",
        "userBirthday": "01/04/1995",
        "userAddress": "8949 Thornridge Cir",
        "userPhone": "(292)-844-6344"
      },
    ]
  };
}
