import React, { Component } from 'react';

class Selected extends Component {
  constructor(props){
    super(props)
  }

render(){
  if (this.props.selected["name"] !== "") {
  return(
  <div className="card mt-5" >
    <img src={this.props.selected['picture']} className="card-img-top"/>
    <div className="card-body">
      <h5 className="card-title">{this.props.selected.name}</h5>
      <p className="card-text">Selected album: {this.props.selected.album}</p>
      <p className="card-text">Selected title: {this.props.selected.title}</p>
    </div>
    <div className="card-body">
      <a href={this.props.selected['link']} className="card-link">Check song</a>
    </div>
  </div>
  )
 } else {
  return(
  <div>
  </div>

  )
 }
}


}

export default Selected;
