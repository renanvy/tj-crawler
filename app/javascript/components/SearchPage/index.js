import React, { Component } from 'react'
import PropTypes from 'prop-types'

import Header from './Header'
import Container from './Container'
import Movimentations from './Movimentations'
import Details from './Details'

export default class SearchPage extends Component {
  constructor(props) {
    super(props)

    this.state = {
      process: {},
      loading: false
    }
  }

  search = async (evt, processNumber) => {
    evt.preventDefault()

    this.setState({ loading: true })

    try {
      console.log('search!', processNumber)
    } catch (e) {
      M.toast({ html: "Ocorreu um erro ao carregar o processo. Tente novamente." })
    } finally {
      this.setState({ loading: false })
    }
  }

  render() {
    const { process, loading } = this.state
    const { movimentations } = process

    return (
      <div className="container">
        <Header search={this.search} loading={loading} />

        <Container process={process} loading={loading}>
          <Movimentations movimentations={movimentations} />
          <Details process={process} />
        </Container>
      </div>
    )
  }
}