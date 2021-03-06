#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 2
#
# Celem zajęć jest nabranie doświadczenia w podstawowej pracy z powłoką Bash,
# w szczególności w nawigowaniu po drzewie katalogów i sprawdzaniu uprawnień.
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
# W katalogu `dane/deep/` i wszystkich jego podkatalogach odnaleźć wszystkie
# pliki zwykłe, których nie możemy przeczytać ze względu na brak uprawnień
# dostępu. Zwrócić ścieżki do odnalezionych plików względem katalogu `dane/`.
# Opracowany skrypt powinien działać niezależnie od istniejącej liczby
# i poziomów podkatalogów.
#
# Wskazówka: pomocne może być zdefiniowanie funkcji i jej rekurencje wywołanie.
#

#Z użyciem find:
#while read -r file;
#do
#    if [[ ! -r "$file" ]];
#    then
#        echo "$file" | sed 's|dane/||'
#    fi
#done < <(find dane/deep -type f)

directory="dane/deep"

#instrukcja pozwalająca odczytywać kropki...
shopt -s dotglob

function scan () {
    dir=$1
    #echo $dir
    #Iteruję przez elementy katalogu:
    for file in "${dir}"/*;
    do
        #Jeśli bez dostępu zwykły plik - echo
        if [[ ! -r "${file}" ]];
        then
            echo "${file}" | sed 's|dane/||'
        fi

        #Jeśli katalog, to rekurencyjne wywołanie
        if [[ -d "${file}" ]];
        then
            scan "${file}"
        fi
    done
}

scan "${directory}"

