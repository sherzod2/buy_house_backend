const { fetchData } = require("../../utils/postgres");

const HOUSES = `
    SELECT
        bank_id,
        bank_name,
        bank_updo,
        bank_img,
        (SELECT (room_price * room_area) from rooms where room_id = $1) house_price,
        (SELECT (room_price * room_area) from rooms where room_id = $1) * 0.17 starting_payment,
        (SELECT (room_price * room_area) from rooms where room_id = $1) * 0.83 / $2 / 12 monthly_payment,
        $2 bank_duration
    FROM
        banks
    WHERE
        bank_id = (SELECT choose_bank((SELECT (room_price * room_area) from rooms where room_id = $1)))
`;

const getHouses = (room_id, duration) => fetchData(HOUSES, room_id, duration);

module.exports = {
  getHouses,
};
