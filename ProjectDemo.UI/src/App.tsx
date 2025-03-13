import './App.css';
import LoginButton from './components/LoginButton';
import { MsalProvider, useMsal } from "@azure/msal-react";
import { msalInstance } from "./auth/msalConfig";

function App() {
  return (
    <MsalProvider instance={msalInstance}>
    <div className="App">
      <header className="App-header">
        <p>ProjectDemo</p>
        <LoginButton />
      </header>
    </div>
    </MsalProvider>
  );
}


export default App;
