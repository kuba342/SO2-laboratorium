#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3
#
# Celem zajęć jest pogłębienie wiedzy na temat struktury systemu plików,
# poruszania się po katalogach i kontroli uprawnień w skryptach powłoki.
# Proszę unikać wykorzystywania narzędzia `find` w ramach bieżących zajęć.
#
# Nie przywiązujemy wagi do środowiska roboczego – zakładamy, że jego pliki,
# inne niż te podane wprost w treści zadań, mogą ulec zmianie, a przygotowane
# rozwiązania nadal powinny działać poprawnie (robić to, o czym zadanie mówi).
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 10.
# Proszę określić, ile w katalogu `dane/icao/` jest unikalnych plików,
# rozumianych jako niepowtarzalne zaalokowanie zawartości na dysku twardym
# (to znaczy: kilka dowiązań twardych do tego samego pliku traktujemy jako 1).
# Jako wynik wyświetlić po prostu samą liczbę, nic więcej.
#
directory="dane/icao"
duplicates="dane/duplicates"
counter=0
mkdir $duplicates
for file in $directory/*;
do
    for file1 in $directory/*;
    do
        if [[ "$file" -ef "$file1" && ! "$file" = "$file1" ]];
        then
            mv "$file1" $duplicates
        fi
    done
done

#Zliczam pozostałe pliki
for file in $directory/*;
do
    counter=$(($counter+1))
done
echo $counter

#przekopiowuję sprowrotem pliki
for file in $duplicates/*;
do
    mv "$file" $directory
done
#usuwam nowy katalog
rmdir $duplicates
