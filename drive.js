const { google } = require('googleapis');
const credentials = require('./credentials.json');
const fs =require('fs')
const path = require ('path')
require('dotenv').config()

const scopes = [
    'https://www.googleapis.com/auth/drive.file',
    'https://www.googleapis.com/auth/drive',
    'https://www.googleapis.com/auth/drive.file',
    'https://www.googleapis.com/auth/drive.metadata'
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


var folderId = process.env.FOLDER_ID;
var fileMetadata = {
  'name': 'photo.jpg',
  parents: [folderId]

};
var media = {
  mimeType: 'image/png',
  body: fs.createReadStream(path.join(__dirname, './hello.png'))
};
console.log(path.join(__dirname, './Webp.net-resizeimage.png'))
drive.files.create({
    auth:auth,
  resource: fileMetadata,
  media: media,
  fields: 'id'
}, function (err, file) {
  if (err) {
    // Handle error
    console.error(err);
  } else {
    console.log('File Id: ', file.id);
  }
});


