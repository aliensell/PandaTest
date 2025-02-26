import http.server
import socketserver
import json

PORT = 8888

class Handler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/hello':
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            response = json.dumps({"message": "Hello, World!"})
            self.wfile.write(response.encode())
        else:
            self.send_response(404)
            self.end_headers()

with socketserver.TCPServer(('0.0.0.0', PORT), Handler) as httpd:
    print(f"Serving on port {PORT}")
    httpd.serve_forever()
