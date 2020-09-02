import React, { Component } from 'react';

class List extends Component {
  constructor(props){
    super(props)
  }


  render(){
  if(this.props.artists.length > 0 ){
    return(
      <div className="col-lg-8">
       <h3>from list</h3>
       <div className='row'>
         {this.props.artists.map((artist) =>
          <div className='col-lg-4'>
            <div className="card" style={{width: '18rem'}}>
              <img src={artist.album.cover} className="card-img-top"/>
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
       <div className="col-lg-8">
        <h3>from list</h3>
       </div>
      )
    }
  }
}

export default List;
