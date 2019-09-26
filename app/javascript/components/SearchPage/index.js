import React, { Component } from "react";

import { routes } from "../../api";

import Header from "./Header";
import Container from "./Container";
import Movimentations from "./Movimentations";
import Details from "./Details";

export default class SearchPage extends Component {
  constructor(props) {
    super(props);

    this.state = {
      process: null,
      movimentations: [],
      loading: false
    };

    this.search = this.search.bind(this);
  }

  async search(evt, processNumber) {
    evt.preventDefault();

    this.setState({ loading: true, process: null, movimentations: [] });

    try {
      const response = await fetch(
        `${routes.processes_path}?number=${processNumber}`
      );

      const process = await response.json();
      const { movimentations } = process;

      this.setState({ process, movimentations });
    } catch (e) {
      M.toast({
        html: "Ocorreu um erro ao carregar o processo. Tente novamente."
      });
    } finally {
      this.setState({ loading: false });
    }
  }

  render() {
    const { process, movimentations, loading } = this.state;

    return (
      <div className="container">
        <h1 className="SearchPage_title">Consulta de processos de 1º grau.</h1>

        <blockquote>
          Informe no campo de busca o nº do processo que deseja buscar no TJAL
          (Tribunal de Justiça do Estado de Alagoas).
        </blockquote>

        <Header search={this.search} loading={loading} />

        <Container process={process} loading={loading}>
          <Movimentations movimentations={movimentations} />
          <Details process={process} />
        </Container>
      </div>
    );
  }
}
