const model = require("./model");

module.exports = {
  GET_ROOM: async (req, res) => {
    const { id } = req.params;
    try {
      if (!id) return res.send({ message: "id not found" });
      return res.send(await model.getRoom(id));
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
  GET_ROOMS: async (_, res) => {
    try {
      return res.send(await model.getRooms());
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
  POST_ROOM: async (req, res) => {
    const { countRooms, price, area, address, complexId } = req.body;
    try {
      if (!countRooms || !price || !area || !address || !complexId)
        return res.send({ message: "Malumotlar to`liq emas" });
      return res.send(
        await model.addRoom(countRooms, price, area, address, complexId)
      );
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
  DELETE_ROOM: async (req, res) => {
    const { id } = req.params;
    try {
      console.log("id");
      if (!id) return res.send({ message: "Malumotlar to`liq emasss" });
      return res.send(await model.deleteRoom(id));
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
};
