open Store;
%%raw(`import './Header.css';`)

@react.component
let make = () => {
  <header className="header">
    <p>
      {React.string(headerLabel)}
    </p>
  </header>
}
