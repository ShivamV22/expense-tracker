%%raw(`import './BalanceDisplay.css';`)

@react.component
let make = (~expenses: list<ExpenseEntity.t>) => {
  let totalIncome =
    expenses
    ->Belt.List.keep(exp => exp.expType === ExpenseEntity.Income)
    ->Belt.List.reduce(0.0, (acc, item) => acc +. item.amount)
  let totalExpense =
    expenses
    ->Belt.List.keep(exp => exp.expType === ExpenseEntity.Expense)
    ->Belt.List.reduce(0.0, (acc, item) => acc +. item.amount)

  <div className="balanceContainer">
    <p className="balanceTitle"> {React.string("Your Balance")} </p>
    <p className="balanceValue">
      {React.string("$")}
      {React.string(totalExpense > totalIncome ? "-" : "")}
      {React.string(
        Js.Float.toString(
          totalExpense > totalIncome ? totalExpense -. totalIncome : totalIncome -. totalExpense,
        ),
      )}
    </p>
    <div className="balanceDashboard">
      <div className="incomeData">
        <p className="dashboardLabel">
          {React.string("Income")}
        </p>
        <p className="dashboardValue">
          {React.string("$")}
          {React.float(totalIncome)}
        </p>
      </div>
      <div className="expenseData">
        <p className="dashboardLabel">
          {React.string("Expense")}
        </p>
        <p className="dashboardValue">
          {React.string("$")}
          {React.float(totalExpense)}
        </p>
      </div>
    </div>
  </div>
}
