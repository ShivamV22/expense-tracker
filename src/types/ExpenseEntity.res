type expense = 
| Income
| Expense

type t = {
  id: int,
  title: string,
  amount: float,
  expType: expense,
}