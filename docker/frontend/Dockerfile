FROM node:22-bookworm-slim

ENV NEXT_TELEMETRY_DISABLED=1
WORKDIR /app
COPY docker/frontend/entrypoint.sh /usr/local/bin/app-entrypoint

EXPOSE 3000
ENTRYPOINT ["sh", "/usr/local/bin/app-entrypoint"]
CMD ["npm", "run", "dev", "--", "--hostname", "0.0.0.0"]
