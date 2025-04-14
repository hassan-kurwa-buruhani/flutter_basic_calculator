
#!/bin/bash
echo "Finding Local IP...."
IP=$(ip -4 a show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
echo "Your IP: $IP"


echo "Starting Flutter Web Server....."
flutter run -d web-server --web-hostname=0.0.0.0 --web-port=8080 


echo "Done!"
