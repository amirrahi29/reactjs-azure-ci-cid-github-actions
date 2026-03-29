import { render, screen } from '@testing-library/react';
import App from './App';

test('renders counter', () => {
  render(<App />);
  expect(screen.getByRole('heading', { name: /counter/i })).toBeInTheDocument();
  expect(screen.getByRole('button', { name: '+' })).toBeInTheDocument();
});
