%%raw(`import './AddTransaction.css'`)

@react.component
let make = (~setExpenses: (list<ExpenseEntity.t> => list<ExpenseEntity.t>) => unit) => {
  let (title, setTitle) = React.useState(_ => "");
  let (text, setText) = React.useState(_ => "");

  let onAmountChange = evt => {
    ReactEvent.Form.preventDefault(evt)
    let value = ReactEvent.Form.target(evt)["value"]
    setText(_ => value)
  }

  let onTitleChange = evt => {
    ReactEvent.Form.preventDefault(evt)
    let value = ReactEvent.Form.target(evt)["value"]
    setTitle(_ => value);
  }

  let onClick = evt => {
    ReactEvent.Mouse.preventDefault(evt);
    let amount = Belt.Float.fromString(text) -> Belt.Option.getWithDefault(0.0)
    setExpenses(prev =>
      Belt.List.add(
        prev,
        {
          id: Js.Math.random_int(1, 999),
          title,
          amount: amount > 0.0 ? amount : amount *. -1.0,
          expType: amount > 0.0 ? ExpenseEntity.Income : ExpenseEntity.Expense,
        },
      )
    )
    setText(_ => "")
    setTitle(_ => "")
  }

  <div className="transactionContainer">
    <div className="transactionLabel">
      <p>{React.string("Add new transaction")}</p>
    </div>
    <div className="inputContainer">
      <p>{React.string("Text")}</p>
      <input placeholder="Enter text..." onChange={onTitleChange} value={title} />
    </div>
    <div className="inputContainer">
      <p>{React.string("Amount")}</p>
      <p>{React.string("(negative - expense, positive - income)")}</p>
      <input placeholder="Enter amount..." onChange={onAmountChange} value={text} />
    </div>
    <button onClick className="submitBtn"> {React.string("Add transaction")} </button>
  </div>
}
