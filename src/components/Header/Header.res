%%raw(`import './Header.css';`)

@react.component
let make = () => {
  <header className="header">
    <p>
      {React.string("Expense Tracker")}
    </p>
  </header>
}
