const http = require('http');
const port = 80;

const requestHandler = (req, res) => {
  res.end('Hello from Terraform + Ansible + Jenkins deployment!');
};

const server = http.createServer(requestHandler);
server.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
