// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Store from "../../utils/Store.bs.js";
import * as React from "react";

import './Header.css';
;

function Header(props) {
  return React.createElement("header", {
              className: "header"
            }, React.createElement("p", undefined, Store.headerLabel));
}

var make = Header;

export {
  make ,
}
/*  Not a pure module */
