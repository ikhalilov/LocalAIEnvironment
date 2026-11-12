# Customization

- Add a new LLM – Update `OLLAMA_BASE_URL` or swap the container image that exposes the same API.
- Change the search engine – Edit `RAG_WEB_SEARCH_ENGINE` and `SEARXNG_QUERY_URL` in docker-compose.yml.
- Persist data – Docker volumes at the bottom of the compose file are retained across restarts.
- GPU usage – Ensure Docker Desktop has GPU support enabled and adjust `CUDA_VISIBLE_DEVICES` if you need a different GPU set.
