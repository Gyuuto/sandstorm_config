#!/bin/bash

lighting=Day
mutators=

awk -v lighting=$lighting -v mutators=$mutators -f ./map_cycle.awk ./map_list.txt > MapCycle.txt 
