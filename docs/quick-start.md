# Quick Start

```bash
git clone https://github.com/ikhalilov/LocalAIEnvironment.git
cd local-ai-env
cp .env.example .env          # copy default configuration
docker compose up -d          # start all services in the background
```

Wait a few seconds for the containers to finish initializing. You can now access the UI at:

- Open WebUI – http://localhost:3000
- Docling – http://localhost:5001
- Searxng – http://localhost:8080
- n8n – http://localhost:5678
