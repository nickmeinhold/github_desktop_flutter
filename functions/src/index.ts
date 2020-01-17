import * as functions from 'firebase-functions';

const cors = require('cors')({origin: true,});

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

export const helloWorld = functions.https.onRequest((request, response) => {
    // Enable CORS using the `cors` express middleware.
    return cors(request, response, () => {
        response.send("Hello from Firebase!");
    });
});
