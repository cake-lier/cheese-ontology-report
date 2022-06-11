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
La classe `Milk` modella il concetto generico di latte che può essere impiegato nella produzione di formaggi, il quale è derivato direttamente da "uberon".
A partire da questo vengono poi definite le sue specializzazioni `CowMilk`, `SheepMilk`, `GoatMilk` e `BuffaloMilk`.
Ognuna di queste rappresenta un latte prodotto da una tipologia di animale, rispettivamente da mucche, da pecore, da capre e da bufale.
La classe `MixedMilk` rappresenta invece un latte nato da un miscuglio di tipologie di latti prodotti da animali differenti; è possibile infatti trovare tipologie di formaggi derivati dall'unione di più latti diversi.

A ciascuno dei tipi di latte indicati in precedenza, corrisponde un tipo di formaggio: un formaggio fatto da `CowMilk` è definito `CowCheese`, uno fatto da `SheepMilk` è definito `SheepCheese`, uno fatto da `GoatMilk` è un `GoatCheese` e un formaggio fatto da `BuffaloMilk` è un `BuffaloCheese`.
Per ragioni di completezza è stato definito anche che un formaggio fatto da `MixedMilk` è un `MixedMilkCheese`.
Dato che è logico che un latte non possa essere stato prodotto da più animali contemporaneamente, in quanto questo caso è esplicitamente catturato dalla classe `MixedMilk`, le classi `CowMilk`, `SheepMilk`, `GoatMilk`, `BuffaloMilk` e `MixedMIlk` sono disgiunte tra loro e coprono tutte le istanze di `Milk`. Analogamente, le classi `CowCheese`, `SheepCheese`, `GoatCheese`, `BuffaloCheese` e `MixedMilkCheese` sono disgiunte tra loro e coprono tutte le istanze di `Cheese`.
Per fare in modo che il reasoner potesse assegnare queste tipologie ad un formaggio sono state definite delle restrizioni in OWL, come ad esempio:

```
obo:FOODON_00001126 owl:equivalentClass 
        [ owl:intersectionOf ( obo:FOODON_00001013
                        [ rdf:type owl:Restriction ;
                            owl:onProperty :isMadeWithMilk ;
                            owl:allValuesFrom obo:FOODON_00001771
                        ]
                        ) ;
          rdf:type owl:Class
        ] ;
```

Oltre a rappresentare le diverse tipologie di latte, sono state modellate anche le possibili caratteristiche che un latte può avere.
Un latte può essere crudo o pastorizzato e può avere subito un processo di scrematura o meno prima di essere impiegato nel processo di produzione del formaggio.
La classe `RawMilk` identifica un latte crudo, mentre invece la classe `PasteurizedMilk` rappresenta un tipo di latte che ha subito un processo di pastorizzazione.
Siccome queste due proprietà sono mutualmente esclusive, queste due classi sono disgiunte tra loro e coprono tutte le istanze di `Milk`.
Per i concetti di latte scremato, latte parzialmente scremato e latte intero, sono state definite rispettivamente dalle classi: `SkimmedMilk`, `SemiSkimmedMilk` e `WholeMilk`.
Per poter associare a un latte la sua scrematura, è stata definita la classe `MilkSkimming` che può assumere solamente i valori `TotalSkimming`, `PartialSkimming` e `NoSkimming`, che corrispondono alle classi così come sono state elencate in precedenza. Per fare in modo che il reasoner deduca automaticamente il tipo di latte a partire dal processo di scrematura che ha subito, sono state definite delle restrizioni in OWL del tipo:

```
obo:FOODON_03301484 rdfs:subClassOf obo:UBERON_0001913 ,
                                    [ rdf:type owl:Restriction ;
                                      owl:onProperty :hasSkimming ;
                                      owl:hasValue :TotalSkimming
                                    ] ;
```

A seguire, per poter classificare un formaggio sulla base del tipo di latte che è stato impiegato per realizzarlo, sono state definite delle restrizioni in OWL del tipo:

