# n8n-self-hosted-docker

Run **n8n for free** using Docker + a free ngrok dev URL.

## How to use

1. **Clone the repo**

   ```bash
   git clone <this-repo-url>
   cd n8n-self-hosted-docker
   ```

2. **Add your free ngrok dev URL**

   - In `docker-compose.yml`, set `WEBHOOK_URL` to your ngrok URL
   - In `run.sh`, replace `[your ngrok url]` with the same URL

3. **Make the script executable**

   ```bash
   chmod +x run.sh
   ```

4. **Run it**

   ```bash
   sudo ./run.sh
   ```

n8n will start on `localhost:5678` and be exposed via ngrok at your dev URL.
