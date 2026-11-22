# Service overview

| Service | Purpose |
|---------|---------|
| Open WebUI | Chat UI that talks to LLMs via the Open AI compatible service endpoint (`OLLAMA_BASE_URL`). RAG is enabled and uses Searxng as the search backend. WebSocket support uses Valkey. |
| Searxng | Privacy-focused search engine that powers the RAG component. Configuration lives in `./searxng_data`. |
| PostgreSQL + pgvector | Stores user data and embeddings. Image `pgvector/pgvector:0.8.7-pg19-trixie` includes the pgvector extension. |
| Valkey | Redis-compatible store for websockets. |