```
:SkimmedMilkCheese owl:equivalentClass
        [ owl:intersectionOf ( obo:FOODON_00001013
                                [ rdf:type owl:Restriction ;
                                  owl:onProperty :isMadeWithMilk ;
                                  owl:allValuesFrom obo:FOODON_03301484
                                ]
                             ) ;
          rdf:type owl:Class
        ] .
```

Ciò che lega un tipo di latte con il relativo tipo di formaggio è la _object property_ `isMadeWithMilk`. Mentre invece, ciò che lega un latte con la scrematura che ha subito, è la _object property_ `hasSkimming`. La proprietà `isMadeWithMilk`
In tabella \ref{tab:milk} vengono mostrate queste proprietà e le loro caratteristiche.

In figura \ref{fig:milk} viene mostrato il diagramma delle classi relativo al latte.

![Diagramma delle classi che rappresenta le relazioni della classe `Milk`.\label{fig:milk}](images/milk.svg){width=100%}

```{=latex}
\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|X|X|X|X|}
    \hline
    \textbf{ObjectProperty} & \textbf{Domain} & \textbf{Range} & \textbf{Inverse of}  \\ \hline
    isMadeWithRawMaterial & Cheese & RawMaterial & isRawMaterialUsedIn \\ \hline 
    isMadeWithMilk &  & MilkRawMaterial & isMilkUsedIn \\ \hline
    hasSkimming & Milk & MilkSkimming & isSkimmingOf \\ \hline
 \end{tabularx}
 \caption{\textit{object property} relative al concetto di latte.}
 \label{tab:milk}
\end{table}
```

Visto che la _object property_ `isMadeWithRawMaterial` associa un formaggio ad una materia prima utilizzata nella sua produzione, la _object property_ `isMadeWithMilk` non è altro che una specializzazione della precedente dove la materia prima è in questo caso un `Milk`.
Il _domain_ di quest'ultima proprietà è perciò la classe `Cheese`, ereditata dalla proprietà genitore, mentre il _range_ è la classe `MilkRawMaterial`, e non semplicemente `Milk`, poiché si vuole catturare l'idea per la quale quello associato dalla proprietà è un latte usato come materia prima e non solo un generico latte.
Invece per la proprietà `hasSkimming` il _domain_ è `Milk` mentre il _range_ è `MilkSkimming`. Questa proprietà è funzionale perché un latte può subire un solo processo di scrematura, ma anche irriflessiva e asimmetrica.

## Environment e Event

Il concetto di evento, definito dalla classe `Event`, nasce dall'esigenza di modellare il processo di "invecchiamento" del formaggio, che può essere distinto in maturazione e stagionatura.
Questi due concetti sono modellati rispettivamente dalle classi `Aging` e `Ripening` ed entrambe sono infatti specializzazioni della classe `Event`.
Quando si parla di maturazione si intende un processo di invecchiamento del formaggio che va da uno a trenta giorni, mentre invece la stagionatura ha una durata maggiore di trenta giorni.
Per rappresentare il vincolo sulla durata della maturazione, è stato definito il seguente vincono in OWL:

```
:Ripening rdfs:subClassOf 
          [ rdf:type owl:Restriction ;
          owl:onProperty :hasRipeningDuration ;
          owl:allValuesFrom 
              [ rdf:type rdfs:Datatype ;
              owl:onDatatype xsd:positiveInteger ;
              owl:withRestrictions (
                 [ xsd:maxInclusive "30"^^xsd:positiveInteger ]
                                   )
              ]
          ] ;
```

Sulla classe `Aging` non è stato necessario introdurre alcun vincolo di durata poiché il valore che la esprime è inteso in mesi.

Un formaggio che ha subito il processo di stagionatura è definito stagionato ed è rappresentato dalla classe `AgedCheese`.
Un formaggio che non ha subito stagionatura, invece, è definito formaggio fresco ed è rappresentato dalla classe `FreshCheese`.
Questa condizione è però necessaria ma non sufficiente poiché per essere definito tale deve essere anche vero che non ha subito un processo di maturazione.
Queste due classi sono perciò disgiunte ma non riescono a coprire tutte le istanze di `Cheese`.

