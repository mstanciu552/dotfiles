#!/bin/bash

IP=$(curl https://ipinfo.io/ip)

echo "New IP: $IP" | mail -s "[!] Public IP Change" "mstanciu552@gmail.com"
