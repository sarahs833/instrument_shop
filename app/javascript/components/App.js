import React, { Component } from 'react';
import axios from 'axios';

import Search from './Search';
import List from './List';
import Selected from './Selected';

class App extends Component {
  state = {
    value: "",
    artists: [],
    selected: []
  }

  handleChange = (e) => {
    console.log(e.target.value)
    this.setState({ value: e.target.value})
  }

  handleSubmit = (e) => {
    e.preventDefault();
    console.log('submit')
    axios.get(`https://deezerdevs-deezer.p.rapidapi.com/search?q=${this.state.value}`, {
      headers: {
        "x-rapidapi-host": "deezerdevs-deezer.p.rapidapi.com",
        "x-rapidapi-key": "38c76848dfmsh766691066285bfap11491ejsn2c6ee3885665"
      }
    })
    .then((data)=> {
      console.log(data.data.data);
      this.setState({
        artists: [...data.data.data]
      })
    }).then(() => {
      console.log(this.state.artists)
    })

  }

  handleClick = (id) => {

    let selected = this.state.artists.find(artist => artist['id'] === parseInt(id,10))
    console.log(selected)
  }

render(){
  return(
    <div className="container-fluid" style={{marginTop:"80px"}}>
      <div className='row'>
        <Search handleChange={this.handleChange} value={this.state.value} handleSubmit={this.handleSubmit} />
        <List artists={this.state.artists} handleClick={this.handleClick}/>
      </div>
      <div className='row'>
        <Selected />
      </div>
    </div>
    )
  }
}

export default App;
