# Query SPARQL

Per la realizzazione delle query SPARQL sono stati immaginati scenari reali in cui l'ontologia possa rappresentare un vero e proprio vantaggio
nel recuperare informazioni utili e pertinenti.

## Query #1

Lo scenario immaginato in questo caso è un consumatore che è alla ricerca di formaggi che hanno come caratteristica un periodo di
maturazione del prodotto compreso tra i 5 e i 20 giorni. A tal proposito si è definita la seguente query per soddisfare tale ricerca:

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

## Query #2

Lo scenario immaginato è un consumatore particolarmente attento a identificare formaggi di qualità che possiedono una certificazione,
in questo caso non è interessato ad una specifica certificazione ma è interessato a trovare tutti i formaggi che ne hanno una. A tal
proposito si è definita la seguente query:

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?label ?protectedname
WHERE {
    ?cheese a/rdfs:label "ProtectedCheese"@en.
 
    OPTIONAL { ?cheese :hasProtectedName ?protectedname }
    OPTIONAL { ?cheese rdfs:label ?label }
}
ORDER BY ?label
```

## Query #3

In questo scenario si è immaginato un consumatore appassionato di formaggi affinati in fossa ed è quindi interessato a trovare tutti
i formaggi stagionati in quell'ambiente. A tal proposito si è definita la seguente query:

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?cheeselabel ?pit ?pitlabel
WHERE {
    ?cheese (:hasRipening|:hasAging)/:locatedInEnvironment ?pit.
    ?pit a/rdfs:label "Pit"@en.
  
    OPTIONAL { ?pit rdfs:label ?pitlabel }
    OPTIONAL { ?cheese rdfs:label ?cheeselabel }
}
ORDER BY ?cheeselabel
```

## Query #4

In questo scenario si vuole soddisfare un consumatore interessato a tutti i formaggi da latte crudo. A tal proposito è stata formulata
la seguente query:

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?cheeselabel ?milk ?milklabel
WHERE {
    ?cheese :isMadeWithMilk ?milk.
    ?milk a :RawMilk.

    OPTIONAL { ?milk rdfs:label ?milklabel }
    OPTIONAL { ?cheese rdfs:label ?cheeselabel }
}
ORDER BY ?cheeselabel
```

## Query #5

In questo scenario si vuole valorizzare il Sale di Cervia, proponendo tutti i formaggi che sono realizzati con quel tipo di sale.
A tal proposito è stata definita la seguente query:

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?label
WHERE {
    ?cheese :isMadeWithRawMaterial :SaleDiCervia.
    
    OPTIONAL { ?cheese rdfs:label ?label }
}
ORDER BY ?label
```

## Query #6

In questo scenario ci si immagina un consumatore che è interessato a scoprire quali formaggi sono realizzati da latte animale, poiché li reputa di maggiore
qualità rispetto ad alcuni formaggi realizzati da latte in polvere. La seguente query è stata definita:

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?cheeselabel ?milk ?milklabel ?animal
WHERE {
    ?cheese :isMadeWithMilk ?milk.
    { 
     ?milk a/rdfs:label "CowMilk"@en.
     VALUES ?animal { "Formaggio di mucca" }
    }
    UNION
    { 
     ?milk a/rdfs:label "SheepMilk"@en.
     VALUES ?animal { "Formaggio di pecora" }
    }
    UNION
    { 
     ?milk a/rdfs:label "GoatMilk"@en.
     VALUES ?animal { "Formaggio di capra" }
    }
    UNION
    { 
     ?milk a/rdfs:label "BuffaloMilk"@en.
     VALUES ?animal { "Formaggio di bufala" }
    }

    OPTIONAL { ?milk rdfs:label ?milklabel }
    OPTIONAL { ?cheese rdfs:label ?cheeselabel }
}
ORDER BY ?cheeselabel
```

## Query #7

In questo scenario si volgiono identificare tutti i formaggi molli.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?label
WHERE {
   ?cheese a/rdfs:label "CreamCheese"@en.
   ?cheese a :FreshCheese.
    
    OPTIONAL { ?cheese rdfs:label ?label }
}
ORDER BY ?label
```

## Query #8

In questo scenario ci si immagina un consumatore con difficoltà ad assimilare prodotti realizzati con latte, quindi è interessato
a formaggi realizzati con latte parzialmente scremato.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?label
WHERE {
   ?cheese :isMadeWithRawMaterial/a :VegetalRennet.
   ?cheese :isMadeWithMilk/a/rdfs:label "SkimmedMilk"@en.
    
    OPTIONAL { ?cheese rdfs:label ?label }
}
ORDER BY ?label
```

## Query #9

In questo scenario si è interessati a scoprire tutti i formaggi realizzati a partire da altri formaggi, ovvero che hanno un formaggio come ingrediente.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT ?cheese ?label ?type
WHERE {
   { ?cheese a/rdfs:label "SoftCheese"@en. }
   UNION
    { ?cheese a/rdfs:label "SemiSoftCheese"@en. }
    {
     ?cheese a/rdfs:label "BlueCheese"@en.
     VALUES ?type { "Formaggio erborinato" }
   }
   UNION
   {
     ?cheese a :SmearRipenedCheese
     VALUES ?type { "Formaggio a crosta lavata" }
   }
   UNION
   {
     ?cheese a/rdfs:label "SoftRipenedCheese"@en.
     VALUES ?type { "Formaggio a crosta fiorita" }
   }
    
    OPTIONAL { ?cheese rdfs:label ?label }
}
ORDER BY ?label
```

## Query #10

In questo scenario si vogliono identificare tutti i formaggi prodotti da un determinato caseificio, in particolare il caseficio Mambelli.

```sql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://github.com/nicolasfara/cheese-ontology/>

SELECT DISTINCT ?cheese ?label
WHERE {
   ?cheese rdfs:label ?label.
   
   FILTER(regex(?label, "Mambelli"))
}
ORDER BY ?label
```
