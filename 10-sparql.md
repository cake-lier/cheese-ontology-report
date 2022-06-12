# Query SPARQL

La realizzazione delle query SPARQL si è basata su scenari d'uso reali in cui l'ontologia ricopre un ruolo fondamentale per l'accesso alla conoscenza e il recupero di informazioni inerenti al dominio in oggetto che siano utili e pertinenti.
Per questo motivo, ogni _query_ sarà preceduta da una breve descrizione del contesto per cui si è immaginato il suo utilizzo, benché questo non rappresenti in maniera esaustiva tutti gli scenari in cui sia utile l'impiego di quella _query_.

## Query 1

Un consumatore vuole informarsi su tutti quei formaggi che hanno come caratteristica un periodo di maturazione del prodotto compreso tra i 5 e i 20 giorni.
Inoltre, il consumatore è interessato a scoprire, per ognuno di quei formaggi, la durata esatta del periodo di maturazione.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?label ?duration 
WHERE {
    ?cheese :hasRipening/:hasRipeningDuration ?duration.

    OPTIONAL { ?cheese rdfs:label ?label }
    FILTER (?duration > 5 && ?duration < 20)
}
ORDER BY ?label
```

\newpage

## Query 2

Nell'ambito di un corso di formazione di assaggiatori di formaggi, si vuole mostrare quali siano tutti quei formaggi che sono considerati di qualità.
In particolare, per formaggio di qualità, si intende un formaggio che possiede una certificazione, qualunque essa sia, purché definita tale dall'Unione Europea o dal Ministero delle Politiche Agricole e rilasciata da quest'ultimo.
L'assaggiatore potrà quindi sapere quali formaggi sono disponibili, assieme alla certificazione che possiedono.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX food-upper: <http://w3id.org/food/ontology/disciplinare-upper/>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?label ?protectedname ?namelabel
WHERE {
    ?cheese a/rdfs:label "ProtectedCheese"@en;
            food-upper:haDenominazione ?protectedname.

    OPTIONAL { ?cheese rdfs:label ?label }
    OPTIONAL { ?protectedname rdfs:label ?namelabel }
}
ORDER BY ?label
```

## Query 3

Un consumatore è particolarmente appassionato del sapore pungente che la fossa dona ai formaggi che vengono affinati in essa.
Vuole quindi scoprire in quale fossa sono stati affinati i formaggi che appartengono a questa categoria, per comprendere le differenze in termini di gusto che le diverse fosse sono in grado di garantire.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?cheeselabel ?pit ?pitlabel
WHERE {
    ?cheese (:hasRipening|:hasAging)/:isLocatedInEnvironment ?pit.
    ?pit a/rdfs:label "Pit"@en.

    OPTIONAL { ?pit rdfs:label ?pitlabel }
    OPTIONAL { ?cheese rdfs:label ?cheeselabel }
}
ORDER BY ?cheeselabel
```

## Query 4

Un consumatore curioso è intenzionato a scoprire se esistono differenze tra i formaggi prodotti da latte crudo rispetto a quelli da latte pastorizzato.
Per di più, vuole sapere se anche il tipo di latte introduce delle differenze a livello gustativo.
Con questo obiettivo in mente, interroga il _knowledge graph_ chiedendo quali siano i formaggi prodotti da latte crudo assieme al latte da cui sono stati prodotti.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?cheeselabel ?milk ?milklabel
WHERE {
    ?milk :isMilkUsedIn ?cheese;
          a :RawMilk.

    OPTIONAL { ?milk rdfs:label ?milklabel }
    OPTIONAL { ?cheese rdfs:label ?cheeselabel }
}
ORDER BY ?cheeselabel
```

## Query 5

