import { useState } from 'react';
import './App.css';

function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="app">
       <h3>Staging Environment</h3>
      <main className="card">
        <h1 className="title">Counter</h1>
        <p className="value" aria-live="polite">
          {count}
        </p>
        <div className="actions">
          <button type="button" onClick={() => setCount((c) => c - 1)}>
            −
          </button>
          <button type="button" onClick={() => setCount(0)}>
            Reset
          </button>
          <button type="button" onClick={() => setCount((c) => c + 1)}>
            +
          </button>
        </div>
      </main>
    </div>
  );
}

export default App;
