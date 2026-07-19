#!/bin/bash

echo "🚀 Starting n8n and Ngrok tunnel..."

# 1. Start Docker
echo "📦 Spinning up n8n container..."
sudo docker compose up -d

# 2. Wait for n8n
echo "⏳ Waiting for n8n to start on port 5678..."
while ! curl -s http://localhost:5678 >/dev/null; do
  sleep 2
done
echo "✅ n8n is up and running!"

# 3. Start Ngrok in the background
echo "🌐 Starting tunnel..."
# Ensure you have ngrok installed and configured
ngrok http 5678 --url=[your ngrok url] &
NGROK_PID=$!

echo "✨ Everything is live!"
echo "   Interface: your ngrok url"
echo "-----------------------------------"
echo "Press [CTRL+C] to stop both services."

# 4. Keep the script alive so the tunnel stays open
wait $NGROK_PID

# Cleanup on exit
trap "echo -e '\n🛑 Stopping services...'; kill $NGROK_PID; sudo docker compose down; exit" SIGINT SIGTERM
