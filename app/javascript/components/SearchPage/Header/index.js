import React, { Component } from 'react'

export default class Header extends Component {
  constructor(props) {
    super(props)

    this.state = {
      processNumber: ''
    }
  }

  componentDidMount() {
    this.startsMaterializeSelect()
  }

  startsMaterializeSelect() {
    const materializeSelect = document.querySelectorAll('select')
    M.FormSelect.init(materializeSelect, {})
  }

  render() {
    const { loading, search } = this.props
    const { processNumber } = this.state

    return (
      <header>
        <form onSubmit={evt => search(evt, processNumber)}>
          <div className="row">
            <div className="input-field col s12 m4">
              <select defaultValue="tjal">
                <option value="tjal" disabled>TJAL</option>
              </select>
              <label>Tribunal</label>
            </div>
    
            <div className="input-field col s12 m4">
              <input 
                id="process_number" 
                type="text" 
                className="validate"
                value={processNumber}
                onChange={evt => this.setState({ processNumber: evt.target.value })}
              />
              <label htmlFor="process_number">Número do Processo</label>
            </div>

            <button 
              type="submit" 
              className="btn btn-large"
              disabled={loading || !processNumber}
            >
              <i className="material-icons">search</i>
            </button>
          </div>
        </form>
      </header>
    )
  }
}