#!/bin/sh

sed "s/^S_/Scenario_/" map_list.txt | sed "s/Coop/Checkpoint/" | sed "s/CP/Checkpoint/" | sed "s/Ins_/Insurgents_/" | sed "s/Sec_/Security_/" | sed "s/Ins$/Insurgents/" | sed "s/Sec$/Security/" | sed "s/_[0-9]\+//" | grep -v "^$" > MapCand.txt

grep -v "^$" map_list.txt > MapCand_list.txt
