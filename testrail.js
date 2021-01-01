/*
*makes an API request to test rail to enter results 	
*/

var request = require('request')
request({
	method: 'POST',
	url: 'https://testrailaccount/myaccoutn.io/index.php/api/add_result',
	json: true,
	auth:{ 
		user: 'wskariah@coretux.com',
		pass: 'Coretux'},
	body: {
		description: "A description for the test run",
		status_id: 1,
		"custom_step_results": [
 { actual: 'response time is less than 1000ms',
  status_id: 1,
  content: 'Verify status code is 200',
  expected: 'status code is 200' },


 { actual: 'asset_id is returned',
  status_id: 1,
  content: 'Verify status code is 200',
  expected: 'status code is 200' },

 { actual: 'asset_id returned by punch equals asset_id used to create',
  status_id: 1,
  content: 'Verify status code is 200',
  expected: 'status code is 200' },

 { actual: 'status code is 200',
  status_id: 1,
  content: 'Verify status code is 200',
  expected: 'status code is 200' },
		]

	}
	
	}, function (err, msg, response) {
		console.log('response:', response);
	});


