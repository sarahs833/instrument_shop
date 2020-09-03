import React, { Component } from 'react';
import axios from 'axios';

import Search from './Search';
import List from './List';

class App extends Component {
  state = {
    value: "",
    artists: [],
    selected: {
      picture:"",
      name: "",
      link:""
    }
  }

  handleChange = (e) => {
    console.log(e.target.value)
    this.setState({ value: e.target.value})
  }

  handleSubmit = (e) => {
    e.preventDefault();
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
    })
  }

  handleClick = (id) => {
    let newSelect = this.state.artists.find(artist => artist['id'] === parseInt(id,10))
    let copy = Object.assign({}, this.state.selected);
    copy['picture'] = newSelect['artist']['picture'];
    copy['name'] = newSelect['artist']['name'];
    copy['link'] = newSelect['link'];
    copy['title'] = newSelect['title']
    copy['album'] = newSelect['album']['title']
    console.log(newSelect)
    this.setState({selected: copy});
  }

render(){
  return(
    <div className="container-fluid" style={{marginTop:"80px"}}>
      <div className='row'>
        <Search handleChange={this.handleChange} selected={this.state.selected} value={this.state.value} handleSubmit={this.handleSubmit} />
        <List artists={this.state.artists} handleClick={this.handleClick}/>
      </div>
    </div>
    )
  }
}

export default App;