La classe `Environment` rappresenta l' ambiente in cui i formaggi maturano o stagionano.
Sono stati individuati tre tipi di ambiente per l'invecchiamento del formaggio ognuno dei quali è tratto dall'ontologia "envo".
Questi ambienti sono: la grotta, `Cave`, la fossa, `Pit`, e la cella frigorifera, `Refrigerator`.

La produzione di formaggio avviene presso un luogo, inteso come area geografica, così come accade per la maturazione e la stagionatura.
Per questo motivo abbiamo introdotto il concetto di `PopulatedPlace` così come definito dall'ontologia "DBPedia".

In tabella \ref{tab:env} sono riportate le _object property_ relative agli `Environment` e agli `Event`.

```{=latex}
\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|X|p{0.15\textwidth}|p{0.17\textwidth}|X|}
    \hline
    \textbf{ObjectProperty} & \textbf{Domain} & \textbf{Range} &\textbf{Inverse Of}  \\ \hline
    isLocatedInEnvironment & Event & Environment & isEnvironmentLocationOf \\ \hline
    isLocatedIn & & PopulatedPlace & isLocationOf \\ \hline
    hasTakenPlaceIn & Event &  & isPlaceWhere \\ \hline
    isProducedIn & Food & & isProductionPlaceOf \\ \hline
 \end{tabularx}
 \caption{\textit{ObjectProperty} relative al concetto di ambiente.}
 \label{tab:env}
\end{table}
```

È stata definita la proprietà `isLocatedIn` che associa una `owl:Thing` al `PopulatedPlace` a cui è associata, da questa sono state poi definite due sottoproprietà: `hasTakenPlaceIn` e `producedIn`.
La prima ha come _domain_ `Event` ed eredita come _range_ `PopulatedPlace` e ha come compito quello di legare un `Event` a luogo in cui si è svolto.
La seconda ha come _domain_ `Food` ed eredita come _range_ `PopulatedPlace` e ha invece come scopo quello di associare un `Food` al luogo in cui è stato prodotto.
Per associare un `Event` all'`Environment` in cui ha avuto luogo, è stata definita la proprietà `isLocatedInEnvironment` che ha rispettivamente le due classi indicate come _domain_ e _range._
Sia `isLocatedIn` che `isLocatedInEnvironment` sono proprietà funzionali perché non è possibile associare più `PopulatedPlace` o `Environment` allo stesso soggetto e sono anche entrambe asimmetriche e irriflessive.

In tabella \ref{tab:evdp} sono riportate le _data property_ relative agli `Event`.

```{=latex}
\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|X|X|X|}
    \hline
    \textbf{DataProperty} & \textbf{Domain} & \textbf{Range} \\ \hline
    hasAgingDuration & Aging & xsd:positiveInteger \\ \hline
    hasRipeningDuration & Ripening & xsd:positiveInteger \\ \hline
 \end{tabularx}
 \caption{\textit{ObjectProperty} relative al concetto di ambiente.}
 \label{tab:evdp}
\end{table}
```

Per rappresentare la durata degli eventi di `Aging` e `Ripening`, sono state definite rispettivamente le _data property_ `hasAgingDuration` e `hasRipeningDuration` che rispettivamente hanno le classi `Aging` e `Ripening` come _domain_.
La proprietà `hasAgingDuration` esprime una durata in mesi e dal momento che non ha senso esprimere mesi con numeri non positivi, è stato utilizzato come _range_ il _data type_ `xsd:positiveInteger`.  
La proprietà `hasRipeningDuration` esprime una durata in giorni e dal momento che non ha senso esprimere giorni con numeri non positivi, è stato utilizzato come _range_ il _data type_ `xsd:positiveInteger`.

![Diagramma delle classi che rappresenta le classi `Environment` e `Event` e le loro relazioni.\label{fig:env}](images/EventEnvironment.svg){width=100%}

\newpage

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
