#!/bin/bash

server_port=
query_port=
stats_token=
GSLT_token=

host_name=
passwd=""

./create_map_cycle.sh
./create_map_cand.sh 

declare -A map_dict
for v in $(grep "," ./scenario_to_map.txt); do
    key=$(echo $v | cut -d "," -f 1)
    val=$(echo $v | cut -d "," -f 2)

    map_dict[$key]=$val
done

scenario_list=()
for v in $(cat ./MapCand_list.txt); do
    scenario_list=(${scenario_list[@]} $v)
done
cycle_list=()
for v in $(cat ./MapCycle.txt); do
    cycle_list=(${cycle_list[@]} $v)
done

selectIdx=$((${RANDOM} % ${#scenario_list[@]}))

scenario=${scenario_list[$selectIdx]}
firstScenario=$(echo ${scenario} | \
                    sed "s/^Scenario_\|^S_//" | \
                    sed "s/_Checkpoint\|_Coop\|_CP//" | \
                    sed "s/_Survival\|_Outpost//" | \
                    sed "s/_Day$//" | \
                    sed "s/_[0-9]\+$//" | \
                    sed "s/_City$\|_Caves$\|_CBQ$\|_Bunker$//" | \
                    sed "s/_Sec.*$//" | \
                    sed "s/_Ins.*$//" | \
                    sed "s/_INS.*$//")
mutator=$(echo ${cycle_list[$selectIdx]} | sed "s/.*Mutators=\([^)\"]\+\).*/\1/")

map=${map_dict[$firstScenario]}
initial_map=${map}?Scenario=${scenario}?Lighting=day?Mutators=${mutator}
mutators_all=NoRestrictedAreas,JoinLeaveMessage,ImprovedAI,FPLegsPlus,Medic_3
num_players=8

echo $firstScenario
echo $initial_map
echo $mutator

if [ -z ${passwd} ]; then 
    /d/steam/steamapps/common/sandstorm_server/InsurgencyServer.exe \
        Canyon?Scenario=Scenario_Crossing_Checkpoint_Security?MaxPlayers=${num_players} \
        -log \
        -hostname=\"${host_name}\" \
        -Port=${server_port} \
        -QueryPort=${query_port} \
        -Mods \
        -Motd \
        -mutators=${mutators_all} \
        -ModDownloadTravelTo=${initial_map} \
        -GameStatsToken=${stats_token} \
        -GSLTToken=${GSLT_token} \
        -GameStats
else
    /d/steam/steamapps/common/sandstorm_server/InsurgencyServer.exe \
        Canyon?Scenario=Scenario_Crossing_Checkpoint_Security?password=${passwd}?MaxPlayers=${num_players} \
        -log \
        -hostname=\"${host_name}\" \
        -Port=${server_port} \
        -QueryPort=${query_port} \
        -Mods \
        -Motd \
        -mutators=${mutators_all} \
        -ModDownloadTravelTo=${initial_map} \
        -GameStatsToken=${stats_token} \
        -GSLTToken=${GSLT_token} \
        -GameStats
fi
