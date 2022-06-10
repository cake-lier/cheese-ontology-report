# Cheese Ontology

## Allineamenti con altre ontologie

L'ontologia è stata realizzata partendo dalle altre ontologie i cui prefissi sono indicati in tabella \ref{tab:prefix}.
Le più rilevanti sono "foodon" e "agrovoc" per quanto riguarda la modellazione dei concetti inerenti agli alimenti, in particolare al formaggio.
L'ontologia "envo" è stata utilizzata per gli ambienti in cui sono realizzati i formaggi.
Le ontologie "foodon" e "envo" sono parte del progetto "OBOFoundry" e sono quindi rappresentate dal prefisso "obo".
È stata utilizzata l'ontologia realizzata dal _Ministero delle Politiche Agricole Alimentari e Forestali_ per la definizione delle certificazioni e dei formaggi certificati.
Questa è rappresntata dai prefissi "food-ita", "food-uppper", "food-cheese" e "food-ricotta". Infine è stata utilizzata l'ontologia "DBPedia", identificata dai prefissi "dbo" e "dbr", per modellare i luoghi di produzione, stagionatura e maturazione dei formaggi.

```{=latex}
\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|p{0.15\textwidth}|X|}
    \hline
    \textbf{Prefisso} & \textbf{Namespace}  \\ \hline
    %
    dbo & \texttt{http://www.dbpedia.org/ontology/} \\ \hline
    dbr & \texttt{http://www.dbpedia.org/resource/} \\ \hline
    obo & \texttt{http://purl.obolibrary.org/obo/} \\ \hline
    owl & \texttt{http://www.w3.org/2002/07/owl\#} \\ \hline
    rdf & \texttt{http://www.w3.org/1999/02/22-rdf-syntax-ns\#} \\ \hline
    xml & \texttt{http://www.w3.org/XML/1998/namespace} \\ \hline
    xsd & \texttt{http://www.w3.org/2001/XMLSchema\#} \\ \hline
    rdfs & \texttt{http://www.w3.org/2000/01/rdf-schema\#} \\ \hline
    agrovoc & \texttt{http://aims.fao.org/aos/agrovoc/} \\ \hline
    food-ita & \texttt{http://w3id.org/food/ontology/denominazione-italiana/} \\ \hline
    food-upper & \texttt{http://w3id.org/food/ontology/disciplinare-upper/} \\ \hline
    food-cheese & \texttt{http://w3id.org/food/ontology/disciplinare-formaggio/} \\ \hline
    food-ricotta & \texttt{http://w3id.org/food/ontology/disciplinare-ricotta/} \\ \hline
 \end{tabularx}
 \caption{Prefissi e namespace utilizzati all'interno dell'ontologia.}
 \label{tab:prefix}
\end{table}
```

## Panoramica

L'ontologia modella i concetti che appartengono al contesto della produzione casearia.
La radice del modello si trova nella classe `Food` che rappresenta un generico alimento, da cui `Cheese` -- che rappresenta un qualsiasi formaggio -- e `Milk` -- che rappresenta un qualsiasi latte -- discendono.

La classe `RawMaterial` esprime il concetto di materia prima, inteso come ingrediente per la realizzazione di un formaggio.
Un formaggio può avere due tipi di invecchiamento: maturazione e stagionatura, espressi rispettivamente dalle classi `Ripening` e `Aging`.
Questi due concetti sono specializzazioni del concetto `Event`, che rappresenta un qualsiasi evento nella realizzazione di un formaggio.
Un evento può aver luogo in un `Environment` che rappresenta un ambiente in cui un formaggio viene invecchiato.
Si è distinto tra tre tipologie di ambienti: `Cave`, la grotta, `Pit`, la fossa, e `Refrigerator`, la cella frigorifera.

Si è modellato il luogo in cui un formaggio viene prodotto, ovvero `PopulatedPlace`, che può essere anche luogo in cui un formaggio viene maturato o stagionato.

Infine è stato modellato il meccanismo delle certificazioni associate ai diversi formaggi.
Un formaggio certificato è quindi un `ProtectedCheese`, specializzazione del concetto `ProtectedFood`, che rappresenta un generico alimento certificato.

In figura \ref{fig:overview} sono rappresentati i concetti appena illustrati e le loro principali relazioni.

