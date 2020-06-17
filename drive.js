const { google } = require('googleapis');
const credentials = require('./credentials.json');
const fs =require('fs')
const path = require ('path')
require('dotenv').config()
const User = require('./models/usermodel')
const Profile= require('./models/profilemodel')

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

async function listfiles () {
    let res = await drive.files.list({
      pageSize: 5,
      fields: 'files(name, webViewLink)',
      orderBy: 'createdTime desc'
    });
    console.log(res.data);
  }


async function uploadfile(foldername , res , user,profile) {

var folderId = foldername;
var fileMetadata = {
  'name': `${profile.images.length +1}.jpg`,
  parents: [folderId]

};
var media = {
  mimeType: 'image/png',
  body: fs.createReadStream(path.join(__dirname, './uploads' ,`./${user._id}`))
};
console.log(path.join(__dirname, './uploads' ,`./${user._id}`))
drive.files.create({
    auth:auth,
  resource: fileMetadata,
  media: media,
  fields: 'id'
},async function (err, file) {
  if (err) {
    // Handle error
    console.error(err);
  } else {

    const image ={
      id :`${file.data.id}`,
      date :Date.now()

    }
    profile.images.unshift(image);
    await profile.save();

    fs.unlinkSync(path.join(__dirname, './uploads' ,`./${user._id}`))

    //deleteing the file left 

    console.log('File Id: ', file);
  }
});



}


async function uploadfiledp(foldername , res , user,profile) {

  var folderId = foldername;
  var fileMetadata = {
    'name': `${user._id}.jpg`,
    parents: [folderId]
  
  };
  var media = {
    mimeType: 'image/png',
    body: fs.createReadStream(path.join(__dirname, './uploaddp' ,`./${user._id}`))
  };
  console.log(path.join(__dirname, './uploaddp' ,`./${user._id}`))
  drive.files.create({
      auth:auth,
    resource: fileMetadata,
    media: media,
    fields: 'id'
  },async function (err, file) {
    if (err) {
      // Handle error
      console.error(err);
    } else {
  
      const image ={
        id :`${file.data.id}`,
        date :Date.now()
      }
      user.profilePicture=image
      await user.save();
  
      fs.unlinkSync(path.join(__dirname, './uploaddp' ,`./${user._id}`))
  
      //deleteing the file left 
  
      console.log('File Id: ', file);
    }
  });
  
  
  
  }
  



async function uploadfilevideo(foldername , res , user,profile) {

  var folderId = foldername;
  var fileMetadata = {
    'name': `${user._id}.mp4`,
    parents: [folderId]
  
  };
  var media = {
    mimeType: 'video/mp4',
    body: fs.createReadStream(path.join(__dirname, './uploadvideo' ,`./${user._id}`))
  };
  console.log(path.join(__dirname, './uploads' ,`./${user._id}`))
  drive.files.create({
      auth:auth,
    resource: fileMetadata,
    media: media,
    fields: 'id'
  },async function (err, file) {
    if (err) {
      // Handle error
      console.error(err);
    } else {
  
      const video ={
        id :`${file.data.id}`,
        date :Date.now()
  
      }
      profile.video=video
      await profile.save();
  
      fs.unlinkSync(path.join(__dirname, './uploadvideo' ,`./${user._id}`))
      //deleteing the file left 
  
      console.log('File Id: ', file);
    }
  });
  
  
  
  }











async function createFolder(name)
{
  var folderId = process.env.FOLDER_ID;

  var fileMetadata = {
    'name':name,
    'mimeType': 'application/vnd.google-apps.folder',
    parents: [folderId]
  };
  drive.files.create({
    resource: fileMetadata,
    fields: 'id'
  },async function (err, file) {
    if (err) {
      // Handle error
      console.error(err);
    } else {
      console.log('Folder Id: ', file.data);
      const user = await  User.findOneAndUpdate(
        {_id:name},
        {imgFolder: `${file.data.id}`},
        {new:true}
        )
      console.log(user);

    }
  });
}

//use file.data.id
// createFolder()


module.exports = {listfiles  , uploadfile , createFolder, uploadfilevideo ,uploadfiledp}