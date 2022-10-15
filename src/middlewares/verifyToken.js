const jwt = require("jsonwebtoken");

module.exports = (req, res, next) => {
  const { token } = req.body;

  if (!token) {
    return res.redirect("/login");
  }

  jwt.verify(token, process.env.SECRET_KEY, (err, decode) => {
    if (err instanceof jwt.TokenExpiredError) {
      return res.send("token vaqti tugagan");
    }

    if (err instanceof jwt.JsonWebTokenError) {
      return res.send("token xato");
    }
    req.user = decode;
    next();
  });
};
