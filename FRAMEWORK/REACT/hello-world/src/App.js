import React from 'react';
import ReactDOM from 'react-dom';
import ReactHtmlParser from 'react-html-parser';

import {
  BrowserRouter as Router,
  Route,
  Link,
  Switch,
} from "react-router-dom";

import logo from './logo.svg';
import './App.scss';
import { NavBar } from './shared/NavBar';

import { TodoContextProvider } from './state/redux/contexts/todo-context';
import { Todo } from './state/redux/contexts/todo';

function App() {
  var hi = 'hi alefal!!!';
  var text = '<p>Hello <strong>React</strong>!</p>';

  // // Crea gli elementi da inserire nella lista
  // var item1 = React.DOM.li({ className: "item-1", key: "item-1"}, "Item 1");
  // var item2 = React.DOM.li({ className: "item-2", key: "item-2"}, "Item 2");
  // var item3 = React.DOM.li({ className: "item-3", key: "item-3"}, "Item 3");

  // // Crea un array degli elementi
  // var itemArray = [item1, item2, item3];
  // // Crea la lista degli elementi
  // var listElement = React.DOM.ul({ className: "list-of-items" }, itemArray);
  // // Lancia il rendering nella pagina
  // ReactDOM.render(listElement, document.getElementById("container"));

  var userInfo = {
    userName  : 'admin',
    firstName : 'Mark',
    lastName  : 'Zuckerberg',
    fullName  : function() {
      return this.firstName + ' ' + this.lastName;
    }
  };
  //ReactDOM.render(<LoggedUser user={userInfo}/>, document.body);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload... {hi}
        </p>
        <div>{ ReactHtmlParser(text) }</div>
        <p>
          Benvenuto <strong>{userInfo.fullName().toUpperCase()}</strong>,
          sei collegato come <em>{userInfo.userName}</em>.
        </p>

        <div id="root"></div>

        {/* <TodoContextProvider>
          <Todo />
        </TodoContextProvider> */}
        
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React

        </a>

        <div>
          <hr />
        </div>
        <Router>
          <div>
            <NavBar />

            {/* A <Switch> looks through its children <Route>s and
                renders the first one that matches the current URL. */}
            <Switch>
              <Route path="/about">
                <About />
              </Route>
              <Route path="/users">
                <Users />
              </Route>
              <Route path="/">
                <Home />
              </Route>
            </Switch>
          </div>
        </Router>
      </header>
    </div>
  );
}

export default App;

function Home() {
  return <h2>Home</h2>;
}

function About() {
  return <h2>About</h2>;
}

function Users() {
  return <h2>Users</h2>;
}