import React, { Component } from 'react';

import Selected from './Selected';

class Search extends Component {
  constructor(props){
    super(props)
  }
  render(){
    return(
      <div className="col-lg-4 text-center">
       <form onSubmit={this.props.handleSubmit}>
        <div className="form-group">
          <label>Search artists</label>
          <input className="form-control" placeholder='artists' value={this.props.value}  onChange={this.props.handleChange} />
        </div>
        <input type='submit' value='send' className="btn btn-outline-info" style={{width:'200px'}}/>
       </form>
       <Selected selected={this.props.selected}/>
      </div>
    )
  }
}

export default Search;
