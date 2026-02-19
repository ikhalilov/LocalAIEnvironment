# Local AI Environment

A lightweight Docker stack that brings together **Open‑WebUI**, **Searxng**, **n8n**, PostgreSQL with the pgvector extension, Valkey, and Docling.

The stack is ready to run locally with a single `docker compose up` command.

## 🚀 Quick start

```bash
git clone https://github.com/ikhalilov/LocalAIEnvironment.git
cd local-ai-env
cp .env.example .env          # copy default configuration
docker compose up -d          # start all services in the background
```

Wait a few seconds for the containers to finish initializing. You can now access the UI at:

- Open WebUI – http://localhost:3000
- Docling – http://localhost:5001 (http://localhost:5001)
- Searxng – http://localhost:8080 (http://localhost:8080)
- n8n – http://localhost:5678 (http://localhost:5678)

## 📄 Environment variables

The stack uses a single .env file. The repository ships a .env.example that contains sane defaults. Create a copy:

cp .env.example .env

| Variable | Description | Default |
|----------|-------------|---------|
| POSTGRES_USER | DB username | postgres |
| POSTGRES_PASSWORD | DB password | postgres |
| POSTGRES_DB | Database name | postgres |
| VALKEY_HOST | Valkey service name | valkey |
| VALKEY_PORT | Valkey port | 6379 |
| VALKEY_PASSWORD | Valkey password | password |
| SEARXNG_PORT | Searxng HTTP port | 8080 |
| SEARXNG_BIND_ADDRESS | Searxng bind address | 0.0.0.0 |
| DOCLING_SERVE_ARTIFACTS_PATH | Path to Docling models | /opt/app-root/src/.cache/docling/models |
| DOCLING_OCR_ENGINE | OCR engine to download | easyocr |
| CUDA_VISIBLE_DEVICES | GPU indices for Docling | 0,1 |

Other values are set directly in docker-compose.yml via the environment section. Modify the file if you need different ports or container names.

## 🛠️ Service overview

| Service | Purpose |
|---------|---------|
| Open WebUI | Chat UI that talks to LLMs via the Ollama endpoint (OLLAMA_BASE_URL). RAG is enabled and uses Searxng as the search backend. WebSocket support uses Valkey. |
| Searxng | Privacy‑focused search engine that powers the RAG component. Configuration lives in ./searxng_data. |
| n8n | Visual workflow automation tool that can trigger the Open WebUI or Docling services. |
| PostgreSQL + pgvector | Stores user data and embeddings. Image pgvector/pgvector:0.8.1-pg18-trixie includes the pgvector extension. |
| Valkey | Redis‑compatible store for websockets. |
| Docling | OCR/Document‑understanding server with GPU support. The command section downloads the necessary models on first start. |

## 🔧 Customization

- Add a new LLM – Update OLLAMA_BASE_URL or swap the container image that exposes the same API.
- Change the search engine – Edit RAG_WEB_SEARCH_ENGINE and SEARXNG_QUERY_URL in docker-compose.yml.
- Persist data – Docker volumes at the bottom of the compose file are retained across restarts.
- GPU usage – Ensure Docker Desktop has GPU support enabled and adjust CUDA_VISIBLE_DEVICES if you need a different GPU set.

## 📖 Documentation & resources

- Open WebUI (https://github.com/open-webui/open-webui)
- Searxng (https://github.com/searxng/searxng)
- n8n (https://github.com/n8n-io/n8n)
- Docling (https://github.com/docling-project/docling-serve)
- PostgreSQL + pgvector (https://github.com/pgvector/pgvector)
- Valkey (https://github.com/valkey-io/valkey)

## 🤝 Contributing

Feel free to open issues or pull requests. The repo is intentionally minimal, so improvements that make the stack more robust or easier to configure are welcome.

## 📜 License

This project is provided as‑is under the MIT License. See the LICENSE (LICENSE) file for details.
