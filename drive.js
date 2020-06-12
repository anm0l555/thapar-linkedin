const { google } = require('googleapis');
const credentials = require('./credentials.json');
const scopes = [
  'https://www.googleapis.com/auth/drive'
];
const auth = new google.auth.JWT(
  credentials.client_email, null,
  credentials.private_key, scopes
);
auth.authorize((authErr) => {
    if (authErr) {
      console.log("error : " + authErr);
      return;
    } else {
      console.log("Authorization accorded");
    }
  });


const drive = google.drive({ version: "v3", auth });

(async function () {
    let res = await drive.files.list({
      pageSize: 5,
      fields: 'files(name, webViewLink)',
      orderBy: 'createdTime desc'
    });
    console.log(res.data);
  })()