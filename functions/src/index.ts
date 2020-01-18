import * as functions from 'firebase-functions';
const cors = require('cors')({origin: true,});
const rp = require('request-promise');

export const getToken = functions.https.onRequest((request, response) => {
    // Enable CORS using the `cors` express middleware.
    return cors(request, response, async () => {
        try {
            const auth_token = await exchangeCodeForAuthToken(request.get('code'));
            return response.send(auth_token);
          } catch(error) {
            console.error(error);
            return response.status(500).send('Something went wrong while exchanging the code.');
          }
    });
});

// Exchange the code from github (plus a secret) for an auth token 
function exchangeCodeForAuthToken(code: string = '') {
    return rp({
      method: 'POST',
      uri: 'https://github.com/login/oauth/access_token',
      body: {
        code: code,
        client_id: functions.config().github.client_id,
        client_secret: functions.config().github.client_secret,
      },
      json: true,
    });
}