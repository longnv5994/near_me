var Search = React.createClass({
  doSearch:function(){
    var query=this.refs.searchInput.getDOMNode().value;
    this.props.doSearch(query);
  },
  render:function(){
    return(
      <div className="search">
        <input type="text" ref="searchInput" placeholder="Distance..."
          className="form-control" value={this.props.query}/>
        <div className="btn btn-primary search-btn fa fa-search fa-lg"
          type="text" onClick={this.doSearch}/>
      </div>
    );
  }
});
