var Modal = ReactBootstrap.Modal;
var Search = React.createClass({
  getInitialState() {
    return { showModal: false };
  },

  close() {
    this.setState({ showModal: false });
  },

  doSearch:function(){
    if (navigator.geolocation) {
      this.setState({ showModal: false });
      navigator.geolocation.getCurrentPosition(function(position) {
      });
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
