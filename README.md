# Poklady pro analytickou dílnu 
Data & Emoce na Prague Data Festivalu 2018

## Software
Analytická platforma KNIME:
https://www.knime.com/downloads/download-knime

Instalace balíčku pro textovou analytiku
1. Help > Install New Software
2. Work with: --All Available Sites--
3. Hledat klíčové slovo „text“
4. Označit KNIME Textprocessing 3.5.3
5. Nainstalovat podle průvodce

## Dataset

Původní dataset z https://archive.ics.uci.edu/ml/datasets/Sentiment+Labelled+Sentences byl R skriptem [coreNLP.R](coreNLP.R) obohacen o sentiment získaný z balíku CoreNLP.

Výsledný soubor určený pro práci v KNIME [data_sentiment.csv](data_sentiment.csv). 

Sentiment nebyl klasifikován pro texty složené z více vět. Takové řádky obsahují kód _E_vety_ namísto označení a hodnoty sentimentu.
