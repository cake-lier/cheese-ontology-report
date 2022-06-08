# Regole SWRL

Le regole SWRL consentono di aumentare l'espressività dell'ontologia rispetto a quello che è in grado di fornire OWL.

Tuttavia, la natura del dominio scelto non cattura vincoli o relazioni complesse a tal punto che il linguaggio OWL non riesca a rappresentare;
ciononostante abbiamo definito alcune regole SWRL che modellano alcuni vincoli fondamentali del dominio in esame.

Tali regole, come indicato in precedenza, possono essere definite anche mediante OWL, ma per motivi di praticità e leggibilità di tali vincoli
è stato deciso di scriverele sfruttando SWRL.

## Regola 1

Con la prima regola si vuole vincolare il fatto che se un formaggio è realizzato da un latte certificato, allora anche il formaggio è certificato.
Ovviamente questa regola non aderisce perfettamente alla realtà dei fatti, ma a fini didattici tale vincolo può essere accettato.

La regola nasce principalmente per impedire che vengano creati _individuals_ dove viene contrassegnato come certificato un formaggio
che è realizzato da un latte non certificato. Inoltre, tale regola viene sfruttata dal reasoner che riesce a inferire automaticamente quali formaggi
sono certificati e quali no.

```prolog
obo:FOODON_00001013(?cheese) ^
isMadeWithMilk(?cheese, ?milk) ^
ProtectedMilkRawMaterial(?milk) -> food-cheese:Formaggio(?cheese)
```

La regola definisce che per ogni formaggio generico (`Cheese`) realizzato da un certo tipo di latte e questo latte è certificato, allora quel formaggio
è un formaggio certificato.

## Regola 2

Con questa regola si vuole vincolare il fatto che il processo di maturazione di un formaggio non superi i 30 giorni.
Infatti, per come è definito il processo di maturazione non ha senso specificare che un formaggio ha una maturazione di 60 giorni poiché in tal caso
si parlerebbe di stagionatura.

```prolog
hasRipeningDuration(?r, ?d) ^ Ripening(?r) ->
swrlb:greaterThanOrEqual(?d, 1) ^
swrlb:lessThanOrEqual(?d, 30)
```

La regola definisce che ovunque sia specificata la _data property_ `hasRipeningDuration` il valore associato deve essere compreso tra 1 e 30, che in
questo caso rappresentano i giorni.

## Regola 3

Con questa regola si vincola il fatto che la fase di stagionatura di un formaggio deve essere di almeno un mese.
Infatti, per come è definita la stagionatura, questa deve avere un periodo minimo di 30 giorni.
Nell'ontologia il valore espresso dalla stagionatura è espresso in mesi, ciò significa che il periodo deve essere di almeno 1 mese.

```prolog
Aging(?a) ^ hasAgingDuration(?a, ?d) -> swrlb:greaterThanOrEqual(?d, 1)
```

La regola specifica che ovunque sia applicata la _data property_ `hasAgingDuration`, il valore associato deve essere maggiore di 1, che in questo
case rappresenta i mesi di stagionatura.
