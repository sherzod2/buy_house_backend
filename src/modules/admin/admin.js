const { sign } = require("../../utils/jwt");

module.exports = {
  GET: (req, res) => {
    const { username, password } = req.query;
    try {
      if (!username || !password)
        return res.send({ message: "Ma`lumotlarni to`liq kiriting" });
      if (
        username !== process.env.ADMIN_USERNAME ||
        password !== process.env.ADMIN_PASSWORD
      ) {
        return res.send({ message: "Username yoki password xato" });
      }
      return res.send({ token: sign(username, password) });
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
};