![Panoramica dell'ontologia "Cheese Ontology"\label{fig:overview}](images/generic-overview.svg){witdh=100% #fig:overview}

\newpage

In tabella \ref{tab:definitions} vengono date le definizioni delle classi principali definite nel diagramma di figura \ref{fig:overview}.

```{=latex}
\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|X|X|}
    \hline
    \textbf{Concetto} & \textbf{Definizione}  \\ \hline
    %
    Food & Per cibo si intende una qualsiasi sostanza consumata per fornire supporto nutrizionale ad un organismo \\ \hline
    Cheese & Per formaggio si intende un prodotto caseario realizzato in un ampio spettro di sapori, consistenze, e forme attraverso la coagulazione della proteina del latte caseina. \\ \hline
    Milk & Per latte si intende un cibo liquido ricco di nutrienti prodotto dalle ghiandole mammarie dei mammiferi. \\ \hline
    Raw Material & Per materia prima si intende un materiale di base che è utilizzato nella produzione di formaggi. \\ \hline
    Event & Per evento si intende un fenomeno fisico avvenuto nel processo di produzione del formaggio. \\ \hline
    Aging & Per stagionatura si intende il processo di invecchiamento del formaggio quando la sua durata supera un mese. \\ \hline
    Ripening & Per maturazione si intende il processo di invecchiamento del formaggio quando la sua durata non supera i 30 giorni. \\ \hline
    Environment & Per ambiente si intende i dintorni o le condizioni in cui un formaggio stagiona o matura. \\ \hline
    Cave & Per grotta si intende una grande cavità presente nella roccia di una collina o di una montagna utilizzata per stagionare i formaggi. \\ \hline
    Pit & Per fossa si intende una scavatura nel terreno, più o meno profonda, praticata per la stagionatura dei formaggi. \\ \hline
    Refrigerator & Per cella si intende un locale di conservazione del formaggio, ove viene mantenuta una temperatura inferiore a quella ambientale. \\ \hline
 \end{tabularx}
\end{table}

\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|X|X|}
    \hline
    \textbf{Concetto} & \textbf{Definizione}  \\ \hline
    %
    Protected Food & Per alimento certificato si intende un qualunque alimento che possiede una certificazione così come definita dal \textit{Ministero delle Politiche Agricole Alimentari e Forestali}.\\ \hline
    Protected Cheese & Per formaggio certificato si intende qualunque formaggio che possiede una certificazione così come definita dal \textit{Ministero delle Politiche Agricole Alimentari e Forestali}.\\ \hline
    \end{tabularx}
    \label{tab:definitions}
    \caption{Definizioni delle entità principali del modello.}
\end{table}
```

In tabella \ref{tab:metrics} vengono sintetizzate le metriche relative alla "Cheese Ontology".

```{=latex}
\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|X|X|}
    \hline
    Axiom & 459  \\ \hline
    Logical axiom count & 214 \\ \hline
    Declaration axioms count & 149 \\ \hline
    Class count & 74  \\ \hline
    Object property count &  23  \\ \hline
    Data property count & 2  \\ \hline
    Individual count & 49  \\ \hline
    Annotation Property count & 4\\ \hline
 \end{tabularx}
 \caption{Metriche relative all'ontologia.}
 \label{tab:metrics}
\end{table}
```

## Cheese
<!-- Linda -->
Il concetto di formaggio è rappresentato dalla classe `Cheese`, specializzazione di `Food`, entrambe facenti parte dell'ontologia "foodon".
Per `Cheese` sono state individuate le sottoclassi `StretchedCurdCheese` e `CreamCheese`, la prima rappresenta un formaggio a pasta filata; il secondo rappresenta un formaggio cremoso o spalmabile.
Queste due categorie di formaggio non si sovrappongono e non descrivono completamente tutte le tipologie di formaggio esistenti.
Qualsiasi formaggio è descritto dal proprio tipo di pasta, identificato dalla classe `CheeseTexture`, che può corrispondere solamente ai seguenti valori: `SoftTexture`, `SemiSoftTexture`, `MediumHardTexture`, `SemiHardTexture`, `HardTexture`. A seguito della associazione di un formaggio con uno dei precedenti valori, questo viene classificato con una delle seguenti classi: `SoftCheese`, `SemiSoftCheese`, `MediumHardCheese`, `SemiHardCheese` o `HardCheese`.
Questa associazione è stata resa possibile mediante le restrizioni sulle proprietà di OWL come ad esempio:

```
obo:FOODON_00002231 owl:equivalentClass [ 
    owl:intersectionOf ( obo:FOODON_00001013
                        [ rdf:type owl:Restriction ;
                            owl:onProperty :hasTexture ;
                            owl:hasValue :SemiSoftTexture
                        ]
                       ) ;
    rdf:type owl:Class
] ;
```

Queste ultime, assieme a `SoftCheese`, fanno parte di "foodon", eccetto la classe `MediumHardCheese`, che non essendo definita è stato necessario aggiungere nella "Cheese Ontology".

Nella tabella \ref{tab:cheese} vengono riportate le object property relative alla classe `Cheese`.

```{=latex}
\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|X|X|X|X|}
    \hline
    \textbf{ObjectProperty} & \textbf{Domain} & \textbf{Range} &\textbf{Inverse Of}  \\ \hline
    hasTexture & Cheese & CheeseTexture & isTextureOf \\ \hline
 \end{tabularx}
 \caption{\texttt{ObjectProperty} relative al concetto di formaggio.}
 \label{tab:cheese}
\end{table}
```

La _object property_ `hasTexture` permette di definire qual è la tipologia di pasta che compone un formaggio e, infatti, ha come range `Cheese` e come domain `CheeseTexture`.
Questa proprietà è funzionale, perché un formaggio può avere un solo tipo di pasta, asimmetrica e irriflessiva.
Si può infine notare che questa _object property_ ha una corrispondente inversa.

Come si vedrà nell seguenti sezioni, `Cheese` generalizza le classi `CowCheese`, `SheepCheese`, `GoatCheese`, `BuffaloCheese` e `MixedMilkCheese` ognuno dei quali rappresenta un formaggio prodotto dal corrispondente tipo di latte.
È stata fatta un'ulteriore distinzione tra formaggio fresco e formaggio stagionato, rispettivamente grazie alle classi `FreshCheese` e `AgedCheese`.

In figura \ref{fig:cheese} viene riportato il diagramma delle classi riguardante il `Cheese`.

![Diagramma delle classi che rappresenta la classe `Cheese` e le sue relazioni.\label{fig:cheese}](images/cheese.svg){width=100%}

## Raw Material
<!-- Linda -->
Il concetto di `RawMaterial` è stato introdotto per rappresentare le materie prime che sono gli ingredienti che formano un `Cheese`.
Nel nostro caso sono stati individuati alcuni ingredienti fondamentali, i quali provengono dall'ontologia "agrovoc".
Essi sono: il latte, `MilkRawMaterial`, il caglio, `RennetRawMaterial`, il siero, `Whey`, il sale, `SaltRawMaterial`, l'acqua, `WaterRawMaterial` e il formaggio stesso, `CheeseRawMaterial`, in quanto a volte una tipologia di formaggio può essere utilizzata come ingrediente per produrne un altro.
Un altro ingrediente che è stato individuato, che però non era presente in "agrovoc", è `MilkEnzyme`, ovvero la classe dei fermenti lattici.
Questo estende la classe `FoodManifactureEnzyme` dell'ontologia "foodon" e quest'ultimo rappresenta un generico enzima utilizzato nella produzione di alimenti.
Si è scelto inoltre di rappresentare ogni ingrediente come specializzazione del proprio `Food` di riferimento utilizzando le classi messe a disposizione da "foodon" e "uberon".
La classe `Mold` invece, è stata introdotta come ingrediente per i formaggi che presentano muffe, ovvero quelli di tipo `MoldRipenedCheese`.
Quest'ultima si specializza nelle classi: `SoftRipenedCheese`, `SmearRipenedCheese` e `BlueCheese`, le quali rappresentano rispettivamente i formaggi a "crosta fiorita", quelli a "crosta lavata" e infine quelli "muffettati".

È stata considerata la possibilità che siano creati formaggi che appartengono a più di una sottoclasse di `MoldRipenedCheese` oppure a nessuna di esse.
Per quanto riguarda invece le diverse materie prime e i diversi alimenti, è stato definito che le classi che le rappresentano sono disgiunte tra loro e queste coprono tutte le istanze di `Food`.

In tabella \ref{tab:ingredients} sono riportate le _object property_ relative ai `RawMaterial`.

```{=latex}
\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|p{0.27\textwidth}|X|X|p{0.24\textwidth}|}
    \hline
    \textbf{ObjectProperty} & \textbf{Domain} & \textbf{Range} &\textbf{Inverse Of}  \\ \hline
    isMadeWithRawMaterial & Cheese & RawMaterial & isRawMaterialUsedIn \\ \hline
    isMadeWithMold & MoldRipened-Cheese & Mold & isMoldUsedIn \\ \hline
    isMadeWithMilk & Cheese & MilkRawMaterial & isMilkUsedIn \\ \hline
 \end{tabularx}
 \caption{\texttt{ObjectProperty} relative al concetto di ingrediente.}
 \label{tab:ingredients}
\end{table}
```

La _object property_ `isMadeWithRawMaterial` serve a specificare gli ingredienti di un determinato `Cheese` perciò ha come _domain_ quest'ultimo e come _range_ `RawMaterial`. Questa proprietà ha due sottoproprietà: `isMadeWithMilk` e `isMadeWithMold`. Con la prima associamo ad un formaggio il latte con cui è realizzato; con la seconda si specifica il tipo di muffa utilizzata per produrlo. Applicando questa proprietà ad un `Cheese` lo si rende automaticamente un `MoldRipenedCheese` in quanto questa classe è il _domain_ di questa proprietà.
La proprietà `isMadeWithRawMaterial` ha la caratteristica di essere transitiva poiché un formaggio può essere realizzato a partire da un altro, in tal caso le materie prime che sono state utilizzate per produrre quest'ultimo sono materie prime anche del primo formaggio.

In figura \ref{fig:ingredients} viene mostrato il diagramma delle classi relativo agli ingredienti.

![Diagramma delle classi che rappresenta la classe `RawMaterial` e le sue relazioni.\label{fig:ingredients}](images/rawMaterial.svg){width=100%}

\newpage

## Milk
<!-- Nicolas -->
Il latte, rappresentato dalla classe `Milk`, rappresenta un concetto di primaria importanza all'interno dell'ontologia.
Il concetto generico di latte è derivato direttamente da `foodon`, vengono poi definite le varie tipologie di latte
che possono essere impiegate nella produzione di formaggi, in particolare sono state definite le classi `CowMilk`, `SheepMilk`,
`GoatMilk` e`BuffaloMilk`.
La classe `MixedMilk` rappresenta un miscuglio di tipologie latti impiegati nella realizzazione dei formaggi; infatti è tipico
trovare tipologie di formaggi derivati dall'unione di più latti.

Oltre a rappresentare le diverse tipologie di latte, sono state catturate anche le possibili caratteristiche che possono essere
parte di un latte: la classe `RawMilk` identifica un latte crudo, ovvero un tipo di latte che non ha subito un processo di
pastorizzazione prima di essere impiegato della produzione di formaggio; al contrario troviamo invece la classe `PasteurizedMilk`
che rappresenta un tipo di latte che ha subito un processo di pastorizzazione prima di essere impiegato della realizzazione del formaggio.

Sono state definite delle specializzazioni della classe `PasteurizedMilk` che rappresentano i concetti di latte scremato, latte parzialmente scremato
e latte interno. Tali concetti sono rappresentati rispettivamente dalle classi `SkimmedMilk`, `SemiSkimmedMilk` e `WholeMilk`.

Per ogni tipologia di latte esiste una relazione che lo lega con una tipologia di formaggio; ad esempio un latte di mucca è impiegato per
realizzare un formaggio di mucca, o al contrario un formaggio di mucca deve per forza essere realizzato con latte di mucca.
Quindi per ogni tipo di latte esiste il corrispondente tipo di formaggio.

Ciò che lega un tipo di latte con il relativo tipo di formaggio è la _ObjectProperty_ `isMadeWithMilk`.
In tabella \ref{tab:milk} vengono mostrate le ObjectProperty inerenti al concetto di latte.

In figura \ref{fig:milk} viene mostrato il diagramma delle classi relativo al latte.

![Diagramma delle classi che rappresenta le relazioni della classe `Milk`.\label{fig:milk}](images/milk.svg){width=100%}

```{=latex}
\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|X|X|X|}
    \hline
    \textbf{ObjectProperty} & \textbf{Domain} & \textbf{Range}  \\ \hline
    isMadeWithRawMaterial & Cheese & RawMaterial \\ \hline
    isMadeWithMilk & & MilkRawMaterial \\ \hline
 \end{tabularx}
 \caption{\texttt{ObjectProperty} relative al concetto di latte.}
 \label{tab:milk}
\end{table}
```

Come si può osservare dalla tabella la ObjectProperty `isMadeWithRawMaterial` identifica il concetto di "formaggio realizzato con una materia prima" e
quindi la ObjectProperty `isMadeWithMilk` non è altro che una specializzazione della precedente che rappresenta il concetto di
"formaggio realizzato con un latte". Il _domain_ è la classe `Cheese` ciò significa che ovunque questo predicato è applicato il soggetto è un formaggio,
mentre l'oggetto è un `MilkRawMaterial` dovuto al _range._
Nel _range_ della ObjectProperty è specificata la classe `MilkRawMaterial` e non semplicemente `Milk` poiché si vuole catturare il concetto di
"latte utilizzato per la realizzazione di un formaggio" e non solo latte come concetto di cibo generico.
La ObjectProperty `isMadeWithMilk` è l'inversa di `isMilkUsedIn`, in questo modo aiutiamo in reasoner nel generare inferenze indirette.

## Environment
<!-- Linda -->
La classe `Environment` rapprensenta l'ambiente in cui i formaggi possono maturare o stagionare.
Infatti, sono stati identificati gli eventi `Aging` e `Ripening` collegati ad `Environment` tramite la _object property_ `locatedInEnvironment`.
Inoltre, è possibile specificare dove si trova questo ambiente tramite la _object property_ `hasTakenPlaceIn` specificando la `GeographicalFeature`.
Sono stati individuati tre tipi di ambiente per l'invecchiamento del formaggio e tutti e tre fanno parte dell'ontologia `envo`.
Essi sono: la grotta `Cave`, la fossa `Pit` e la cella frigorifera `Refrigerator`.

In tabella \ref{tab:env} sono riportate le object property relative agli `Environment`.

```{=latex}
\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|X|X|X|X|}
    \hline
    \textbf{ObjectProperty} & \textbf{Domain} & \textbf{Range} &\textbf{Inverse Of}  \\ \hline
    locatedInEnvironment & Event & Environment & isEnvironmentLocationOf \\ \hline
    hasTakenPlaceIn & Event & GeographicalFeature & isPlaceWhere \\ \hline
 \end{tabularx}
 \caption{\texttt{ObjectProperty} relative al concetto di ambiente.}
 \label{tab:env}
\end{table}
```

In questo caso, la _object property_ `locatedInEnvironment` ha come domain la classe `Event` e come range `Environmet` mentre
`hasTakenPlaceIn` ha come domain `Event` e range `GeographicalFeature`.

In figura \ref{fig:env} è riportato il diagramma delle classi relativo agli ambienti.

![Diagramma delle classi che rappresenta la classe `Environment` e le sue relazioni.\label{fig:env}](images/environment.svg){width=100%}

\newpage

## Event
<!-- Nicolas -->
<!-- Aggiungere tabella con ObjectProperty e Classes -->
Il concetto di evento, definito dalla classe `Event`, nasce dall'esigenza di modellare il processo di "invecchiamento" del formaggio,
tipicamente rappresentato dal processo di maturazione o di stagionatura.

Infatti, stagionatura e maturazione sono due specializzazioni della classe `Event`, identificate rispettivamente dalle classi `Aging` e `Ripeness`.
Quando si parla di maturazione (ripeness) si intende un processo di invecchiamento del formaggio che va dai 0 ai 30 giorni.
Per quanto riguarda invece la stagionatura, il processo ha una durata maggiore di 30 giorni.

Questi due caratteristiche sono catturate da due `DataProperty`: `hasAgingDuration` definisce il periodo di stagionatura associato ad un formaggio,
tale periodo è espresso in mesi; `hasRipeningDuration` esprime il periodo di maturazione di un formaggio espresso in giorni.
In entrambe le proprietà i due valori sono rappresentati da un intero positivo (`xsd:positiveInteger`).

In figura \ref{fig:event} è mostrato il diagramma delle classi che illustra il concetto di evento.

![Diagramma che mostra il concetto di `Event` e le sue relazione con le altre classi.\label{fig:event}](images/event.svg){width=95%}

\newpage

### Aging
<!-- Aggiungere tabella con ObjectProperty e Classes -->
Per quanto riguarda il concetto di stagionatura sono state definite due ObjectProperty: `hasAging` e `isAgingOf`.
Come è facilmente intuibile l'una è l'inversa dell'altra, per questo motivo ci si limita a descrivere le proprietà della prima.

L'ObjectProperty in questione ha definito come _domain_ la classe `Cheese` e come _range_ la classe `Aging`; ciò sta a significare che
ove tale predicato sia utilizzato il soggetto sarà un formaggio mentre l'oggetto sarà una stagionatura.
Sono quindi state definite altre caratteristiche a questa ObjectProperty, in particolare è stato indicato che è _irriflessiva_, ovvero
che non può essere messa in relazione con sè stessa. È _asimmetrica_ e _funzionale_, quindi ove applicata questa proprietà può avere uno solo valore e
questo risulta particolarmente utile a indicare che un formaggio non può avere più periodi di stagionatura.

### Ripening
<!-- Aggiungere tabella con ObjectProperty e Classes -->
In modo del tutto simile alla stagionatura, la maturazione definisce due ObjectProperty: `hasRipening` e `isRipeneningOf`.
Anche in questo caso una è l'inversa dell'altra.

L'ObjectProperty `hasRipening` ha anch'essa come _domain_ la classe `Cheese` e come _range_ la classe `Ripening`.
Anche in questo caso, come per la stagionatura, è stato indicato che questa proprietà è _funzionale_, _asimmetrica_ e _irriflessiva_.

## Certification
<!-- Nicolas -->
Il meccanismo delle certificazioni rappresenta una caratteristica molto importante all'interno dell'ontologia.
Osservando il diagramma in figura emergono le seguenti classi: `ProtectedName` ovvero il concetto di certificazione di un prodotto,
`ProtectedFood` ovvero un determinato cibo con una specifica certificazione, `ProtectedCheeseName` che rappresenta un formaggio con
una certificazione e infine `ProtectedMilkRawMaterial` che rappresenta un latte certificato utilizzato nella produzione di
un formaggio con una specifica certificazione.

La distinzione tra `ProtectedRicotta` e `ProtectedCheese` deriva dal fatto che la ricotta non è classificata come formaggio, ma allo stesso tempo
può vedersi riconosciuta una certificazione. Per questo motivo, seppur il concetto espresso sia il medesimo, si è deciso di separare in due classi
distinte tale classificazione.

Analizzando la classe `ProtectedCheese` possiamo trovare diverse caratteristiche espresse su di essa sfruttando l'espressività di OWL, in particolare
è stata definita una regola tale per cui un formaggio certificato può essere definito tale se è stato realizzato utilizzando un solo latte che
anch'esso ha una certificazione. Con questo vincolo vogliamo catturare il concetto tale per cui un formaggio certificato deve poter essere realizzato
con un solo latte (quindi non sono ammessi miscugli di tipologie di latte) e questo latte deve avere una certificazione. Un altro vincolo che è
stato definito è che la classe `ProtectedCheese` è disgiunta con la classe `ProtectedRicotta` per il motivo sopra citato.
Infine è stata definita una restrizione tale per cui la proprietà `hasProtectedName` può essere applicata solo alle classe `CheeseProtectedName` di cui
`ProtectedCheese` ne è una sottoclasse.

Nel contesto delle certificazioni sono state definite due ObjectProperty: `hasProtectedName` e `isProtectedNameOf` dove una è l'inversa dell'altra.
Per quanto riguarda la prima è stato definito come _domain_ la classe `ProtectedFood` e come _range_ `ProtectedName` ciò significa che ove questo
predicato è applicato l'oggetto è considerato come un cibo certificato e l'oggetto è la certificazione stessa.

In figura \ref{fig:cert} è mostrata la struttura delle certificazioni.

![Diagramma che mostra l'organizzazione delle certificazioni all'interno dell'ontologia.\label{fig:cert}](images/certification.svg){width=100%}

Sfruttando l'ontologia messa a disposizione dal ministero, si è ricostruita la gerarchia delle certificazioni presenti in Italia.
L'adozione di tale ontologia abilita l'interoperabilità di __cheese ontology__ con eventuali altre ontologie che descrivono e rappresentano altri
prodotti che possono avere certificazioni sfruttando come ponte l'ontologia del ministero.
