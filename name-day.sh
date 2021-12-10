#!/bin/bash

NAMES=("Gabriela" "Zuzana" "Mojmír" "Veronika" "Richard" "Jana" "Stanislav" "Kamil" "Jan" "Tomáš" "Marek" "Patrik" "Jiří" "Jaromír" "Petr")
RESULT=()

for i in {0..5}; do
	NAME=$(curl -s https://svatky.adresa.info/txt?date=$(date '+%d%m' -d "+${i} days") | cut -d";" -f 2)
	if echo "${NAMES[@]}" | grep -q ${NAME}; then
		RESULT+=("Svatek: ${NAME} in ${i} days")
	fi
done

for notification in "${RESULT[@]}"; do
	notify-send "${notification}"
done

