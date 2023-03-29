import socket
import time

subnet = "192.168.237.1"

for i in range(1, 256):
    host = subnet + str(i)
    for port in range(1, 65535):
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(0.5)
            sock.connect((host, port))
            print(f'{host}:{port} is open')
            sock.close()
        except socket.timeout:
            pass
        except socket.error:
            pass
        time.sleep(0.01) # Add a delay to avoid being too aggressive
