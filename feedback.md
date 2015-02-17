Mehr (oder weniger) technisches Feedback:

1) Anwendungen, von denen es nur Binaries gibt, welche ich mir irgendwo
runterladen muss sind mir suspekt. Gibt es für das `swarm` Program irgendwo den
Quellcode?

2) related to 1): Wird euer Service irgendwann mal Open Source? Falls nein -> 3)

3) Gibt es eine Möglichkeit sich lokal einen Swarm Service einzurichten, ähnlich
dem Docker Service? Die Antwortzeiten sind mitunter ziemlich lange und
Starten/Stoppen/Löschen/Anlegen dauert mitunter sehr lange.

4) Gibt es eine Möglichkeit die Docker images im Swarm zu inspizieren bzw. zu
modifizieren? Also das Gegenstück zu `docker {inspect,exec}`?

5) Logging ist genauso langsam wie der Rest, manchmal tauchen überhaupt keine
Logs auf. Auch hier wäre eine lokale Instanz wieder sehr vorteilhaft.

6) Die Befehle `swarm {start,stop,up,create}` sind sehr kommunkationsarm. Der
Throbber (das `/|\` Ding) dreht sich minutenlang ohne das man erfährt was gerade
passiert, oder ob überhaupt was passiert.
In diese Kategorie fällt auch das Standard-Verhalten von `{start,up,create}`:  
Eine fehlerhafte Komponente wird endlos neugestartet, ohne Rückmeldung und ohne
Konfigurationsmöglichkeit. Gerade um eine neue App auszuprobieren wäre "fail
early" besser: Anhalten beim ersten Fehlversuch.

7) Das Verlinken der Container empfand ich als undurchsichtig. V.a. in der
Kombination mit Ports in der `swarm.json` ist es mir schwergefallen einen
genauen Bezug zu meinen lokalen Docker Instanzen herzustellen, die ich einfach
nur mit `run --link cassandra:cassandra` etc. gestartet habe, ohne auch nur
einmal `-p` oder `-P` für die anhängigen Instanzen zu nutzen.

8) Die Möglichkeit zum Update ist etwas dünn, ich kann nur einen Container
laden, aber nicht die `swarm.json` verändern. Das wäre praktisch um z.B. die
gesamte Konfiguration zu ändern (von einem Service zu mehreren), oder auch um
einfach nur Ports zu ändern.

9) Ich habe mehrere unnötige Pulls beobachtet. Sieht aus wie eine Endlosschleife
und zieht den startup ziemlich in die Länge.

    2015-02-13 13:10:05.897747 +0000 UTC - docker  - Status: Image is up to date for jotrk/reddit-cassandra:latest
    2015-02-13 13:10:08.435102 +0000 UTC - docker  - Pulling repository jotrk/reddit-cassandra
    2015-02-13 13:10:10.169692 +0000 UTC - docker  - Status: Image is up to date for jotrk/reddit-cassandra:latest
    2015-02-13 13:10:11.912371 +0000 UTC - docker  - Pulling repository jotrk/reddit-cassandra
    2015-02-13 13:10:13.423159 +0000 UTC - docker  - Status: Image is up to date for jotrk/reddit-cassandra:latest
    2015-02-13 13:10:15.044308 +0000 UTC - docker  - Pulling repository jotrk/reddit-cassandra
    2015-02-13 13:10:16.726314 +0000 UTC - docker  - Status: Image is up to date for jotrk/reddit-cassandra:latest
    [ad nauseam]

10)

    501: All the given peers are not reachable (Tried to connect to each peer twice and failed) [0]

Hilfe??

(Hat Euer fabelhafter Support am Samstag Abend noch aufgelöst, aber aus
Anwendersicht: was bedeutet die Fehlermeldung?)

11) Welchen Sinn hat die Gliederung in App/Service/Component?
Dazu finde ich leider nichts in der Dokumentation.

12) Warum ist meine Datenbank auf einmal weg?
    Und warum sind die Logs für die entsprechende Komponente leer?

Generelle Fragen:

1) Wie steht es um Load Balancing? Muss sich meine App selber drum kümmern? Wenn
meine App load balancing kann (d.h. ich habe z.B. einen Datenbank Cluster, der
mit dynamisch hinzugefügten Knoten umgehen kann), kann ich dann einfach `scale
up` sagen und die Sache läuft? Gibt es eine Heuristik bzw. Policy um das zu
automatisieren? Wird nach CPU Zeit, Speicherlast oder Verbindungen gehandelt?
Oder aus einer Kombination? Oder welcher Indikator zuerst brennt?  
Wie wird mit temporären Lastspitzen umgegangen?

2) Wenn ich das richtig verstanden habe, ist euer "Kernprodukt" Orchestration.
Dazu gehört afaik auch Billing, wie wollt oder habt ihr das umgesetzt? Gibt es
eine Flatrate? :)

3) Ist Euch `Apache Mesos` bekannt? Würde das für Euch Sinn machen? Falls ja,
plant Ihr es einzusetzen?

4) Ich will für meine App mit Continous Integration entwickeln. Gibt es dafür
Unterstützung durch Euer System?

5) Kann man Eueren Dienst als `Platform as a Service` bezeichnen?

6) Warum habt Ihr Euch für Go entschieden?

7) `CoreOs` hat mit `Docker` gebrochen und entwickelt nun `Rocket`. Wollt Ihr
das {kurz,mittel,lang}fristig auch unterstützen? Wie ist Eure Meinung dazu?