Le "Saline di Cervia" vogliono iniziare una nuova campagna di valorizzazione del loro prodotto.
A tal proposito, l'associazione pensa che il modo migliore sia farlo promuovendo i formaggi realizzati utilizzando il sale di Cervia.
Essi decidono perciò di informarsi su tutti quei formaggi per i quali quel sale è stato utilizzato durante la loro produzione.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?label
WHERE {
    ?cheese :isMadeWithRawMaterial/rdfs:label "Sale di Cervia"@it
    
    OPTIONAL { ?cheese rdfs:label ?label }
}
ORDER BY ?label
```

\newpage

## Query 6

Una fattoria educativa decide di attivare un centro estivo durante il quale si vuole fare un'attività che coinvolga i bambini con lo scopo di insegnare loro alcune caratteristiche dei formaggi.
In particolar modo, vuole insegnare quali sono i diversi animali che possono produrre latte, il quale viene poi utilizzato nella produzione di formaggi.
Per questo motivo, il personale della fattoria si documenta su quali tipi di latte sono stati registrati, dividendoli per tipo di animale che li ha prodotti, assieme ai formaggi prodotti da quei tipi di latte.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?cheeselabel ?milk ?milklabel ?animal
WHERE {
    ?cheese :isMadeWithMilk ?milk
    { 
        ?milk a/rdfs:label "CowMilk"@en
        VALUES ?animal { "Formaggio di mucca" }
    }
    UNION
    { 
        ?milk a/rdfs:label "SheepMilk"@en
        VALUES ?animal { "Formaggio di pecora" }
    }
    UNION
    { 
        ?milk a/rdfs:label "GoatMilk"@en
        VALUES ?animal { "Formaggio di capra" }
    }
    UNION
    { 
        ?milk a/rdfs:label "BuffaloMilk"@en
        VALUES ?animal { "Formaggio di bufala" }
    }

    OPTIONAL { ?milk rdfs:label ?milklabel }
    OPTIONAL { ?cheese rdfs:label ?cheeselabel }
}
ORDER BY ?animal
```

## Query 7

Un consumatore attento alla propria salute ha notato che da qualche tempo fa fatica a digerire i formaggi che mangia.
Dopo essersi rivolto al suo nutrizionista, gli è stato consigliato di mangiare solamente formaggi ad alta digeribilità.
Il nutrizionista ha indicato come tali quei formaggi che sono prodotti o da caglio vegetale o da latte scremato.
Il consumatore decide perciò di ricercare quali formaggi soddisfino tali proprietà.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT DISTINCT ?cheese ?label
WHERE {
    { ?cheese :isMadeWithRawMaterial/a :VegetalRennet }
    UNION
    { ?cheese :isMadeWithMilk/a/rdfs:label "SkimmedMilk"@en }
    
    OPTIONAL { ?cheese rdfs:label ?label }
}
ORDER BY ?label
```

\newpage

## Query 8

Un consumatore precedentemente scettico ha scoperto da poco la sua passione per i formaggi erborinati e vuole assaggiarne di nuovi i quali possano essere spalmati oppure affettati.
Per questo motivo, decide di ricercare tutti i formaggi che sono stati prodotti con l'aiuto di muffe, sia che la muffa si trovi all'interno del formaggio, sia che si trovi sulla crosta, e che possano essere consumati così come piace a lui, distinguendoli tra le diverse categorie.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?label ?type
WHERE {
    { ?cheese a/rdfs:label "SoftCheese"@en }
    UNION
    { ?cheese a/rdfs:label "SemiSoftCheese"@en }
    {
        ?cheese a/rdfs:label "BlueCheese"@en
        VALUES ?type { "Formaggio erborinato" }
    }
    UNION
    {
        ?cheese a/rdfs:label "SmearRipenedCheese"@en
        VALUES ?type { "Formaggio a crosta lavata" }
    }
    UNION
    {
        ?cheese a/rdfs:label "SoftRipenedCheese"@en
        VALUES ?type { "Formaggio a crosta fiorita" }
    }
    
    OPTIONAL { ?cheese rdfs:label ?label }
}
ORDER BY ?type
```

\newpage

## Query 9

