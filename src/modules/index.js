const express = require("express");
const router = express.Router();

const Companies = require("./companies/companies");
const Complexs = require("./complexs/complexs");
const Rooms = require("./rooms/rooms");
const Banks = require("./banks/banks");
const Admin = require("./admin/admin");

router
  .get("/company/id/:id", Companies.GET_COMPANY)
  .get("/company/", Companies.GET_COMPANIES)
  .post("/company/", Companies.POST_COMPANY)
  .delete("/company/delete/:id", Companies.DELETE_COMPANY)
  .get("/complex", Complexs.GET_COMPLEXS)
  .get("/complex/id/:id", Complexs.GET_COMPLEX)
  .post("/complex/", Complexs.POST_COMPLEX)
  .delete("/complex/delete/:id", Complexs.DELETE_COMPLEX)
  .get("/room/id/:id", Rooms.GET_ROOM)
  .get("/room", Rooms.GET_ROOMS)
  .post("/room", Rooms.POST_ROOM)
  .delete("/room/delete/:id", Rooms.DELETE_ROOM)
  .get("/bank", Banks.GET)
  .get("/admin", Admin.GET);

module.exports = router;
