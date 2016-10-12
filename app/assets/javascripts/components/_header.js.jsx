var User = React.createClass({
  getInitialState: function() {
    return {
      user: this.props.data
    };
  },

  getDefaultProps: function() {
    return {
      user: []
    };
  },

  render: function(){
    return(
      <div>
        <img src={this.state.user.image} className="avatar"/>
        {this.state.user.name}
        <a href="/signout"> Sign out </a>
      </div>
    );
  }
});
