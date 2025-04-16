import './App.css';
import LoginButton from './components/LoginButton';
import { AuthProvider } from './auth/AuthProvider';

function App() {
  return (
    <AuthProvider>
      <div className="App">
        <header className="App-header">
          <p>ProjectDemo</p>
          <LoginButton />
        </header>
      </div>
    </AuthProvider>
  );
}


export default App;
