# Docker-keskkond kursusele TRO029 — ROS2 sissejuhatus

See kaust sisaldab standardset Docker-keskkonda, mida kasutatakse kursusel **TRO029 — ROS2 sissejuhatus**. Keskkond põhineb [ROS 2 Humble](https://docs.ros.org/en/humble/) versioonil ja on mõeldud kasutamiseks koos Visual Studio Code'iga.

##  Mis siin kaustas on?

- `Dockerfile` — määratleb, milline tarkvara ja sõltuvused on konteineris saadaval.
- `supervisord.conf` — konfigureerib protsesside haldamise konteineri sees.
- `.devcontainer/` — Visual Studio Code'i konfiguratsioon kausta automaatseks konteineris avamiseks.

##  Keskkonna käivitamine VS Code'iga

1. Veendu, et sul on paigaldatud:
   - [Docker Desktop](https://www.docker.com/products/docker-desktop)
   - [Visual Studio Code](https://code.visualstudio.com/)
   - VS Code'i laiendus: **Dev Containers**  
     [Installi siit](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

2. Ava see projekt VS Code'is:

   ```bash
   git clone https://github.com/Tallinna-Tehnika-korgkool/TRO029---ROS2-sissejuhatus.git
   cd TRO029---ROS2-sissejuhatus
   code .
   ```

3. VS Code küsib:  
    **„Reopen in Container”** – vali see!  
   See käivitab konteineri automaatselt kasutades `.devcontainer` konfiguratsiooni.

4. Terminalis kontrolli, kas ROS 2 on töötav:

   ```bash
   ros2 --version
   ```

Kui näed ROS 2 versiooni, on kõik korras 🎉

##  Märkused

- See konteiner **ei sisalda ühtegi kursuse spetsiifilist ülesannet** – see on baasõpikeskkond.
- Tudengi isiklikes ülesannete repodes (nt week01-02) kasutatakse seda keskkonda viitena või koopiana.

---

 Probleemide korral kontrolli, kas Docker töötab (`docker info`) ja kas VS Code'il on Dev Containers plugin.

