const { fetchData } = require("../../utils/postgres");

const Company = `
    SELECT
        c.company_id,
        c.company_name,
        c.company_img,
        json_agg(
            json_build_object(
                'id', l.complex_id,
                'name', l.complex_name
            )
        ) AS complexs
    FROM
        companies c
    JOIN
        complexs l
    ON
        c.company_id = l.company_id
    GROUP BY
        c.company_id,
        c.company_name,
        c.company_img
    HAVING
    c.company_id = $1
`;

const Companies = `
    SELECT * FROM companies
`;

const AddCompany = `
    INSERT INTO
        companies(company_name, company_img)
    VALUES($1, $2)
    RETURNING *
`;

const DeleteCompany = `
    DELETE FROM
        companies
    WHERE
        company_id = $1
    RETURNING *
`;

const getCompany = (id) => fetchData(Company, id);
const getCompanies = () => fetchData(Companies);
const addCompany = (name, img) => fetchData(AddCompany, name, img);
const deleteCompany = (id) => fetchData(DeleteCompany, id);

module.exports = {
  getCompany,
  getCompanies,
  addCompany,
  deleteCompany,
};
