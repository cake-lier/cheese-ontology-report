# Regole SWRL

Le regole SWRL consentono di aumentare l'espressività dell'ontologia rispetto a quanto in grado di fare OWL.

Tuttavia, la natura del dominio scelto non necessita di modellare vincoli o relazioni così complesse che il linguaggio OWL non riesca a rappresentare e perciò tali da giustificare l'utilizzo di SWRL.
Ciononostante, sono state definite comunque alcune regole capaci di modellare vincoli fondamentali del dominio in esame così da mostrare la maggiore espressività di SWRL.
Tali regole, infatti, possono essere definite anche mediante OWL, ma sarebbero di più difficile lettura e comprensione.

## Regola 1

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

## Regola 2

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

## Regole 3 e 4

Le ultime due regole permettono automaticamente di classificare un formaggio come formaggio certificato se è associato ad una certificazione per i formaggi, oppure come ricotta certificata se è associato ad una certificazione per le ricotte.

```{=latex}
\begin{align*}
    \forall c \forall n (&Cheese(c) \land hasProtectedName(c, n) \land CheeseProtectedName(n) \\
                         &\implies ProtectedCheese(c))
\end{align*}

\begin{align*}
    \forall c \forall n (&Cheese(c) \land hasProtectedName(c, n) \land RicottaProtectedName(n) \\
                         &\implies ProtectedRicotta(c))
\end{align*}
```

Si assume che, qualora sia stata assegnata una certificazione di tipo specifico ad un alimento, se non sono stati fatti errori, quest'ultimo appartenga alla categoria a cui quella certificazione fa riferimento.

```prolog
obo:FOODON_00001013(?c) ^ 
food-upper:haDenominazione(?c, ?n) ^
food-cheese:DenominazioneFormaggio(?n) 
-> food-cheese:Formaggio(?c)

obo:FOODON_00001013(?c) ^ 
food-upper:haDenominazione(?c, ?n) ^
food-ricotta:DenominazioneRicotta(?n) 
-> food-ricotta:Ricotta(?c)
```

