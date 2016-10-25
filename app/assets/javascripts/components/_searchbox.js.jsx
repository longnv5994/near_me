var Modal = ReactBootstrap.Modal;
var Search = React.createClass({
  getInitialState() {
    return { showModal: false };
  },

  close() {
    this.setState({ showModal: false });
  },

  handler: function(position){
    $.ajax({
      type: 'GET',
      url: 'friends',
      data: {'location':
        {'lat': position.coords.latitude,'long': position.coords.longitude}
      },
      dataType: 'json',
      success: function(){
        window.location.href = '/friends'
      }
    });
  },

  showError: function(error){
    if (error.code){
      this.setState({ showModal: true });
    }
  },

  doSearch:function(){
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(this.handler, this.showError);
    }
    else {
      this.setState({ showModal: true });
    }
  },

  render:function(){
    return(
      <div className="search">
        <input type="text" ref="searchInput" placeholder="Distance..."
          className="form-control" value={this.props.query}/>
        <div className="btn btn-primary search-btn fa fa-search fa-lg"
          type="text" onClick={this.doSearch}/>
        <Modal show={this.state.showModal} onHide={this.close}>
          <Modal.Header closeButton>
            <h3>{I18n.t('error')}</h3>
          </Modal.Header>
          <Modal.Body className="text-center error-message">
             <p>{I18n.t('get_location_error')}</p>
          </Modal.Body>
        </Modal>
      </div>
    );
  }
});

var SearchView = React.createClass({
  getInitialState() {
    return { users: this.props.data };
  },
  getDefaultProps: function() {
    return {
      users: []
    };
  },
  render: function() {
    var friends = this.state.users.map(function(user){
      return(
        <div className="list_friends">
          <div className="friends-item form-control">
            <img src={user.image}/>
            <div className="infor">
              <p>{user.id}</p>
            </div>
          </div>
        </div>
      );
    });
    return (
      <div>
        {friends}
      </div>
    );
  }
});
