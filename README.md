# Sampaio Total Elétrica — Landing page

Site estático servido por Nginx (porta 8080) e empacotado em Docker.
A cada push na branch `main` (ou tag `vX.Y.Z`), o GitHub Actions
constrói a imagem e publica em `ghcr.io/<usuario>/<repositorio>`.

## Publicar pela primeira vez

```bash
git init -b main
git add .
git commit -m "Primeira versão do site"
git remote add origin git@github.com:SEU_USUARIO/SEU_REPO.git
git push -u origin main
```

Acompanhe em **Actions**. A imagem aparece em **Packages** do repositório.

> Se o repositório for privado ou o pacote não puder ser baixado, vá em
> Package settings → mude a visibilidade para *Public* ou faça `docker login ghcr.io`.
> Em *Settings → Actions → General → Workflow permissions*, deixe
> "Read and write permissions" caso o push da imagem seja negado.

## Rodar localmente

```bash
docker build -t sampaio-total-eletrica .
docker run --rm -p 8080:8080 sampaio-total-eletrica
# abra http://localhost:8080
```

## Rodar a imagem publicada (servidor)

```bash
docker run -d --name sampaio-site --restart unless-stopped -p 80:8080 \
  ghcr.io/SEU_USUARIO/SEU_REPO:latest
```

## Atualizar o site

Edite `site/index.html`, faça commit e push na `main`. Para versionar:
`git tag v1.0.0 && git push origin v1.0.0`.
