# VS Code Dev Container konfiguratsioon

See kaust sisaldab DevContainer seadistuse faili `devcontainer.json`, mis võimaldab avada ROS 2 keskkonna automaatselt Docker-konteineris Visual Studio Code'i kaudu.

## Kasutamine

1. Veendu, et sul on paigaldatud:
   - [Docker Desktop](https://www.docker.com/products/docker-desktop)
   - [Visual Studio Code](https://code.visualstudio.com/)
   - VS Code laiendus: [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

2. Ava kogu repo VS Code'iga ja vali `Reopen in Container`.

See käivitab konteineri, kasutades `docker/Dockerfile` faili.

---

⚠️ `devcontainer.json` eeldab, et Dockerfile asub `docker/` kaustas ja on tasemel `../docker/Dockerfile`