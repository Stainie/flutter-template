Map defaultData = {
  'currencies': [
    {
      'name': 'Pounds',
      'symbol': 'GBP',
      'active': true,
      "circulating_supply": "1000",
      'market_cap': "2000",
      "difference": "1000",
      "num_exchanges": "15000"
    },
    {
      'name': 'Euros',
      'symbol': 'EUR',
      'active': true,
      "circulating_supply": "2000",
      'market_cap': "3000",
      "difference": "1000",
      "num_exchanges": "20000"
    },
    {
      'name': 'Dollars',
      'symbol': 'DOL',
      "active": false,
      "circulating_supply": "3000",
      "market_cap": "4000",
      "difference": "1000",
      "num_exchanges": "30000"
    }
  ],
  'users': [
    {
      'email': 'alex.thirlwall@gmail.com',
      'password': '1234',
      'firstname': 'Alex',
      'surname': 'Thirlwall'
    },
    {
      'email': 'john.smith@gmail.com',
      'password': '4576',
      'firstname': 'John',
      'surname': 'Smith'
    }
  ]
};

enum Status { NotActive, Pending, Approved }

Map defaultUserData = {
  'email': null,
  'kycStatus': Status.NotActive,
  'isLoggedIn': false,
  'firstname': null,
  'surname': null
};
