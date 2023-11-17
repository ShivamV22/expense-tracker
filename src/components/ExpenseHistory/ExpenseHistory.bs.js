// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Store from "../../utils/Store.bs.js";
import * as React from "react";
import * as Belt_List from "rescript/lib/es6/belt_List.js";
import * as Js_string from "rescript/lib/es6/js_string.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";

import './ExpenseHistory.css';
;

function ExpenseHistory(props) {
  return React.createElement("div", {
              className: "historyContainer"
            }, React.createElement("div", {
                  className: "historyLabel"
                }, React.createElement("p", undefined, Store.historyLabel)), React.createElement("div", {
                  className: "historyItems"
                }, Belt_Array.map(Belt_Array.reverse(Belt_List.toArray(props.expenses)), (function (exp) {
                        return React.createElement("div", {
                                    key: String(exp.id),
                                    className: Js_string.concat(exp.expType === /* Income */0 ? "green" : "red", "list-item ")
                                  }, React.createElement("p", undefined, exp.title), React.createElement("p", undefined, exp.expType === /* Income */0 ? "+" : "-", exp.amount.toString()));
                      }))));
}

var make = ExpenseHistory;

export {
  make ,
}
/*  Not a pure module */
