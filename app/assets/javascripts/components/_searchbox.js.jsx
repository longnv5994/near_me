var Search = React.createClass({
  doSearch:function(){
    // if (navigator.geolocation) {
    //   navigator.geolocation.getCurrentPosition(function(position) {
    //     $.ajax({
    //       type: 'POST',
    //       url: '/locations/new',
    //       data: {'location':
    //         {'lat': position.coords.latitude,'long': position.coords.longitude}
    //       },
    //       dataType: 'json',
    //       success: function() {
    //         alert(I18n.t('get_location') + " : " + position.coords.latitude + " : " + position.coords.longitude );
    //       }
    //     });
    //   });
    // }
    // else {
    //   alert(I18n.t('get_location_error'));
    // }


    $(".body-left-panel").animate({top: '500px'})
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
