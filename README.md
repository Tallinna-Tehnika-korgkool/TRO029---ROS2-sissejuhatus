# TRO029 – ROS2 sissejuhatus

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
|---------|--------------------------------|------|
| 01–02   | [`week01-02_intro`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week01-02_intro-template) | VS Code + Docker + ROS 2 keskkonna seadistamine |
| 03–04   | [`week03-04_linux`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week03-04_linux-template) | Linux CLI põhitõed, failisüsteem, tööriistad |
| 05–06   | [`week05-06_architecture`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week05-06_architecture-template) | ROS 2 arhitektuur: noded, teegid, topicud |
| 07–08   | [`week07-08_workspace`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week07-08_workspace-template) | Workspace ja pakettide loomine |
| 09–10   | [`week09-10_pubsub`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week09-10_pubsub-template) | Publisher / Subscriber mustri rakendamine |
| 11–12   | [`week11-12_services`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week11-12_services-template) | Services ja Actions |
| 13–14   | [`week13-14_launch`](https://github.com/Tallinna-Tehnika-korgkool/TRO029-week13-14_launch-template) | Launch failid ja süsteemide ühendamine |

# TRO029 ROS2 Kursus - Tudengi Juhend

## 🧪 Arenduskeskkond: Firebase Studio (IDX)

Selles kursuses kasutame **Firebase Studio (IDX)** pilvepõhist arenduskeskkonda.

IDX võimaldab:
- töötada **otse veebibrauseris** (VS Code’i sarnane keskkond),
- kasutada **Dockerit ilma lokaalset paigaldust tegemata**,
- käivitada **valmis ROS 2 Humble keskkonda**,
- vältida operatsioonisüsteemi- ja paigaldusprobleeme.

👉 **Soovituslik ja eelistatud viis kursuse läbimiseks on IDX kasutamine.**

Saad seda repositooriumit kasutada ka Docker desktop tarkvara kasutades. Selleks vaata Chapters/week01-02/Readme.md

---

## 🔑 Konto nõue (VÄGA OLULINE)

IDX ja GitHub **peavad olema seotud sinu koolikontoga**.

⚠️ **Kasuta alati oma `@tktk.ee` e-posti aadressi**, mis:
- on sinu ametlik koolikonto,
- on sama konto, millega oled GitHubis,
- on seotud kursuse ja GitHub Classroomi õigustega.

Kui sul on GitHubis mitu kontot, veendu, et:
- IDX-s oled sisse logitud **@tktk.ee kontoga**,
- see konto omab ligipääsu sellele repositoryle.

---

## 🚀 Kursuse avamine Firebase Studios (IDX)

### Esmakordne avamine

1. Ava Firebase Studio (IDX):  
   👉 https://idx.google.com

2. Logi sisse **oma `@tktk.ee` kontoga**

3. Vali **“Import repository”** / **“Open repository”**

4. Sisesta kursuse GitHub repo aadress:
   ```text
   https://github.com/Tallinna-Tehnika-korgkool/TRO029---ROS2-sissejuhatus.git
Oota, kuni workspace käivitub

⏳ Esimene käivitamine võib võtta mitu minutit, kuna:

ehitatakse Docker image,

paigaldatakse ROS 2 ja vajalikud tööriistad.

🐳 Mis toimub taustal?
Kui IDX workspace käivitub:

kasutatakse faili .idx/dev.nix,

lubatakse Docker teenus,

ehitatakse ROS 2 Humble Docker image (tro029-ros2),

käivitatakse konteiner automaatselt,

kogu ROS 2 töö toimub Docker-konteineri sees.

👉 Tudengina ei pea:

Dockerit käsitsi seadistama,

ROS 2 installima,

süsteemseid konfiguratsioone muutma.

ei pea olema kooli võrgus

## 📋 Ülevaade

Sa töötad **kahes keskkonnas**:
1. **Firebase IDX** - Siin on kogu õppematerjal ja sa saad õppida/testida
2. **GitHub Classroom** - Siia esitad oma lahendused hindamiseks

```
┌─────────────────────────────────────────────────────────────┐
│  FIREBASE IDX (Õppekeskkond)                                │
│  • TRO029 pearepo kõigi chapteritega                        │
│  • ROS2 Docker konteiner                                    │
│  • Saad vabalt katsetada ja õppida                          │
│  • ❌ Siit EI esita lahendusi                               │
└─────────────────────────────────────────────────────────────┘
                            ↓
                    Kopeeri lahendus
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  GITHUB CLASSROOM (Hindamiskeskkond)                        │
│  • Iga nädala/chapter jaoks eraldi repo                     │
│  • Siia pushid oma lõpliku lahenduse                        │
│  • ✅ Automaattestid annavad tagasiside                     │
│  • ✅ Hinded lähevad Moodle'sse                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🚀 Esmakordne Seadistamine (Tehke AINULT ÜHEKORDSELT)

### 1. Ava Firebase IDX keskkond

1. Mine oma Moodle kursusele
2. Kliki **Firebase IDX** lingile
3. Logi sisse oma Google kontoga
4. Oota kuni keskkond laadib (see võtab 1-2 minutit)

✅ **Märk, et kõik on valmis:** Näed terminalis teadet:
```
╔════════════════════════════════════════════════════════════╗
║   TRO029 - ROS2 Sissejuhatus                               ║
║   Tallinna Tehnikakõrgkool                                 ║
╚════════════════════════════════════════════════════════════╝
✓ ROS2 keskkond on valmis!
```

### 2. Seadista Git (AINULT ESIMESEL KORRAL)

Avad **uus terminal** (mitte Docker terminal!):
- Kliki terminal aknas **+** nuppu
- Vali **New Terminal**

Sisesta järgmised käsud:

```bash
git config --global user.name "Sinu Nimi"
git config --global user.email "sinu.email@tktk.ee"
```

**Kasuta oma päris nime ja kooli emaili!**

### 3. Autendi GitHub (AINULT ESIMESEL KORRAL)

```bash
gh auth login
```

Vali:
- **GitHub.com**
- **HTTPS**
- **Login with a web browser**
- Kopeeri kood ja kliki lingile
- Autendi brauseris

✅ **Test:** Sisesta `gh auth status` - peaks näitama "Logged in"

---

## 📚 Iga Nädala/Chapteri Töövoog

### SAMM 1️⃣: Uuri Õppematerjali (Firebase IDX)

**Kus:** Firebase IDX, TRO029 pearepos

1. Ava **File Explorer** vasakul
2. Mine `Chapter-XX/` kausta (nt. `Chapter-01/`)
3. Loe `README.md` - seal on:
   - 📖 Teooria selgitus
   - 🎯 Ülesannete kirjeldused
   - 💡 Näpunäited ja näited

4. **Õppimiseks ja testimiseks kasuta Docker terminali:**

```bash
# Sa oled juba Docker konteineris (näed bash prompti)
cd /workspace/Chapter-01

# Vaata näidet
ros2 run demo_nodes_cpp talker

# Testi oma koodi
colcon build
colcon test

# Katsetä vabalt, siin ei midagi katki lähe! ✨
```

💡 **Oluline:** Selles keskkonnas võid vabalt katsetada. See on ÕPPIMISEKS, mitte hindamiseks!

---

### SAMM 2️⃣: Võta Vastu GitHub Classroom Assignment

**Kus:** Moodle → vastav nädala link

1. Mine **Moodle'sse**
2. Leia õige nädala assignment (nt. "Chapter 01 - ROS2 põhitõed")
3. Kliki **GitHub Classroom** lingile
4. Kliki **Accept this assignment**
5. Oota kuni GitHub loob sinu personaalse repo

✅ **Tulemus:** Saad lingi oma isiklikule repo'le:
```
https://github.com/TTK-TRO029/chapter-01-[sinu-github-username]
```

📋 **Kopeeri see link!** Vajad seda järgmises sammus.

---

### SAMM 3️⃣: Klooni Oma GitHub Classroom Repo

**Kus:** Firebase IDX, **uus terminal** (EI ole Docker terminal!)

```bash
# Mine oma kodukatalogi
cd ~/

# Klooni oma personaalne repo (kasuta oma linki!)
git clone https://github.com/TTK-TRO029/chapter-01-[sinu-username].git

# Mine repo kausta
cd chapter-01-[sinu-username]
```

💡 **Miks eraldi terminal?** Sest git käsud peavad käima Firebase IDX süsteemis, mitte Docker konteineris!

---

### SAMM 4️⃣: Lahenda Ülesanded

Nüüd töötad **oma GitHub Classroom repo kaustas:**

```bash
# Vaata, mis ülesanded sul on
ls -la
cat README.md

# Ava failid Code editoris (vasakul File Explorer)
# Näiteks: src/my_package/my_node.cpp
```

**Testimiseks:**

1️⃣ **Kopeeri failid Docker workspace'i** (kui vaja ROS2 käske):
```bash
# Uues terminalaknas (MITTE Docker terminal)
cp -r ~/chapter-01-[username]/* /workspace/chapter-work/
```

2️⃣ **Docker terminalil** testi:
```bash
cd /workspace/chapter-work
colcon build
colcon test
ros2 run my_package my_node
```

3️⃣ **Kui töötab**, kopeeri tagasi:
```bash
# Uues terminalaknas (MITTE Docker)
cp -r /workspace/chapter-work/* ~/chapter-01-[username]/
```

💡 **Lihtsamalt:** Võid ka kohe töötada `~/chapter-01-username/` kaustas ja testida Git commits vahepeal.

---

### SAMM 5️⃣: Esita Lahendus (Git Push)

**Kus:** Firebase IDX, **uus terminal** (EI ole Docker terminal!)

```bash
# Mine oma repo kausta
cd ~/chapter-01-[sinu-username]

# Kontrolli, mis failid muutsid
git status

# Lisa kõik muudatused
git add .

# Tee commit koos kirjeldusega
git commit -m "Completed tasks 1-3"

# Push GitHubile
git push origin main
```

✅ **Mis nüüd juhtub:**
1. GitHub saab sinu koodi
2. **Automaattestid** käivituvad (võtab 2-5 minutit)
3. Saad tulemuse (roheline ✓ või punane ✗)

---

### SAMM 6️⃣: Kontrolli Tulemusi

**Kus:** GitHub, sinu repo

1. Mine oma repo lehele brauseris:
   ```
   https://github.com/TTK-TRO029/chapter-01-[sinu-username]
   ```

2. Kliki **Actions** tabile (ülaosas)

3. Näed oma viimast push'i:
   - 🟢 **Roheline ✓** = Kõik testid läbitud! Võid rahul olla 🎉
   - 🔴 **Punane ✗** = Mõni test ebaõnnestus

4. **Kui punane ✗:**
   - Kliki workflow nimele
   - Kliki konkreetsele job'ile (nt. "test")
   - Vaata, mis läks valesti (logid on üksikasjalikud!)
   - Paranda oma kood Firebase IDX-s
   - Tee uus commit ja push (SAMM 5 uuesti)

---

## 🔄 Korduv Workflow (Iga Chapter)

```
1. 📖 Õpi materjaliga (Firebase IDX, TRO029 pearepo)
        ↓
2. ✅ Võta vastu GitHub Classroom assignment (Moodle link)
        ↓
3. 📥 Klooni oma personaalne repo (git clone)
        ↓
4. 💻 Lahenda ülesanded (oma repo kaustas)
        ↓
5. 🧪 Testi (Docker konteineris)
        ↓
6. 📤 Esita (git add, commit, push)
        ↓
7. ✓ Kontrolli tulemust (GitHub Actions tab)
        ↓
8. 🔁 Kui vaja, paranda ja push uuesti
```

---

## 💡 Kasulikud Näpunäited

### ✨ Kui Midagi Läheb Valesti

**"Ma ei tea, kas olen Docker terminalis või mitte"**
```bash
# Kontrolli prompti:
# Docker konteiner: root@containerid:/workspace#
# Firebase IDX: tro029-main-xxx:~/$
```

**"Minu Docker konteiner ei tööta"**
```bash
# Vaata konteineri staatust
docker ps -a

# Taaskäivita
docker restart tro029-ros2

# Ühenda uuesti
docker exec -it tro029-ros2 bash
```

**"Git ütleb 'permission denied'"**
```bash
# Kontrolli, kas oled õiges kaustas
pwd  # Peaks olema ~/chapter-01-username

# Kontrolli autentimist
gh auth status
```

**"Automaattestid ebaõnnestuvad, aga mul töötab!"**
- Kontrolli, kas pushisid KÕIK failid (sh uued failid)
- Vaata GitHub Actions logi täpsemalt
- Võimalik, et unustasid mõne sõltuvuse lisada `package.xml`

### 📝 Head Tavad

✅ **DO (Tee nii):**
- Commit sageli väikeste muudatustega
- Kirjuta selged commit sõnumid: "Added publisher node"
- Testi enne push'i
- Loe testide tagasisidet tähelepanelikult

❌ **DON'T (Ära tee nii):**
- Ära oota viimase minutini
- Ära push koodi, mis ei kompileeru
- Ära ignoreeri testide hoiatusi
- Ära kustuta õppematerjali faile

### 🎯 Tulemuslikkuse Jälgimine

**GitHub Classroom Dashboardis** (õppejõud näeb):
- ✅ Kas sa oled assignment'i vastu võtnud
- ✅ Millal viimati pushisid
- ✅ Mitu testi läbisid
- ✅ Sinu punkte

**Moodles** lähevad automaatselt:
-   Lõplikud hinded
-   Progress overview

---

##  Abi Saamine

1. **Tehnilised probleemid IDX/Dockeriga:** Kirjuta õppejõule
2. **Ülesannete sisu küsimused:** Vaata esmalt `README.md`, siis küsi õppejõult
3. **Git/GitHub probleemid:** Vaata [GitHub Docs](https://docs.github.com) või küsi kaaslastelt

---

##  Edu kursusega!

Mäleta:
-  **Firebase IDX = Õppimiseks** (vaba katsetamine)
-  **GitHub Classroom = Hindamiseks** (sinu lõplik tulemus)
-  Võid pusida nii palju kordi kui vaja
- ⏱ Automaattestid annavad kohese tagasiside
-  Püsivus toob tulemusi!

**Edu õppimisega! **