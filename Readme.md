# TRO029 — ROS2 sissejuhatus

See kursus on sissejuhatus ROS 2 Humble Framework’i, mille eesmärk on aidata tudengitel samm-sammult üles ehitada iseseisev mobiilne robotisüsteem ROS 2 platvormil. Kursus keskendub praktilistele oskustele ja katab kogu arendustsükli alates keskkonna seadistamisest kuni süsteemi käivitamiseni `launch` failide kaudu.

## Kursuse teemad

- Docker-põhise ROS 2 õpikeskkonna seadistamine
- Linux käsurea tööriistade kasutamine
- ROS 2 arhitektuur ja sõnumipõhine suhtlus
- ROS 2 tööruumi (`workspace`) ja pakettide (`package`) struktuur
- Publisher / Subscriber mustrid
- Services ja Actions
- Launch failide koostamine ja süsteemide ülesehitus

## Õppematerjalide struktuur

Iga teema on jagatud kahe nädalaseks plokiks ja hallatud eraldi Git submodule'ina kaustas `chapters/`.

| Nädalad | Teema (link) | Sisu |
|--------|----------------|------|
| 01–02  | [`week01-02_intro`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week01-02_intro-template) | VS Code + Docker + ROS 2 keskkonna seadistamine |
| 03–04  | [`week03-04_linux`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week03-04_linux-template) | Linux CLI põhitõed, failisüsteem, töövood |
| 05–06  | [`week05-06_architecture`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week05-06_architecture-template) | ROS 2 arhitektuur: noded, teegid, tööpõhimõtted |
| 07–08  | [`week07-08_workspace`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week07-08_workspace-template) | Workspace ja pakettide loomine |
| 09–10  | [`week09-10_pubsub`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week09-10_pubsub-template) | Publisher / Subscriber mustri rakendamine |
| 11–12  | [`week11-12_services`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week11-12_services-template) | Services ja Actions |
| 13–14  | [`week13-14_launch`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week13-14_launch-template) | Launch failid ja süsteemide ühendamine |

## Hindamine

- Iga peatüki lõpus on praktiline ülesanne, mis esitatakse GitHub Classroom kaudu.
- Lahendused kontrollitakse automaatselt GitHub Actions töövoogude abil.
- Tähtajaks esitamata tööde puhul ei pruugi saada automaatset tagasisidet.

---

🛠 Kui vajad abi keskkonna seadistamisel, vaata kausta [`docker/`](docker/) ja selle `README.md` faili.
