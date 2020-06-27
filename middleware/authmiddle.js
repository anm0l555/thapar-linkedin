//code for passport oauth


// const isLoggedIn = (req, res, next) => {
//     if (req.user) {
//         next();
//     } else {
//         return res.status(401).json({ msg: 'no token . authorization denied' });
//     }
// }



//code for normal jwt oauth



const jwt = require('jsonwebtoken');
const dotenv = require ('dotenv');
dotenv.config()


const isLoggedIn = (req, res, next) => {
    //Get token from the header
    const token = req.header('x-auth');
    if (!token) {
        return res.status(401).json({ msg: 'no token . authorization denied' });
    }
    //verify the token 
    try {

        const decoded = jwt.verify(token, config.get('jwtToken'));
        req.user = decoded.user;
        req.token = token;
        next();

    }
    catch (err) {
        res.status(401).json({ msg: 'invalid token .authorization denied' })
    }
}



module.exports= isLoggedIn