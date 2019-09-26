import React, { Component } from "react";
import moment from "moment";
import PropTypes from "prop-types";

import "./styles.scss";

import Preloader from "../../common/Preloader";

export default class Container extends Component {
  renderContent() {
    const { process, loading, children } = this.props;

    if (loading) {
      return <Preloader />;
    }

    if (!process) {
      return <p className="center">Nenhum processo encontrado.</p>;
    }

    return (
      <>
        <h1 className="Container_title">
          Processo nº.
          {process.number}
          do TJAL
        </h1>

        <span className="Container_crawler_updated_at">
          Última atualização em          {" "}
          {moment(process.crawler_updated_at).format("DD/MM/YYYY HH:mm")}
        </span>

        <div className="row">{children}</div>
      </>
    );
  }

  render() {
    return (
      <div className="card">
        <div className="card-content">{this.renderContent()}</div>
      </div>
    );
  }
}

Container.propTypes = {
  process: PropTypes.object,
  loading: PropTypes.bool.isRequired,
  children: PropTypes.node
};
