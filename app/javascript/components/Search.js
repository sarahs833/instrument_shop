import React, { Component } from 'react';

class Search extends Component {
  constructor(props){
    super(props)
  }
  render(){
    return(
      <div className="col-lg-4">
       <form onSubmit={this.props.handleSubmit}>
        <label>Search artists that you like</label>
        <input className="form-control" placeholder='artists' value={this.props.value}  onChange={this.props.handleChange} />
        <input type='submit' value='send' className="btn btn-warning" />
       </form>
      </div>
    )
  }
}

export default Search;
