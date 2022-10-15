const model = require("./model");

module.exports = {
  GET: async (req, res) => {
    const { room_id, duration } = req.query;
    try {
      if (!room_id || !duration)
        return res.send({ message: "ma'lumotlar to`liq emas" });
      return res.send(await model.getHouses(room_id * 1, duration * 1));
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
};
