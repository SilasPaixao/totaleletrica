FROM nginxinc/nginx-unprivileged:1.27-alpine

LABEL org.opencontainers.image.title="Sampaio Total Elétrica" \
      org.opencontainers.image.description="Landing page da Sampaio Total Elétrica" \
      org.opencontainers.image.source="https://github.com/OWNER/REPO"

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY site/ /usr/share/nginx/html/

EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://127.0.0.1:8080/healthz || exit 1
