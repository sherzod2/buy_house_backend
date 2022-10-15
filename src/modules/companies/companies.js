const model = require("./model");

module.exports = {
  GET_COMPANY: async (req, res) => {
    const { id } = req.params;
    try {
      if (!id) return res.send({ message: "id not found" });
      return res.send(await model.getCompany(id));
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
  GET_COMPANIES: async (_, res) => {
    try {
      res.send(await model.getCompanies());
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
  POST_COMPANY: async (req, res) => {
    const { name, img } = req.body;
    try {
      if (!name || !img)
        return res.send({ message: "ma'lumotlar to`liq emas" });
      return res.send(await model.addCompany(name, img));
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
  DELETE_COMPANY: async (req, res) => {
    const { id } = req.params;
    try {
      if (!id) return res.send({ message: "ma'lumotlar to`liq emas" });
      return res.send(await model.deleteCompany(id));
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
};
