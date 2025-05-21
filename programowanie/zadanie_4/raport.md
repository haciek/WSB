# Zadanie 4
> Autor: Maciej Habasiński
> Nr albumu: 152697
> Repozytorium: [Zadanie 4](https://github.com/haciek/WSB/tree/main/programowanie/zadanie_4)
___

## 1. Wprowadzenie

Analiza miała na celu porównanie 10 alternatyw przedstawiających koszty, zyski oraz ryzyka. Zostały do tego wykorzystane metody TOPSIS i SPOTIS. Dane były analizowane w taki sposób, aby zmaksymalizować zysk przy jednoczesnej minimalizacji kosztów i ryzyka.


## 2. Tabela wyników

| Alternatywa | TOPSIS Score | TOPSIS Rank | SPOTIS Score | SPOTIS Rank |
| ----------- | ------------ | ----------- | ------------ | ----------- |
| 8           | 0.618955     | 1           | 0.498356     | 10          |
| 6           | 0.590309     | 2           | 0.488964     | 9           |
| 3           | 0.475813     | 3           | 0.387404     | 2           |
| 5           | 0.438545     | 4           | 0.392069     | 3           |
| 1           | 0.409075     | 5           | 0.433531     | 8           |
| 7           | 0.381045     | 6           | 0.426406     | 7           |
| 4           | 0.362526     | 7           | 0.408146     | 6           |
| 2           | 0.362143     | 8           | 0.398540     | 4           |
| 9           | 0.361065     | 9           | 0.377029     | 1           |
| 10          | 0.360807     | 10          | 0.400938     | 5           |

## 3. Interpretacja

### Najlepsze alternatywy według TOPSIS

Najwyższy wynik ma **8** (0.618955), co oznacza, że wg TOPSIS jest to najlepsza opcja.
Kolejne to 6, 3 i 5.

### Najlepsze alternatywy według SPOTIS

Najniższy wynik ma **9** (0.377029), co wg SPOTIS czyni ją najlepszą.
Następne w rankingu to **3** i **5**.

### Zbieżności wyników

Alternatywa **3** znajduje się wysoko w obu rankingach (3 miejsce w TOPSIS, 2 w SPOTIS), co wskazuje na jej stabilność i kompromisowość.

### Rozbieżności wyników
Alternatywy **8** i **9** zajmują skrajne miejsca w rankingach przeciwnych metod:
  - 8 jest najlepsza wg TOPSIS, ale najgorsza wg SPOTIS.
  - 9 jest najlepsza wg SPOTIS, ale prawie najgorsza wg TOPSIS.
  
### Możliwe przyczyny rozbieżności

TOPSIS nagradza alternatywy bliskie idealnemu rozwiązaniu (maksimum korzystnych i minimum niekorzystnych kryteriów).
SPOTIS skupia się na minimalizowaniu odległości od punktu odniesienia (może lepiej uwzględniać kompromisy).
Duże różnice wskazują, że **8** i **9** mogą mieć bardzo mocne i bardzo słabe strony w różnych kryteriach.

## 4. Wnioski

Alternatywa **3** jest rekomendowana jako najlepszy kompromis między kryteriami, mając wysokie oceny w obu metodach.
Alternatywy **8** i **9** wymagają dokładniejszej analizy indywidualnych kryteriów, ponieważ ich oceny są skrajne i różne w zależności od metody.
Zaleca się wykorzystanie kilku metod MCDM oraz dogłębną analizę kryteriów, by uniknąć błędów wynikających z ograniczeń pojedynczej metody.

