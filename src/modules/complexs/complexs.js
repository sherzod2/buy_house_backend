const model = require("./model");

module.exports = {
  GET_COMPLEX: async (req, res) => {
    const { id } = req.params;
    try {
      if (!id) return res.send({ message: "id not found" });
      return res.send(await model.getComplex(id));
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
  GET_COMPLEXS: async (_, res) => {
    try {
      return res.send(await model.getComplexs());
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
  POST_COMPLEX: async (req, res) => {
    const { name, companyId } = req.body;
    try {
      if (!name || !companyId)
        return res.send({ message: "Ma'lumotlar to`liq emas" });
      return res.send(await model.addComplex(name, companyId));
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
  DELETE_COMPLEX: async (req, res) => {
    const { id } = req.params;
    try {
      if (!id) return res.send({ message: "Ma'lumotlar to`liq emas" });
      return res.send(await model.deleteComplex(id));
    } catch (err) {
      console.log(err.message);
      res.sendStatus(500);
    }
  },
};
