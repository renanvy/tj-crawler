import React from 'react'

export default function Container(props) {
  return (
    <div className="card">
      <div className="card-content">
        <span className="card-title">Processo n. 234354.343 do TJAL</span>

        <span>Distribuido em 09/11/19</span>
        
        <div className="row">
          {props.children}
        </div>
      </div>
    </div>
  )
}