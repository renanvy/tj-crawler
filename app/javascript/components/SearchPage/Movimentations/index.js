import React from "react";
import moment from "moment";
import PropTypes from "prop-types";

export default function Movimentations(props) {
  const { movimentations } = props;

  return (
    <div className="Movimentations">
      <div className="col s12 m8">
        <ul className="collection with-header">
          <li className="collection-header">
            <h1 className="Movimentations_title">Movimentações</h1>
          </li>

          {movimentations.map(movimentation => (
            <li
              key={`movimentation-${movimentation.id}`}
              className="collection-item"
            >
              <span className="Movimentation_date">
                {moment(movimentation.date).format("DD/MM/YYYY")}
              </span>

              <p className="Movimentation_description">
                {movimentation.description}
              </p>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}

Movimentations.propTypes = {
  movimentations: PropTypes.array.isRequired
};
