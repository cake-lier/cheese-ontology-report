# Cheese Ontology

## Allineamenti con altre ontologie

L'ontologia è stata realizzata partendo da altre ontologie rappresentate in tabella.
Le più rilevanti sono `geonames` per utilizzare nomi di luoghi geografici; `foodon` e `agrovoc` per quanto riguarda il cibo.
L'ontologia `envo` è stata utilizzata per gli ambienti in cui sono realizzati i formaggi.
Infine, è stata utilizzata l'ontologia realizzata dal ministero Italiano per la definizione delle certificazioni.

```{=latex}
\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|p{0.15\textwidth}|X|}
    \hline
    \textbf{Prefisso} & \textbf{Namespace}  \\ \hline
    %
    geo & \texttt{http://www.geonames.org/ontology\#} \\ \hline
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

![Panoramica dell'ontologia `cheese-ontology`\label{fig:overview}](images/generic-overview.svg){witdh=100%}

```{=latex}
\begin{table}[H]
    \centering
    \begin{tabularx}{\textwidth}{|X|X|}
    \hline
    \textbf{Concetto} & \textbf{Definizione}  \\ \hline
    %
    Cheese & ...            \\ \hline
    Food & ...              \\ \hline
 \end{tabularx}
\end{table}
```

In tabella vengono sintetizzate le metriche relative alla `cheese-ontology`.
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

<!-- Aggiungere statistiche ontologia -->

## Cheese
<!-- Linda -->
<!-- Aggiungere tabella con ObjectProperty e Classes -->

## Raw Material
<!-- Linda -->

## Milk
<!-- Nicolas -->

## Environment
<!-- Linda -->
<!-- Aggiungere tabella con ObjectProperty e Classes -->

### Cave

### Pit

### Refrigerator

## Event
<!-- Nicolas -->
<!-- Aggiungere tabella con ObjectProperty e Classes -->

### Aging
<!-- Aggiungere tabella con ObjectProperty e Classes -->

### Ripening
<!-- Aggiungere tabella con ObjectProperty e Classes -->

## Certification
<!-- Nicolas -->
