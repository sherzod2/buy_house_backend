const { fetchData } = require("../../utils/postgres");

const Room = `
    SELECT
      room_id,
      room_count,
      room_price,
      room_area,
      room_address
    FROM
        rooms
    WHERE
      room_id = $1
`;

const Rooms = `
  SELECT
    rooms.room_id,
    rooms.room_count,
    rooms.room_price,
    rooms.room_area,
    rooms.room_address,
    complexs.complex_name,
    companies.company_name,
    companies.company_img
  FROM
    companies
  JOIN
    complexs
  ON
    companies.company_id = complexs.company_id
  JOIN
    rooms
  ON
    complexs.complex_id = rooms.complex_id
`;

const AddRoom = `
  INSERT INTO
    rooms(room_count, room_price, room_area, room_address, complex_id)
  VALUES($1, $2, $3, $4, $5)
`;

const DeleteRoom = `
  DELETE FROM
    rooms
  WHERE
    room_id = $1
  RETURNING *
`;

const getRoom = (id) => fetchData(Room, id);
const getRooms = () => fetchData(Rooms);
const addRoom = (countRooms, price, area, address, complexId) =>
  fetchData(AddRoom, countRooms, price, area, address, complexId);
const deleteRoom = (id) => fetchData(DeleteRoom, id);

module.exports = {
  getRoom,
  getRooms,
  addRoom,
  deleteRoom,
};
