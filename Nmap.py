import nmap

def scan_subnet(subnet):
    nm = nmap.PortScanner()
    nm.scan(hosts=subnet, arguments='-sn')
    hosts_list = [(x, nm[x]['status']['state']) for x in nm.all_hosts()]
    for host, status in hosts_list:
        print(f"{host} is {status}")

subnet = "192.168.237.0/24"
scan_subnet(subnet)