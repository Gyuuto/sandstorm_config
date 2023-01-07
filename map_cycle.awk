{
    if ( NF != 0 ) {
        common_mutators="NoRestrictedAreas,JoinLeaveMessage,Medic_3";
        ai_mutators="ImprovedAI";
        ismc_mutator="ISMCarmory_Legacy";
        # ismc_mutator="ISMCGunfighter_Tac_Casual_Legacy";
        if ( match($1, "DOI") ) {
            mutators="BoltActionsOnly" "," common_mutators "," ai_mutators;
            printf("(Scenario=\"%s\",Lighting=\"%s\",Options=\"Mutators=%s\")\n", $1, lighting, mutators);
        } else if ( match($1, "Survival") ) {
            #mutators="FastMovement,Vampirism,PistolsOnly";
            mutators=ismc_mutator "," "FastMovement,Vampirism" "," common_mutators "," ai_mutators;
            printf("(Scenario=\"%s\",Lighting=\"%s\",Options=\"Mutators=%s\")\n", $1, lighting, mutators);
        } else {
            mutators=ismc_mutator "," common_mutators "," ai_mutators;
            printf("(Scenario=\"%s\",Lighting=\"%s\",Options=\"Mutators=%s\")\n", $1, lighting, mutators);
        }
    } else {
        printf("\n");
    }
}
