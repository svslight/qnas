import { createConsumer } from "@rails/actioncable"
export default createConsumer()

// var App = App || {};
// App.cable = ActionCable.createConsumer();

// Specify a different URL to connect to
createConsumer('https://ws.example.com/cable')

// Use a function to dynamically generate the URL
createConsumer(getWebSocketURL)

function getWebSocketURL() {
  const token = localStorage.get('auth-token')
  return `https://ws.example.com/cable?token=${token}`
}
