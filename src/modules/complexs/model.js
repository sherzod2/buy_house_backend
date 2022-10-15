const { fetchData } = require("../../utils/postgres");

const Complex = `
    SELECT
        c.complex_id,
        c.complex_name,
        json_agg(
            json_build_object(
                'id', r.room_id,
                'name', r.room_count,
                'price', r.room_price,
                'area', r.room_area,
                'address', r.room_address
            )
        ) AS rooms
    FROM
        complexs c
    JOIN
        rooms r
    ON
        c.complex_id = r.complex_id
    GROUP BY
        c.complex_id,
        c.complex_name
    HAVING
    c.complex_id = $1
`;

const Complexs = `
    SELECT
        complexs.complex_id,
        complexs.complex_name,
        companies.company_name,
        companies.company_img
    FROM
        companies
    JOIN
        complexs
    ON
        companies.company_id = complexs.company_id
`;

const AddComplex = `
    INSERT INTO
        complexs(complex_name, company_id)
    VALUES($1, $2)
    RETURNING *
`;

const DeleteComplex = `
    DELETE FROM
        complexs
    WHERE
        complex_id = $1
    RETURNING *
`;

const getComplex = (id) => fetchData(Complex, id);
const getComplexs = () => fetchData(Complexs);
const addComplex = (name, companyId) => fetchData(AddComplex, name, companyId);
const deleteComplex = (id) => fetchData(DeleteComplex, id);

module.exports = {
  getComplex,
  getComplexs,
  addComplex,
  deleteComplex,
};
