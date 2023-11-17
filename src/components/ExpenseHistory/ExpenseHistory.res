open Store;
%%raw(`import './ExpenseHistory.css';`)

@react.component
let make = (~expenses: list<ExpenseEntity.t>) => {
  <div className="historyContainer">
    <div className="historyLabel">
      <p> {React.string(historyLabel)} </p>
    </div>
    <div className="historyItems">
      {React.array(
        expenses
        ->Belt.List.toArray
        ->Belt.Array.reverse
        ->Belt.Array.map(exp => {
          <div
            key={string_of_int(exp.id)}
            className={Js.String.concat(
              exp.expType == ExpenseEntity.Income ? "green" : "red",
              "list-item ",
            )}>
            <p> {React.string(exp.title)} </p>
            <p>
              {React.string(exp.expType == ExpenseEntity.Income ? "+" : "-")}
              {React.string(Js.Float.toString(exp.amount))}
            </p>
          </div>
        }),
      )}
    </div>
  </div>
}
