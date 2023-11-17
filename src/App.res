%%raw(`import './App.css';`)

@react.component
let make = () => {
  let (expenses: list<ExpenseEntity.t>, setExpenses) = React.useState(_ => list{})

  <div className="App"> 
    <Header />
    <BalanceDisplay expenses />
    <ExpenseHistory expenses />
    <AddTransaction setExpenses />
  </div>
}

