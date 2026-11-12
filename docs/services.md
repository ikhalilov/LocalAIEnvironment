# Service overview

| Service | Purpose |
|---------|---------|
| Open WebUI | Chat UI that talks to LLMs via the Ollama endpoint (`OLLAMA_BASE_URL`). RAG is enabled and uses Searxng as the search backend. WebSocket support uses Valkey. |
| Searxng | Privacy-focused search engine that powers the RAG component. Configuration lives in `./searxng_data`. |
| n8n | Visual workflow automation tool that can trigger the Open WebUI or Docling services. |
| PostgreSQL + pgvector | Stores user data and embeddings. Image `pgvector/pgvector:0.8.1-pg18-trixie` includes the pgvector extension. |
| Valkey | Redis-compatible store for websockets. |
| Docling | OCR/Document-understanding server with GPU support. The command section downloads the necessary models on first start. |
