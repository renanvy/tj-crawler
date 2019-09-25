import React from 'react'

export default function Details(props) {
  return (
    <div className="col s12 m4">
      <h5>Detalhes do processo</h5>
      
      <ul>
        <li>Cumprimento de Sentença</li>
        <li>Cumprimento de Sentença</li>
        <li>Cumprimento de Sentença</li>
        <li>Cumprimento de Sentença</li>
      </ul>

      <div className="divider" />

      <h5>Partes envolvida</h5>

      <ul>
        <li>
          <a href="#">Nelson Willians & Advogados Associados</a>
          <br />
          <span>Parte envolvida * Exequente</span>
        </li>
        
        <li>
          <a href="#">Nelson Willians & Advogados Associados</a>
          <br />
          <span>Parte envolvida * Exequente</span>
        </li>

        <li>
          <a href="#">Nelson Willians & Advogados Associados</a>
          <br />
          <span>Parte envolvida * Exequente</span>
        </li>

        <li>
          <a href="#">Nelson Willians & Advogados Associados</a>
          <br />
          <span>Parte envolvida * Exequente</span>
        </li>
      </ul>
    </div>
  )
}