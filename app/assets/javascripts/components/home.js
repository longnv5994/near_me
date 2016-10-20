DOM = React.DOM
  Home = React.createClass({
    render: function(){
      return(
        DOM.div(
          {className: "center jumbotron"},
          DOM.div(
            {className: "fb-button"},
            DOM.li(
              {className: ""},
              DOM.a(
                {
                  className: "btn btn-block btn-social btn-facebook ",
                  href: "auth/facebook"
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
