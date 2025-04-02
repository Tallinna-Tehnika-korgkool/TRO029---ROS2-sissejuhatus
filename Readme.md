# ROS 2 Docker-konteiner tudengitele

See repo sisaldab Docker-põhist ROS 2 Humble konteinerit, mis on loodud kasutamiseks sissejuhatava ROS 2 kursuse raames. Konteiner võimaldab tudengitel kiiresti alustada tööd ilma keerulise paigaldusprotsessita.

## Nõuded

- Paigaldatud [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Git-tugi (näiteks [Git](https://git-scm.com/), või sisseehitatud terminal VS Code'is, PyCharmis või muus koodiredaktoris)

> Git käske saab kasutada erinevates terminalides: VS Code'i Terminal, Git Bash, PyCharma sisseehitatud terminal, WSL jne.

## Repo kloonimine ja Docker-image ehitamine

1. Ava terminal (nt. VS Code Terminal või Git Bash) ja klooni see repo:

    ```bash
    git clone https://github.com/Tallinna-tehnikakorgkool/TRO013.git
    cd TRO013
    ```

2. Ehita Docker-pilt:

    ```bash
    docker build -t ros2-student-image .
    ```

3. Käivita konteiner:

    ```bash
    docker run -it --rm --net=host --privileged ros2-student-image
    ```

>  `--net=host` ja `--privileged` tagavad parema võrguühenduse ja seadmete toe ROS 2 jaoks.

## (Valikuline) Image-i allalaadimine Docker Hubist

Kui õpetaja on image juba Docker Hubi üles laadinud, saab selle tõmmata ja käivitada ilma ise ehitamata:

```bash
docker pull kasutajanimi/ros2-student-image:humble
docker run -it --rm --net=host --privileged kasutajanimi/ros2-student-image:humble
