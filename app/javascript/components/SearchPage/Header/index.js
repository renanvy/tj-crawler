import React, { Component } from "react";
import PropTypes from "prop-types";

export default class Header extends Component {
  constructor(props) {
    super(props);

    this.state = {
      processNumber: ""
    };
  }

  componentDidMount() {
    this.startsMaterializeSelect();
  }

  startsMaterializeSelect() {
    const materializeSelect = document.querySelectorAll("select");
    M.FormSelect.init(materializeSelect, {});
  }

  render() {
    const { loading, search } = this.props;
    const { processNumber } = this.state;

    return (
      <header>
        <form onSubmit={evt => search(evt, processNumber)}>
          <div className="row">
            <div className="input-field col s12 m3">
              <select defaultValue="tjal">
                <option value="tjal" disabled>
                  TJAL
                </option>
              </select>
              <label>Tribunal</label>
            </div>

            <div className="input-field col s12 m5">
              <input
                id="process_number"
                type="text"
                className="validate"
                value={processNumber}
                onChange={evt =>
                  this.setState({
                    processNumber: evt.target.value
                  })
                }
              />

              <label htmlFor="process_number">Número do Processo</label>
            </div>

            <button
              style={{ marginTop: 5 }}
              type="submit"
              className="btn btn-large"
              disabled={loading || !processNumber}
            >
              <i className="material-icons">search</i>
            </button>
          </div>
        </form>
      </header>
    );
  }
}

Header.propTypes = {
  loading: PropTypes.bool.isRequired,
  search: PropTypes.func.isRequired
};
