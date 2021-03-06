import React, { Component } from 'react';

class List extends Component {
  constructor(props){
    super(props)
  }

changeBackground = (e) => {
  e.target.style.border = 'solid orange'
  console.log(e.target)
}

handleHoverOff = (e) => {
  e.target.style.border = 'none'
}
  render(){
  if(this.props.artists.length > 0 ){
    return(
      <div className="col-lg-8">
       <div className='row'>
         {this.props.artists.map((artist) =>
          <div key={artist['id']} className='col-lg-4'>
            <div className="card" style={{width: '18rem'}}>
              <img src={artist.album.cover} onMouseOver={this.changeBackground} onMouseLeave={this.handleHoverOff} className="card-img-top" onClick={() => this.props.handleClick(artist['id'])}/>
              <div className="card-body">
               <p className="card-text">{artist['title']}</p>
              </div>
            </div>
          </div>
          )}
        </div>
      </div>
     )
   } else {
      return (
       <div className="col-lg-8 text-center">
          <h2>Launch the search engine</h2>
       </div>
      )
    }
  }
}

export default List;
