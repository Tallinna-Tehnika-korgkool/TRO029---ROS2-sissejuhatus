# ROS 2 sissejuhatav kursus (TRO013)

Tere tulemast ROS 2 (Robot Operating System 2) sissejuhatavale kursusele!  
Selle kursuse eesmärk on anda tudengitele praktilised teadmised ja oskused ROS 2 platvormil töötamiseks, kasutades kaasaegseid tööriistu nagu Docker ja Linuxi käsurida.

Kursus toimub GitHubi kaudu – kogu õppe- ja töövahendite struktuur on kättesaadav selles repositooriumis.

---

##  Kursuse ülesehitus

Kursus kestab **14 nädalat** ja jaguneb **7 peatükiks**, igaüks 2-nädalase tsükliga.  
Iga peatükk sisaldab:  
Õpieesmärgid  
Teoreetiline materjal  
Praktilised harjutused  
(valikuline) Lahendused ja testid

| Nädalad     | Peatükk | Teema |
|-------------|---------|-------|
| 1–2         | 1. Sissejuhatus | ROS 2 ja Docker töövahendid |
| 3–4         | 2. Linuxi käsurida | Terminal ja failihaldus |
| 5–6         | 3. ROS 2 arhitektuur | Nodes, topics, services, actions |
| 7–8         | 4. Tööruum ja paketid | ROS 2 workspace ja colcon |
| 9–10        | 5. Pub/Sub Pythonis | Publisher ja Subscriber node’id |
| 11–12       | 6. Teenused ja tegevused | Services ja Actions |
| 13–14       | 7. Launch-failid | Süsteemi koostamine ja käivitamine |

---

## 🐳 Docker kasutamine

Enne alustamist veendu, et sul on paigaldatud:

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Git (või kasuta terminali VS Code’is, PyCharmis vms)

### Repo kloonimine ja konteineri käivitamine:

```bash
git clone https://github.com/Tallinna-tehnikakorgkool/TRO013.git
cd TRO013
docker build -t ros2-student-image ./docker
docker run -it --rm --net=host --privileged ros2-student-image
```

>  Alternatiivina võid kasutada eelvalmistatud Docker Hub pilti (juhised kaustas `/docker`).

---

##  Peatükkide sisu

Kogu kursuse materjal asub kaustas [`/chapters`](./chapters/).  
Iga nädal saab tudeng keskenduda konkreetsele kaustale:

- [📁 week01-02_intro](./chapters/week01-02_intro) – Sissejuhatus ja Docker
- [📁 week03-04_linux](./chapters/week03-04_linux) – Linuxi käsurea alused
- [📁 week05-06_architecture](./chapters/week05-06_architecture) – ROS 2 arhitektuur
- [📁 week07-08_workspace](./chapters/week07-08_workspace) – Workspace ja paketid
- [📁 week09-10_pubsub](./chapters/week09-10_pubsub) – Publisher / Subscriber
- [📁 week11-12_services](./chapters/week11-12_services) – Services ja Actions
- [📁 week13-14_launch](./chapters/week13-14_launch) – Launch-failid ja süsteem

---

##  Küsimused ja tugi

Kui sul tekib küsimusi või tehnilisi probleeme:
- Kontrolli esmalt README-s toodud juhiseid ja veaotsingu nõuandeid
- Võta vajadusel ühendust kursuse juhendajaga

---

Head õppimist ja katsetamist!  
*TRO013 kursus – Tallinna Tehnikakõrgkool*
