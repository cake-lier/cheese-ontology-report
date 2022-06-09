# Regole SWRL

Le regole SWRL consentono di aumentare l'espressività dell'ontologia rispetto a quanto in grado di fare OWL.

Tuttavia, la natura del dominio scelto non necessita di modellare vincoli o relazioni così complesse che il linguaggio OWL non riesca a rappresentare e perciò tali da giustificare l'utilizzo di SWRL.
Ciononostante, sono state definite comunque alcune regole capaci di modellare vincoli fondamentali del dominio in esame così da mostrare la maggiore espressività di SWRL.
Tali regole, infatti, possono essere definite anche mediante OWL, ma sarebbero di più difficile lettura e comprensione.

## Regola 1

La prima regola permette di vincolare il fatto che se un formaggio è realizzato a partire da un latte che può essere usato per formaggi certificati, allora anche il formaggio è certificato.

```{=latex}
\begin{align*}
    \forall c \forall m (&Cheese(c) \land isMadeWithMilk(c, m) \land ProtectedMilkRawMaterial(m)\\
                         &\implies ProtectedCheese(c))
\end{align*}
```

Questa regola non aderisce perfettamente alla realtà dei fatti, ma tale vincolo è stato ritenuto sufficiente per la modellazione del nostro dominio.
La regola nasce principalmente per poter fare in modo che tutti i formaggi ottenuti da latte certificato guadagnino automaticamente lo status di formaggi certificati, senza bisogno di etichettarli manualmente.
Qui di seguito si mostra la regola codificata in SWRL:

```prolog
obo:FOODON_00001013(?c) ^
isMadeWithMilk(?c, ?m) ^
ProtectedMilkRawMaterial(?m) 
-> food-cheese:Formaggio(?c)
```

## Regola 2

Questa regola vincola il fatto che il processo di maturazione di un formaggio è un numero intero positivo espresso in giorni che non può superare il valore di 30.

```{=latex}
\begin{align*}
    \forall r \forall d (&Ripening(r) \land hasRipeningDuration(r, d)\\
                         &\implies d \in \mathbb{N} \land d \ge 1 \land d \le 30)
\end{align*}
```

Infatti, il processo di maturazione è definito come tale solo se il suo numero di giorni non supera il valore di 30.
In quest'ultimo caso, si parlerebbe di "stagionatura" del formaggio e non di "maturazione".
Qui di seguito si mostra la regola codificata in SWRL:

```prolog
hasRipeningDuration(?r, ?d) ^ 
Ripening(?r) ->
swrlb:greaterThanOrEqual(?d, 1) ^
swrlb:lessThanOrEqual(?d, 30)
```

## Regola 3

Questa regola vincola il fatto che il processo di stagionatura di un formaggio è un numero intero positivo espresso in mesi.

```{=latex}
\begin{align*}
    \forall a \forall d (&Aging(a) \land hasAgingDuration(a, d)\\
                         &\implies d \in \mathbb{N} \land d \ge 1)
\end{align*}
```

Infatti, il processo di stagionatura è definito tale solo se il suo numero di giorni è strettamente superiore ai 30.
In caso contrario, come detto in precedenza, si parlerebbe di "maturazione" del formaggio e non di "stagionatura".
Qui di seguito si mostra la regola codificata in SWRL:

```prolog
Aging(?a) ^ hasAgingDuration(?a, ?d) -> swrlb:greaterThanOrEqual(?d, 1)
```
