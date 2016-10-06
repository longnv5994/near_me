DOM = React.DOM
  Home = React.createClass({
    render: function(){
      return(
        DOM.div(
          {className: "col-md-6 col-md-offset-3 center jumbotron"},
          DOM.div(
            {className: ""},
            DOM.li(
              {className: "col-md-6 col-md-offset-3"},
              DOM.a(
                {
                  className: "btn btn-block btn-social btn-facebook ",
                  href: "#"
                },
                DOM.span(
                  {className: "fa fa-facebook"}
                ),
                "Login facebook"
              )
            )
          )
        )
      )
    }
  });
home = React.createFactory(Home)
