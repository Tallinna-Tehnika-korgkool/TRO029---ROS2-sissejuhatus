# ROS 2 Docker-konteiner õppekeskkond (TRO029)

See kaust sisaldab Docker-põhist ROS 2 Humble konteineri keskkonda, mida kasutatakse kursusel **TRO029 — Sissejuhatus ROS 2**. See konteiner võimaldab tudengitel käivitada ROS 2 süsteemi oma arvutis kiiresti ja ilma keerulise paigalduseta, kasutades **VS Code'i** ja **GitHub Classroom**i.

---

## 🧰 Eeldused

- [Docker Desktop](https://www.docker.com/products/docker-desktop) on paigaldatud
- Git tööriist on olemas (nt Git Bash, WSL, VS Code Terminal jne)
- VS Code soovituslik koos [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) laiendusega

---

## 🚀 Keskkonna käivitamine VS Code'iga

1. **Klooni oma GitHub Classroomi repo** (see sisaldab `docker/` kausta):

    ```bash
    git clone https://github.com/[SINU-KASUTAJA]/TRO029-week01-02_intro.git
    cd TRO029-week01-02_intro/docker
    ```

2. **Ava kaust VS Code'iga** ja vali:  
   👉 *"Reopen in Container"* (VS Code pakub seda automaatselt, kui DevContainer on määratud)

3. **Valmis!** VS Code käivitab konteineri, kus ROS 2 on juba seadistatud.  
   Terminal peaks näitama, et oled konteineri sees ning saad kasutada näiteks:

    ```bash
    ros2 --version
    ```

---

## 🛠️ Kuidas see töötab?

- `Dockerfile` ja `supervisord.conf` failid asuvad `docker/` kaustas
- Konteiner sisaldab ROS 2 Humble, build-tööriistu, supervisord daemonit jne
- VS Code DevContainer failid toetavad automaatset avamist konteineris

---

## 🧪 Automaatne testimine

> Tudengi ülesandekaustas `student/` asub **tühi Dockerfile**, mida tuleb täita.

- Kui `student/Dockerfile` on õigesti täidetud, siis **GitHub Actions** test workflow `.github/workflows/test-dockerfile.yml` kontrollib selle.
- Test kontrollib, kas:
  - konteiner ehitub edukalt,
  - ROS 2 on kasutatav (`ros2 --version`).

Tulemusi saab näha **GitHub repo `Actions` tabilt** pärast `git push`i.

---

## 🧠 Märkused õpetajale

- `docker/` kaust asub **pearepos** (TRO029---ROS2-sissejuhatus) ning on jagatud kõigile nädalatele
- Tudengi isiklik repo sisaldab `docker/` sümboolset/kopeeritud koopiat või viita

---

## 🆘 Abi

Kui konteiner ei tööta:

- Veendu, et Docker Desktop on käivitatud
- Kontrolli, kas VS Code'il on Dev Containers plugin
- Ava terminalis `docker ps` või `docker info` ja kontrolli veateateid

