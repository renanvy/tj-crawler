import React from "react";
import PropTypes from "prop-types";

import "./styles.scss";

export default function Details(props) {
  const { process } = props;
  return (
    <div className="col s12 m4">
      <h1 className="Details_title">Detalhes do processo</h1>

      <ul className="Details_list_infos">
        <li>
          <strong>Distribuído em:</strong>
          {process.distribution_date}
        </li>
        <li>
          <strong>Classe: </strong>
          {process.kind}
        </li>
        <li>
          <strong>Área: </strong>
          {process.area}
        </li>
        <li>
          <strong>Assunto: </strong>
          {process.subject}
        </li>
        <li>
          <strong>Juíz: </strong>
          {process.judge}
        </li>
        <li>
          <strong>Valor da Ação: </strong>
          {process.action_value}
        </li>
      </ul>

      <div className="divider" />

      <br />

      <h1 className="Details_title">Partes envolvida</h1>

      <ul className="Details_involved_list">
        <li>{process.plaintiff}</li>
        <li>{process.sued}</li>
      </ul>
    </div>
  );
}

Details.propTypes = {
  process: PropTypes.object
};