Un consumatore molto interessato al processo produttivo dei vari formaggi che conosce vuole sapere se esistono formaggi che vengono prodotti a partire da altri formaggi.
Per questo motivo, interroga la _knowledge base_ a questo scopo.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT DISTINCT ?cheese ?label
WHERE {
    ?cheese :isMadeWithRawMaterial+/a/rdfs:label "Cheese"@en
    
    OPTIONAL { ?cheese rdfs:label ?label }
}
ORDER BY ?label
```

## Query 10

Il Comune di Bertinoro ha indetto un evento di promozione del territorio a tema formaggio, in collaborazione con i caseifici locali.
Questi decidono quindi di mettere a disposizione le informazioni sui formaggi che sono prodotti all'interno del Comune.
Sapendo questo, un partecipante all'evento decide di voler sapere quali sono i formaggi che sono prodotti dal caseificio "Mambelli".

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?label
WHERE {
    ?cheese a/rdfs:label "Cheese"@en
  
    FILTER(REGEX(STR(?cheese), "Mambelli"))
  
    OPTIONAL {
        ?cheese rdfs:label ?label

        FILTER(REGEX(?label, "Mambelli"))
    }
}
ORDER BY ?label
```

## Query 11

Per motivazioni statistiche, il Ministero delle Politiche Agricole sta raccogliendo informazioni sulla produzione casearia sul territorio italiano.
In particolare, il Ministero è interessato a sapere la distribuzione della produzione delle diverse tipologie di formaggio nelle varie città italiane.
Per questo motivo, raccoglie il numero di formaggi prodotti per ogni città, accompagnato dalla regione in cui queste si trovano per motivi di disambiguazione.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT DISTINCT ?city ?region (COUNT(?city) AS ?count)
WHERE {
    [] :isProducedIn ?city
  
    SERVICE <https://dbpedia.org/sparql> {
        ?region dbo:type dbr:Regions_of_Italy;
                ^dbo:region ?city.
    }
}
GROUP BY ?city ?region
ORDER BY DESC(COUNT(?city))
```

\newpage

## Query 12

"Slow Food" è interessata a creare la nuova mappa dei formaggi certificati italiani, per promuovere la conoscenza sulle eccellenze italiane.
Deve perciò raccogliere le informazioni in merito ai formaggi certificati che vengono attualmente prodotti in Italia, dividendoli per ciascuna regione, assieme alle certificazioni che possiedono.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX food-upper: <http://w3id.org/food/ontology/disciplinare-upper/>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?region ?cheese ?cheeselabel ?name ?namelabel
WHERE {
    ?cheese :isProducedIn ?city;
            a/rdfs:label "ProtectedCheese"@en;
            food-upper:haDenominazione ?name.

    SERVICE <https://dbpedia.org/sparql> {
        ?region dbo:type dbr:Regions_of_Italy;
                ^dbo:region ?city.
    }
  
    OPTIONAL { ?cheese rdfs:label ?cheeselabel }
    OPTIONAL { ?name rdfs:label ?namelabel }
}
ORDER BY ?cheeselabel
```

\newpage

## Query 13

La Provincia di Forlì-Cesena è a conoscenza della presenza di numerose fosse sul suo territorio dedite alla stagionatura del formaggio, che sono impiegate nella produzione di formaggi certificati.
Per questo motivo, vuole scoprire quali fosse in quali città si occupano della produzione di certi formaggi, con il fine di valorizzarle a fini turistici.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?cheeselabel ?city ?citylabel ?pit ?pitlabel
WHERE {
    [] :isAgingOf ?cheese;
       :hasTakenPlaceIn ?city;
       :isLocatedInEnvironment ?pit.
    ?pit a/rdfs:label "Pit"@en.
  
    SERVICE <https://dbpedia.org/sparql> {
        ?city dbo:province dbr:Province_of_Forlì-Cesena
    
        OPTIONAL {
            ?city rdfs:label ?citylabel
        
            FILTER(LANG(?citylabel) = "it")
        }
    }
  
    OPTIONAL { ?cheese rdfs:label ?cheeselabel }
    OPTIONAL { ?pit rdfs:label ?pitlabel }
}
ORDER BY ?citylabel
```

\newpage

## Query 14

Un consumatore vegetariano inesperto si chiede se esistano formaggi che è in grado di poter mangiare.
Questo significa che nell'intero processo produttivo non devono essere impiegati prodotti derivati da carne animale, cioè il caglio.
Vuole perciò sapere se esistono formaggi che sono realizzati con caglio vegetale oppure semplicemente senza caglio.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

ASK
WHERE {
    ?cheese a/rdfs:label "Cheese"@en

    FILTER NOT EXISTS { ?cheese :isMadeWithRawMaterial/a :AnimalRennet }
}
```
