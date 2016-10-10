DOM = React.DOM
  User = React.createClass({
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

    // Close the dropdown if the user clicks outside of it
    clickHandler: function clickHandler(event) {
      document.getElementById("myDropdown").classList.toggle("show");
      if (!event.target.matches('.dropbtn')) {

        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
          var openDropdown = dropdowns[i];
          if (openDropdown.classList.contains('show')) {
            openDropdown.classList.remove('show');
          }
        }
      }
    },

    render: function(){
      return(
        DOM.div({className: "main-container"},
          DOM.div({className: "header-container"},
            DOM.div({className: "header-left"}
            ),
            DOM.div({className: "header-right"},
              DOM.div({className: "user dropdown"},
                DOM.button({className: "dropbtn btn btn-primary" },
                  this.state.user.name
                ),
                DOM.div({className: "dropdown-content" id: "myDropdown"},
                  DOM.a({className: "", href: "/signout"},
                    "Log out 1"
                  ),
                  DOM.a({className: "", href: "/signout"},
                    "Log out2"
                  )
                )
              )
            )
          ),
          DOM.div({className: "body-container"},
            DOM.div({className: "body-left-panel"}
            ),
            DOM.div({className: "body-right-panel"}
            )
          )
        )
      )
    }
  });


