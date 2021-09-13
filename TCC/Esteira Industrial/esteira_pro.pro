<Project application="DESTool" version="0.83">

<VariablePool>
<Variable>
botao         System        +Visual+      +Plant+      
<Value>
<VioSystem>
<Generator name="botao" ftype="System">

<Alphabet>
<Event name="pressionado"/>
</Alphabet>

<StateSet>
<State id="1" name="Off">
<Initial/>
<Marked/>
</State>
<State id="2" name="On"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="pressionado" x2="2"/>
<Transition x1="2" event="pressionado" x2="1"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
=AAAAAgEAAAABAAAAFgBwAHIAZQBzAHMAaQBvAG4AYQBkAG8AAAACAQAAAAIAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAE== </TransitionList>
<StateList>
=AAAAAgIAAAABAgAAAAI== </StateList>
<EventList>
=AAAAAQMAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbw=== </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
-90            -10           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.028380     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
70             -10           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.057648     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              pressionado   2              +Smooth+     
<Item>
<Position>
-90            -10           
</Position>
<BasePoints>
80             -10            0              0              30.008937      0             
62.973438      0              96.025000      0              129.978590     0             
160            0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              pressionado   1              +Smooth+     
<Item>
<Position>
70             -10           
</Position>
<BasePoints>
-80            40             0              0              -26.841184     13.420594     
-60            30             -100           30             -133.184261    13.407869     
-160           0             
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAA/wAAAAAAAAADAAABEgAAAREAAAAAAQAAAAUBAAAAAQ===  0              150            283            1              0             
284           
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
esteira       System        +Visual+      +Plant+      
<Value>
<VioSystem>
<Generator name="esteira" ftype="System">

<Alphabet>
<Event name="liga">
<Controllable/>
</Event>
<Event name="desliga">
<Controllable/>
</Event>
</Alphabet>

<StateSet>
<State id="3" name="Parada">
<Initial/>
<Marked/>
</State>
<State id="4" name="Movimenta"/>
</StateSet>

<TransitionRelation>
<Transition x1="3" event="liga" x2="4"/>
<Transition x1="4" event="desliga" x2="3"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
=AAAAAgEAAAADAAAACABsAGkAZwBhAAAABAEAAAAEAAAADgBkAGUAcwBsAGkAZwBhAAAAAw=== </TransitionList>
<StateList>
=AAAAAgIAAAADAgAAAAQ== </StateList>
<EventList>
=AAAAAgMAAAAIAGwAaQBnAGEDAAAADgBkAGUAcwBsAGkAZwBh= </EventList>
<GraphData>
<States>
<State>
3             
<Item>
<Position>
-20            0.333252      
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.055757     0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
150            0             
</Position>
<BasePoints>
0              0              30             30             -60            0             
-29.997768     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
3              liga          4              +Smooth+     
<Item>
<Position>
-20            0.333252      
</Position>
<BasePoints>
80             19.666748      0              0              30.052752      -0.058911     
66.288379      -0.129945      102.610938     -0.201149      139.998135     -0.274439     
170            -0.333252     
</BasePoints>
</Item>
</Trans>
<Trans>
4              desliga       3              +Smooth+     
<Item>
<Position>
150            0             
</Position>
<BasePoints>
-90            -50            0              0              -27.601845     -11.829362    
-70            -30            -110           -30            -143.170357    -13.230587    
-170           0.333252      
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAA/wAAAAAAAAADAAABKQAAASkAAAAAAQAAAAUBAAAAAQ===  0              150            273            0.816142       0             
274           
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
sensor        System        +Visual+      +Plant+      
<Value>
<VioSystem>
<Generator name="sensor" ftype="System">

<Alphabet>
<Event name="rastreio"/>
<Event name="valida"/>
</Alphabet>

<StateSet>
<State id="1" name="Espera">
<Initial/>
<Marked/>
</State>
<State id="2" name="Ativado"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="rastreio" x2="2"/>
<Transition x1="2" event="valida" x2="1"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
=AAAAAgEAAAABAAAAEAByAGEAcwB0AHIAZQBpAG8AAAACAQAAAAIAAAAMAHYAYQBsAGkAZABhAAAAAQ=== </TransitionList>
<StateList>
=AAAAAgIAAAABAgAAAAI== </StateList>
<EventList>
=AAAAAgMAAAAQAHIAYQBzAHQAcgBlAGkAbwMAAAAMAHYAYQBsAGkAZABh= </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
0              0             
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.057476     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
160            0             
</Position>
<BasePoints>
0              0              30             30             -60            0             
-29.999226     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              rastreio      2              +Smooth+     
<Item>
<Position>
0              0             
</Position>
<BasePoints>
80             -40            0              0              26.840646      -13.420325    
60             -30            100            -30            133.184261     -13.407869    
160            0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              valida        1              +Smooth+     
<Item>
<Position>
160            0             
</Position>
<BasePoints>
-80            10             0              0              -29.979716     0             
-62.973438     0              -96.025000     0              -129.978590    0             
-160           0             
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAA/wAAAAAAAAADAAABDQAAAQwAAAAAAQAAAAUBAAAAAQ===  0              150            268            1              0             
269           
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
E1            System        +Visual+      +Supervisor+ 
<Value>
<VioSystem>
<Generator name="E1" ftype="System">

<Alphabet>
<Event name="pressionado"/>
<Event name="liga">
<Controllable/>
</Event>
<Event name="desliga">
<Controllable/>
</Event>
</Alphabet>

<StateSet>
<State id="1" name="1">
<Initial/>
<Marked/>
</State>
<State id="2" name="2">
<Marked/>
</State>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="pressionado" x2="2"/>
<Transition x1="1" event="desliga" x2="1"/>
<Transition x1="2" event="pressionado" x2="1"/>
<Transition x1="2" event="liga" x2="2"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
=AAAABAEAAAABAAAAFgBwAHIAZQBzAHMAaQBvAG4AYQBkAG8AAAACAQAAAAIAAAAIAGwAaQBnAGEAAAACAQAAAAIAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAEBAAAAAQAAAA4AZABlAHMAbABpAGcAYQAAAAE== </TransitionList>
<StateList>
=AAAAAgIAAAABAgAAAAI== </StateList>
<EventList>
=AAAAAwMAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwMAAAAIAGwAaQBnAGEDAAAADgBkAGUAcwBsAGkAZwBh= </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
-100           -20           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-29.999141     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
100            -20           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.057219     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              pressionado   2              +Smooth+     
<Item>
<Position>
-100           -20           
</Position>
<BasePoints>
100            -30            0              0              30.023333      0             
49.780078      0              149.618750     0              169.978411     0             
200            0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              liga          2              +Spline+     
<Item>
<Position>
100            -20           
</Position>
<BasePoints>
0              -80.595703     0              0              13.419307      -26.838616    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              pressionado   1              +Line+       
<Item>
<Position>
100            -20           
</Position>
<BasePoints>
-100           -10            0              0              -30.008745     0             
-76.193359     0              -122.406250    0              -170.010358    0             
-200           0             
</BasePoints>
</Item>
</Trans>
<Trans>
1              desliga       1              +Spline+     
<Item>
<Position>
-100           -20           
</Position>
<BasePoints>
0              -80.595703     0              0              13.432463      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAA/wAAAAAAAAADAAABCgAAATcAAAAAAQAAAAUBAAAAAQ===  0              150            311            0.867431       0             
266           
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
G             System        +Visual+     
<Value>
<VioSystem>
<Generator name="G" ftype="System">

<Alphabet>
<Event name="pressionado"/>
<Event name="liga">
<Controllable/>
</Event>
<Event name="desliga">
<Controllable/>
</Event>
<Event name="rastreio"/>
<Event name="valida"/>
</Alphabet>

<StateSet>
<State id="1" name="Espera|Off|Parada">
<Initial/>
<Marked/>
</State>
<State id="2" name="Ativado|Off|Parada"/>
<State id="3" name="Espera|On|Parada"/>
<State id="4" name="Espera|Off|Movimenta"/>
<State id="5" name="Ativado|Off|Movimenta"/>
<State id="6" name="Espera|On|Movimenta"/>
<State id="7" name="Ativado|On|Movimenta"/>
<State id="8" name="Ativado|On|Parada"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="pressionado" x2="3"/>
<Transition x1="1" event="liga" x2="4"/>
<Transition x1="1" event="rastreio" x2="2"/>
<Transition x1="2" event="pressionado" x2="8"/>
<Transition x1="2" event="liga" x2="5"/>
<Transition x1="2" event="valida" x2="1"/>
<Transition x1="3" event="pressionado" x2="1"/>
<Transition x1="3" event="liga" x2="6"/>
<Transition x1="3" event="rastreio" x2="8"/>
<Transition x1="4" event="pressionado" x2="6"/>
<Transition x1="4" event="desliga" x2="1"/>
<Transition x1="4" event="rastreio" x2="5"/>
<Transition x1="5" event="pressionado" x2="7"/>
<Transition x1="5" event="desliga" x2="2"/>
<Transition x1="5" event="valida" x2="4"/>
<Transition x1="6" event="pressionado" x2="4"/>
<Transition x1="6" event="desliga" x2="3"/>
<Transition x1="6" event="rastreio" x2="7"/>
<Transition x1="7" event="pressionado" x2="5"/>
<Transition x1="7" event="desliga" x2="8"/>
<Transition x1="7" event="valida" x2="6"/>
<Transition x1="8" event="pressionado" x2="2"/>
<Transition x1="8" event="liga" x2="7"/>
<Transition x1="8" event="valida" x2="3"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
=AAAAGAEAAAABAAAAFgBwAHIAZQBzAHMAaQBvAG4AYQBkAG8AAAADAQAAAAEAAAAIAGwAaQBnAGEAAAAEAQAAAAEAAAAQAHIAYQBzAHQAcgBlAGkAbwAAAAIBAAAAAgAAABYAcAByAGUAcwBzAGkAbwBuAGEAZABvAAAACAEAAAACAAAACABsAGkAZwBhAAAABQEAAAACAAAADAB2AGEAbABpAGQAYQAAAAEBAAAAAwAAABYAcAByAGUAcwBzAGkAbwBuAGEAZABvAAAAAQEAAAADAAAACABsAGkAZwBhAAAABgEAAAADAAAAEAByAGEAcwB0AHIAZQBpAG8AAAAIAQAAAAQAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAYBAAAABAAAAA4AZABlAHMAbABpAGcAYQAAAAEBAAAABAAAABAAcgBhAHMAdAByAGUAaQBvAAAABQEAAAAFAAAAFgBwAHIAZQBzAHMAaQBvAG4AYQBkAG8AAAAHAQAAAAUAAAAOAGQAZQBzAGwAaQBnAGEAAAACAQAAAAUAAAAMAHYAYQBsAGkAZABhAAAABAEAAAAGAAAAFgBwAHIAZQBzAHMAaQBvAG4AYQBkAG8AAAAEAQAAAAYAAAAOAGQAZQBzAGwAaQBnAGEAAAADAQAAAAYAAAAQAHIAYQBzAHQAcgBlAGkAbwAAAAcBAAAABwAAABYAcAByAGUAcwBzAGkAbwBuAGEAZABvAAAABQEAAAAHAAAADgBkAGUAcwBsAGkAZwBhAAAACAEAAAAHAAAADAB2AGEAbABpAGQAYQAAAAYBAAAACAAAABYAcAByAGUAcwBzAGkAbwBuAGEAZABvAAAAAgEAAAAIAAAACABsAGkAZwBhAAAABwEAAAAIAAAADAB2AGEAbABpAGQAYQAAAAM== </TransitionList>
<StateList>
=AAAACAIAAAABAgAAAAICAAAAAwIAAAAEAgAAAAUCAAAABgIAAAAHAgAAAAg== </StateList>
<EventList>
=AAAABQMAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwMAAAAIAGwAaQBnAGEDAAAADgBkAGUAcwBsAGkAZwBhAwAAABAAcgBhAHMAdAByAGUAaQBvAwAAAAwAdgBhAGwAaQBkAGE== </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
0              60            
</Position>
<BasePoints>
0              0              30             30             -60            0             
-29.999571     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
180            60            
</Position>
<BasePoints>
0              0              30             30             -60            0             
-29.999571     0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
360            60            
</Position>
<BasePoints>
0              0              30             30             -60            0             
-29.999571     0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
540            60            
</Position>
<BasePoints>
0              0              30             30             -60            0             
-29.999571     0             
</BasePoints>
</Item>
</State>
<State>
5             
<Item>
<Position>
0              180           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-29.999571     0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
180            180           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-29.999571     0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
360            180           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-29.999571     0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
540            180           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-29.999571     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              pressionado   3              +Line+       
<Item>
<Position>
0              60            
</Position>
<BasePoints>
180            10             0              0              30.028896      0             
129.019922     0              227.981250     0              329.989913     0             
360            0             
</BasePoints>
</Item>
</Trans>
<Trans>
1              liga          4              +Line+       
<Item>
<Position>
0              60            
</Position>
<BasePoints>
270            10             0              0              30.057045      0             
188.330273     0              346.865625     0              509.952790     0             
540            0             
</BasePoints>
</Item>
</Trans>
<Trans>
1              rastreio      2              +Line+       
<Item>
<Position>
0              60            
</Position>
<BasePoints>
90             10             0              0              30.028896      0             
69.590039      0              109.209375     0              150.007609     0             
180            0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              pressionado   8              +Line+       
<Item>
<Position>
180            60            
</Position>
<BasePoints>
176.837722     69.486833      0              0              28.466280      9.488760      
128.422266     42.807422      228.543750     76.181250      331.573659     110.524553    
360            120           
</BasePoints>
</Item>
</Trans>
<Trans>
2              liga          5              +Line+       
<Item>
<Position>
180            60            
</Position>
<BasePoints>
-95.547002     51.679497      0              0              -24.975157     16.650105     
-67.916602     45.277734      -110.784375    73.856250      -155.009327    103.339551    
-180           120           
</BasePoints>
</Item>
</Trans>
<Trans>
2              valida        1              +Line+       
<Item>
<Position>
180            60            
</Position>
<BasePoints>
-90            -10            0              0              -30.028896     0             
-69.590039     0              -109.209375    0              -150.007609    0             
-180           0             
</BasePoints>
</Item>
</Trans>
<Trans>
3              pressionado   1              +Line+       
<Item>
<Position>
360            60            
</Position>
<BasePoints>
-180           -10            0              0              -30.028896     0             
-129.019922    0              -227.981250    0              -329.989913    0             
-360           0             
</BasePoints>
</Item>
</Trans>
<Trans>
3              liga          6              +Line+       
<Item>
<Position>
360            60            
</Position>
<BasePoints>
-95.547002     51.679497      0              0              -24.975157     16.650105     
-67.916602     45.277734      -110.784375    73.856250      -155.009327    103.339551    
-180           120           
</BasePoints>
</Item>
</Trans>
<Trans>
3              rastreio      8              +Line+       
<Item>
<Position>
360            60            
</Position>
<BasePoints>
84.452998      68.320503      0              0              24.975157      16.650105     
67.916602      45.277734      110.784375     73.856250      155.009327     103.339551    
180            120           
</BasePoints>
</Item>
</Trans>
<Trans>
4              pressionado   6              +Line+       
<Item>
<Position>
540            60            
</Position>
<BasePoints>
-183.162278    50.513167      0              0              -28.466280     9.488760      
-128.422266    42.807422      -228.543750    76.181250      -331.573659    110.524553    
-360           120           
</BasePoints>
</Item>
</Trans>
<Trans>
4              desliga       1              +Line+       
<Item>
<Position>
540            60            
</Position>
<BasePoints>
-270           -10            0              0              -30.057045     0             
-188.330273    0              -346.865625    0              -509.952790    0             
-540           0             
</BasePoints>
</Item>
</Trans>
<Trans>
4              rastreio      5              +Line+       
<Item>
<Position>
540            60            
</Position>
<BasePoints>
-272.169305    50.238129      0              0              -29.324406     6.516534      
-188.150977    41.811328      -347.034375    77.118750      -510.734288    113.496508    
-540           120           
</BasePoints>
</Item>
</Trans>
<Trans>
5              pressionado   7              +Line+       
<Item>
<Position>
0              180           
</Position>
<BasePoints>
180            10             0              0              30.028896      0             
129.019922     0              227.981250     0              329.989913     0             
360            0             
</BasePoints>
</Item>
</Trans>
<Trans>
5              desliga       2              +Line+       
<Item>
<Position>
0              180           
</Position>
<BasePoints>
95.547002      -51.679497     0              0              24.975157      -16.650105    
67.916602      -45.277734     110.784375     -73.856250     155.009327     -103.339551   
180            -120          
</BasePoints>
</Item>
</Trans>
<Trans>
5              valida        4              +Line+       
<Item>
<Position>
0              180           
</Position>
<BasePoints>
272.169305     -50.238129     0              0              29.324406      -6.516534     
188.150977     -41.811328     347.034375     -77.118750     510.734288     -113.496508   
540            -120          
</BasePoints>
</Item>
</Trans>
<Trans>
6              pressionado   4              +Line+       
<Item>
<Position>
180            180           
</Position>
<BasePoints>
183.162278     -50.513167     0              0              28.466280      -9.488760     
128.422266     -42.807422     228.543750     -76.181250     331.573659     -110.524553   
360            -120          
</BasePoints>
</Item>
</Trans>
<Trans>
6              desliga       3              +Line+       
<Item>
<Position>
180            180           
</Position>
<BasePoints>
95.547002      -51.679497     0              0              24.975157      -16.650105    
67.916602      -45.277734     110.784375     -73.856250     155.009327     -103.339551   
180            -120          
</BasePoints>
</Item>
</Trans>
<Trans>
6              rastreio      7              +Line+       
<Item>
<Position>
180            180           
</Position>
<BasePoints>
90             10             0              0              30.028896      0             
69.590039      0              109.209375     0              150.007609     0             
180            0             
</BasePoints>
</Item>
</Trans>
<Trans>
7              pressionado   5              +Line+       
<Item>
<Position>
360            180           
</Position>
<BasePoints>
-180           -10            0              0              -30.028896     0             
-129.019922    0              -227.981250    0              -329.989913    0             
-360           0             
</BasePoints>
</Item>
</Trans>
<Trans>
7              desliga       8              +Line+       
<Item>
<Position>
360            180           
</Position>
<BasePoints>
90             10             0              0              30.028896      0             
69.590039      0              109.209375     0              150.007609     0             
180            0             
</BasePoints>
</Item>
</Trans>
<Trans>
7              valida        6              +Line+       
<Item>
<Position>
360            180           
</Position>
<BasePoints>
-90            -10            0              0              -30.028896     0             
-69.590039     0              -109.209375    0              -150.007609    0             
-180           0             
</BasePoints>
</Item>
</Trans>
<Trans>
8              pressionado   2              +Line+       
<Item>
<Position>
540            180           
</Position>
<BasePoints>
-176.837722    -69.486833     0              0              -28.466280     -9.488760     
-128.422266    -42.807422     -228.543750    -76.181250     -331.573659    -110.524553   
-360           -120          
</BasePoints>
</Item>
</Trans>
<Trans>
8              liga          7              +Line+       
<Item>
<Position>
540            180           
</Position>
<BasePoints>
-90            -10            0              0              -30.028896     0             
-69.590039     0              -109.209375    0              -150.007609    0             
-180           0             
</BasePoints>
</Item>
</Trans>
<Trans>
8              valida        3              +Line+       
<Item>
<Position>
540            180           
</Position>
<BasePoints>
-84.452998     -68.320503     0              0              -24.975157     -16.650105    
-67.916602     -45.277734     -110.784375    -73.856250     -155.009327    -103.339551   
-180           -120          
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
-1            ==  0              150            600            1              0             
300           
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
E             Generator     +Visual+     
<Value>
<VioGenerator>
<Generator name="E" ftype="Generator">

<Alphabet ftype="EventSet">
<Event name="pressionado"/>
<Event name="liga"/>
<Event name="desliga"/>
</Alphabet>

<StateSet>
<State id="1" name="1">
<Initial/>
<Marked/>
</State>
<State id="2" name="2">
<Marked/>
</State>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="pressionado" x2="2"/>
<Transition x1="1" event="desliga" x2="1"/>
<Transition x1="2" event="pressionado" x2="1"/>
<Transition x1="2" event="liga" x2="2"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
=AAAABAEAAAABAAAAFgBwAHIAZQBzAHMAaQBvAG4AYQBkAG8AAAACAQAAAAEAAAAOAGQAZQBzAGwAaQBnAGEAAAABAQAAAAIAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAEBAAAAAgAAAAgAbABpAGcAYQAAAAI== </TransitionList>
<StateList>
=AAAAAgIAAAABAgAAAAI== </StateList>
<EventList>
=AAAAAwMAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwMAAAAIAGwAaQBnAGEDAAAADgBkAGUAcwBsAGkAZwBh= </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
0              60            
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.058164     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
180            60            
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.058164     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              pressionado   2              +Line+       
<Item>
<Position>
0              60            
</Position>
<BasePoints>
90             10             0              0              29.999571      0             
69.590039      0              109.209375     0              150.007609     0             
180            0             
</BasePoints>
</Item>
</Trans>
<Trans>
1              desliga       1              +Spline+     
<Item>
<Position>
0              60            
</Position>
<BasePoints>
0              -80.595703     0              0              13.406242      -26.812482    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              pressionado   1              +Line+       
<Item>
<Position>
180            60            
</Position>
<BasePoints>
-90            -10            0              0              -29.999571     0             
-69.590039     0              -109.209375    0              -150.007609    0             
-180           0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              liga          2              +Spline+     
<Item>
<Position>
180            60            
</Position>
<BasePoints>
0              -80.595703     0              0              13.406242      -26.812482    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
-1            ==  0              150            600            1              0             
300           
</VioLayout>
</VioGenerator>
</Value>
</Variable>
<Variable>
K             System        +Visual+     
<Value>
<VioSystem>
<Generator name="K" ftype="System">

<Alphabet>
<Event name="pressionado"/>
<Event name="liga"/>
<Event name="desliga"/>
<Event name="rastreio"/>
<Event name="valida"/>
</Alphabet>

<StateSet>
<State id="1" name="Espera|Off|Parada|1">
<Initial/>
<Marked/>
</State>
<State id="2" name="Espera|On|Parada|2"/>
<State id="3" name="Ativado|Off|Parada|1"/>
<State id="4" name="Ativado|On|Parada|2"/>
<State id="5" name="Ativado|On|Movimenta|2"/>
<State id="6" name="Ativado|Off|Movimenta|1"/>
<State id="7" name="Espera|On|Movimenta|2"/>
<State id="8" name="Espera|Off|Movimenta|1"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="pressionado" x2="2"/>
<Transition x1="1" event="rastreio" x2="3"/>
<Transition x1="2" event="pressionado" x2="1"/>
<Transition x1="2" event="liga" x2="7"/>
<Transition x1="2" event="rastreio" x2="4"/>
<Transition x1="3" event="pressionado" x2="4"/>
<Transition x1="3" event="valida" x2="1"/>
<Transition x1="4" event="pressionado" x2="3"/>
<Transition x1="4" event="liga" x2="5"/>
<Transition x1="4" event="valida" x2="2"/>
<Transition x1="5" event="pressionado" x2="6"/>
<Transition x1="5" event="valida" x2="7"/>
<Transition x1="6" event="pressionado" x2="5"/>
<Transition x1="6" event="desliga" x2="3"/>
<Transition x1="6" event="valida" x2="8"/>
<Transition x1="7" event="pressionado" x2="8"/>
<Transition x1="7" event="rastreio" x2="5"/>
<Transition x1="8" event="pressionado" x2="7"/>
<Transition x1="8" event="desliga" x2="1"/>
<Transition x1="8" event="rastreio" x2="6"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
=AAAAFAEAAAABAAAAFgBwAHIAZQBzAHMAaQBvAG4AYQBkAG8AAAACAQAAAAEAAAAQAHIAYQBzAHQAcgBlAGkAbwAAAAMBAAAAAgAAABYAcAByAGUAcwBzAGkAbwBuAGEAZABvAAAAAQEAAAACAAAACABsAGkAZwBhAAAABwEAAAACAAAAEAByAGEAcwB0AHIAZQBpAG8AAAAEAQAAAAMAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAQBAAAAAwAAAAwAdgBhAGwAaQBkAGEAAAABAQAAAAQAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAMBAAAABAAAAAgAbABpAGcAYQAAAAUBAAAABAAAAAwAdgBhAGwAaQBkAGEAAAACAQAAAAUAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAYBAAAABQAAAAwAdgBhAGwAaQBkAGEAAAAHAQAAAAYAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAUBAAAABgAAAA4AZABlAHMAbABpAGcAYQAAAAMBAAAABgAAAAwAdgBhAGwAaQBkAGEAAAAIAQAAAAcAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAgBAAAABwAAABAAcgBhAHMAdAByAGUAaQBvAAAABQEAAAAIAAAAFgBwAHIAZQBzAHMAaQBvAG4AYQBkAG8AAAAHAQAAAAgAAAAOAGQAZQBzAGwAaQBnAGEAAAABAQAAAAgAAAAQAHIAYQBzAHQAcgBlAGkAbwAAAAY== </TransitionList>
<StateList>
=AAAACAIAAAABAgAAAAICAAAAAwIAAAAEAgAAAAUCAAAABgIAAAAHAgAAAAg== </StateList>
<EventList>
=AAAABQMAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwMAAAAIAGwAaQBnAGEDAAAADgBkAGUAcwBsAGkAZwBhAwAAABAAcgBhAHMAdAByAGUAaQBvAwAAAAwAdgBhAGwAaQBkAGE== </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
-90            -120          
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.028896     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
210            -220          
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.028896     0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
-90            50            
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.028896     0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
60             160           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.028896     0             
</BasePoints>
</Item>
</State>
<State>
5             
<Item>
<Position>
460            160           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.028896     0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
310            40            
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.028896     0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
460            -120          
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.028896     0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
200            -50           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.028896     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              pressionado   2              +Line+       
<Item>
<Position>
-90            -120          
</Position>
<BasePoints>
153.162278     -40.513167     0              0              28.480524      -9.493508     
108.711914     -36.237305     188.859375     -62.953125     271.538721     -90.512907    
300            -100          
</BasePoints>
</Item>
</Trans>
<Trans>
1              rastreio      3              +Line+       
<Item>
<Position>
-90            -120          
</Position>
<BasePoints>
-10            85             0              0              0              30.024090     
0              66.288379      0              102.610938     0              139.998135    
0              170           
</BasePoints>
</Item>
</Trans>
<Trans>
2              pressionado   1              +Line+       
<Item>
<Position>
210            -220          
</Position>
<BasePoints>
-153.162278    40.513167      0              0              -28.480524     9.493508      
-108.711914    36.237305      -188.859375    62.953125      -271.538721    90.512907     
-300           100           
</BasePoints>
</Item>
</Trans>
<Trans>
2              liga          7              +Line+       
<Item>
<Position>
210            -220          
</Position>
<BasePoints>
121.286093     59.284767      0              0              27.871966      11.148787     
92.004395      36.801758      156.054688     62.421875      222.147435     88.858974     
250            100           
</BasePoints>
</Item>
</Trans>
<Trans>
2              rastreio      4              +Line+       
<Item>
<Position>
210            -220          
</Position>
<BasePoints>
-84.301552     186.328335     0              0              -11.027074     27.935256     
-53.260254     134.925977     -95.460938     241.834375     -138.985780    352.097310    
-150           380           
</BasePoints>
</Item>
</Trans>
<Trans>
3              pressionado   4              +Line+       
<Item>
<Position>
-90            50            
</Position>
<BasePoints>
69.086363      63.064050      0              0              24.171932      17.726083     
57.742676      42.344629      91.242188      66.910938      125.795553     92.250073     
150            110           
</BasePoints>
</Item>
</Trans>
<Trans>
3              valida        1              +Line+       
<Item>
<Position>
-90            50            
</Position>
<BasePoints>
10             -85            0              0              0              -30.024090    
0              -66.288379     0              -102.610938    0              -139.998135   
0              -170          
</BasePoints>
</Item>
</Trans>
<Trans>
4              pressionado   3              +Line+       
<Item>
<Position>
60             160           
</Position>
<BasePoints>
-69.086363     -63.064050     0              0              -24.171932     -17.726083    
-57.742676     -42.344629     -91.242188     -66.910938     -125.795553    -92.250073    
-150           -110          
</BasePoints>
</Item>
</Trans>
<Trans>
4              liga          5              +Line+       
<Item>
<Position>
60             160           
</Position>
<BasePoints>
200            10             0              0              30.057649      0             
142.160156     0              254.437500     0              369.947583     0             
400            0             
</BasePoints>
</Item>
</Trans>
<Trans>
4              valida        2              +Line+       
<Item>
<Position>
60             160           
</Position>
<BasePoints>
84.301552      -186.328335    0              0              11.027074      -27.935256    
53.260254      -134.925977    95.460938      -241.834375    138.985780     -352.097310   
150            -380          
</BasePoints>
</Item>
</Trans>
<Trans>
5              pressionado   6              +Line+       
<Item>
<Position>
460            160           
</Position>
<BasePoints>
-68.753050     -67.808688     0              0              -23.409690     -18.727753    
-57.443848     -45.955078     -91.523438     -73.218750     -126.552347    -101.241878   
-150           -120          
</BasePoints>
</Item>
</Trans>
<Trans>
5              valida        7              +Line+       
<Item>
<Position>
460            160           
</Position>
<BasePoints>
10             -140           0              0              0              -29.999629    
0              -102.580078    0              -175.218750    0              -249.960089   
0              -280          
</BasePoints>
</Item>
</Trans>
<Trans>
6              pressionado   5              +Line+       
<Item>
<Position>
310            40            
</Position>
<BasePoints>
68.753050      67.808688      0              0              23.409690      18.727753     
57.443848      45.955078      91.523438      73.218750      126.552347     101.241878    
150            120           
</BasePoints>
</Item>
</Trans>
<Trans>
6              desliga       3              +Line+       
<Item>
<Position>
310            40            
</Position>
<BasePoints>
-200.249922    -4.996876      0              0              -30.028723     0.750718      
-142.160156    3.554004       -254.437500    6.360938       -370.035455    9.250886      
-400           10            
</BasePoints>
</Item>
</Trans>
<Trans>
6              valida        8              +Line+       
<Item>
<Position>
310            40            
</Position>
<BasePoints>
-48.667622     -52.739573     0              0              -23.233925     -19.009575    
-44.207324     -36.169629     -65.157813     -53.310938     -86.769582     -70.993294    
-110           -90           
</BasePoints>
</Item>
</Trans>
<Trans>
7              pressionado   8              +Line+       
<Item>
<Position>
460            -120          
</Position>
<BasePoints>
-132.599735    25.343842      0              0              -28.986845     7.804150      
-95.684570     25.761230      -162.296875    43.695312      -231.033333    62.201282     
-260           70            
</BasePoints>
</Item>
</Trans>
<Trans>
7              rastreio      5              +Line+       
<Item>
<Position>
460            -120          
</Position>
<BasePoints>
-10            140            0              0              0              29.999629     
0              102.580078     0              175.218750     0              249.960089    
0              280           
</BasePoints>
</Item>
</Trans>
<Trans>
8              pressionado   7              +Line+       
<Item>
<Position>
200            -50           
</Position>
<BasePoints>
132.599735     -25.343842     0              0              28.986845      -7.804150     
95.684570      -25.761230     162.296875     -43.695312     231.033333     -62.201282    
260            -70           
</BasePoints>
</Item>
</Trans>
<Trans>
8              desliga       1              +Line+       
<Item>
<Position>
200            -50           
</Position>
<BasePoints>
-142.653595    -44.720822     0              0              -29.198157     -7.047832     
-105.569629    -25.482324     -182.110938    -43.957813     -260.843667    -62.962264    
-290           -70           
</BasePoints>
</Item>
</Trans>
<Trans>
8              rastreio      6              +Line+       
<Item>
<Position>
200            -50           
</Position>
<BasePoints>
48.667622      52.739573      0              0              23.233925      19.009575     
44.207324      36.169629      65.157813      53.310938      86.769582      70.993294     
110            90            
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
-1            ==  0              150            600            1              0             
300           
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
S             System        +Visual+     
<Value>
<VioSystem>
<Generator name="S" ftype="System">

<Alphabet>
<Event name="pressionado"/>
<Event name="liga">
<Controllable/>
</Event>
<Event name="desliga">
<Controllable/>
</Event>
<Event name="rastreio"/>
<Event name="valida"/>
</Alphabet>

<StateSet>
<State id="1" name="Espera|Off|Parada|Espera|Off|Parada|1">
<Initial/>
<Marked/>
</State>
<State id="2" name="Espera|On|Parada|Espera|On|Parada|2"/>
<State id="3" name="Ativado|Off|Parada|Ativado|Off|Parada|1"/>
<State id="4" name="Ativado|On|Parada|Ativado|On|Parada|2"/>
<State id="5" name="Ativado|On|Movimenta|Ativado|On|Movimenta|2"/>
<State id="6" name="Ativado|Off|Movimenta|Ativado|Off|Movimenta|1"/>
<State id="7" name="Espera|On|Movimenta|Espera|On|Movimenta|2"/>
<State id="8" name="Espera|Off|Movimenta|Espera|Off|Movimenta|1"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="pressionado" x2="2"/>
<Transition x1="1" event="rastreio" x2="3"/>
<Transition x1="2" event="pressionado" x2="1"/>
<Transition x1="2" event="liga" x2="7"/>
<Transition x1="2" event="rastreio" x2="4"/>
<Transition x1="3" event="pressionado" x2="4"/>
<Transition x1="3" event="valida" x2="1"/>
<Transition x1="4" event="pressionado" x2="3"/>
<Transition x1="4" event="liga" x2="5"/>
<Transition x1="4" event="valida" x2="2"/>
<Transition x1="5" event="pressionado" x2="6"/>
<Transition x1="5" event="valida" x2="7"/>
<Transition x1="6" event="pressionado" x2="5"/>
<Transition x1="6" event="desliga" x2="3"/>
<Transition x1="6" event="valida" x2="8"/>
<Transition x1="7" event="pressionado" x2="8"/>
<Transition x1="7" event="rastreio" x2="5"/>
<Transition x1="8" event="pressionado" x2="7"/>
<Transition x1="8" event="desliga" x2="1"/>
<Transition x1="8" event="rastreio" x2="6"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
=AAAAFAEAAAABAAAAFgBwAHIAZQBzAHMAaQBvAG4AYQBkAG8AAAACAQAAAAEAAAAQAHIAYQBzAHQAcgBlAGkAbwAAAAMBAAAAAgAAABYAcAByAGUAcwBzAGkAbwBuAGEAZABvAAAAAQEAAAACAAAACABsAGkAZwBhAAAABwEAAAACAAAAEAByAGEAcwB0AHIAZQBpAG8AAAAEAQAAAAMAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAQBAAAAAwAAAAwAdgBhAGwAaQBkAGEAAAABAQAAAAQAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAMBAAAABAAAAAgAbABpAGcAYQAAAAUBAAAABAAAAAwAdgBhAGwAaQBkAGEAAAACAQAAAAUAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAYBAAAABQAAAAwAdgBhAGwAaQBkAGEAAAAHAQAAAAYAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAUBAAAABgAAAA4AZABlAHMAbABpAGcAYQAAAAMBAAAABgAAAAwAdgBhAGwAaQBkAGEAAAAIAQAAAAcAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwAAAAgBAAAABwAAABAAcgBhAHMAdAByAGUAaQBvAAAABQEAAAAIAAAAFgBwAHIAZQBzAHMAaQBvAG4AYQBkAG8AAAAHAQAAAAgAAAAOAGQAZQBzAGwAaQBnAGEAAAABAQAAAAgAAAAQAHIAYQBzAHQAcgBlAGkAbwAAAAY== </TransitionList>
<StateList>
=AAAACAIAAAABAgAAAAICAAAAAwIAAAAEAgAAAAUCAAAABgIAAAAHAgAAAAg== </StateList>
<EventList>
=AAAABQMAAAAWAHAAcgBlAHMAcwBpAG8AbgBhAGQAbwMAAAAIAGwAaQBnAGEDAAAADgBkAGUAcwBsAGkAZwBhAwAAABAAcgBhAHMAdAByAGUAaQBvAwAAAAwAdgBhAGwAaQBkAGE== </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
-70            -210          
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.029154     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
-70            -40           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.029154     0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
440            -210          
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.029154     0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
110            -30           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.029154     0             
</BasePoints>
</Item>
</State>
<State>
5             
<Item>
<Position>
110            210           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.029154     0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
440            210           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.029154     0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
-70            90            
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.029154     0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
310            -10           
</Position>
<BasePoints>
0              0              30             30             -60            0             
-30.029154     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              pressionado   2              +Smooth+     
<Item>
<Position>
-70            -210          
</Position>
<BasePoints>
-40            70             0              0              0              29.972187     
0              66.288379      0              102.610938     0              140.056618    
0              170           
</BasePoints>
</Item>
</Trans>
<Trans>
1              rastreio      3              +Line+       
<Item>
<Position>
-70            -210          
</Position>
<BasePoints>
255            10             0              0              29.984708      0             
178.544824     0              326.957812     0              480.015292     0             
510            0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              pressionado   1              +Smooth+     
<Item>
<Position>
-70            -40           
</Position>
<BasePoints>
40             -70            0              0              0              -29.972187    
0              -66.288379     0              -102.610938    0              -140.056618   
0              -170          
</BasePoints>
</Item>
</Trans>
<Trans>
2              liga          7              +Smooth+     
<Item>
<Position>
-70            -40           
</Position>
<BasePoints>
-20            60             0              0              0              29.994750     
0              53.108301      0              76.192188      0              100.005250    
0              130           
</BasePoints>
</Item>
</Trans>
<Trans>
2              rastreio      4              +Line+       
<Item>
<Position>
-70            -40           
</Position>
<BasePoints>
89.445300      14.984604      0              0              29.970618      1.665034      
69.590039      3.866113       109.209375     6.067188       150.007609     8.333756      
180            10            
</BasePoints>
</Item>
</Trans>
<Trans>
3              pressionado   4              +Smooth+     
<Item>
<Position>
440            -210          
</Position>
<BasePoints>
-170           60             0              0              -26.341445     14.368061     
-117.829980    64.270898      -209.395313    114.215625     -303.607183    165.603918    
-330           180           
</BasePoints>
</Item>
</Trans>
<Trans>
3              valida        1              +Line+       
<Item>
<Position>
440            -210          
</Position>
<BasePoints>
-255           -10            0              0              -29.984708     0             
-178.544824    0              -326.957812    0              -480.015292    0             
-510           0             
</BasePoints>
</Item>
</Trans>
<Trans>
4              pressionado   3              +Smooth+     
<Item>
<Position>
110            -30           
</Position>
<BasePoints>
170            -70            0              0              26.392969      -14.396165    
117.829980     -64.270898     209.395313     -114.215625    303.632882     -165.617936   
330            -180          
</BasePoints>
</Item>
</Trans>
<Trans>
4              liga          5              +Line+       
<Item>
<Position>
110            -30           
</Position>
<BasePoints>
-10            120            0              0              0              29.999229     
0              89.360156      0              148.837500     0              210.027577    
0              240           
</BasePoints>
</Item>
</Trans>
<Trans>
4              valida        2              +Line+       
<Item>
<Position>
110            -30           
</Position>
<BasePoints>
-89.445300     -14.984604     0              0              -29.970618     -1.665034     
-69.590039     -3.866113      -109.209375    -6.067188      -150.007609    -8.333756     
-180           -10           
</BasePoints>
</Item>
</Trans>
<Trans>
5              pressionado   6              +Line+       
<Item>
<Position>
110            210           
</Position>
<BasePoints>
165            10             0              0              30.013933      0             
119.144824     0              208.157813     0              299.984607     0             
330            0             
</BasePoints>
</Item>
</Trans>
<Trans>
5              valida        7              +Smooth+     
<Item>
<Position>
110            210           
</Position>
<BasePoints>
-80            -70            0              0              -24.999785     -16.666524    
-67.916602     -45.277734     -110.784375    -73.856250     -155.000215    -103.333476   
-180           -120          
</BasePoints>
</Item>
</Trans>
<Trans>
6              pressionado   5              +Line+       
<Item>
<Position>
440            210           
</Position>
<BasePoints>
-165           -10            0              0              -30.013933     0             
-119.144824    0              -208.157813    0              -299.984607    0             
-330           0             
</BasePoints>
</Item>
</Trans>
<Trans>
6              desliga       3              +Smooth+     
<Item>
<Position>
440            210           
</Position>
<BasePoints>
-30            -210           0              0              0              -30.057276    
0              -148.849805    0              -267.553125    0              -389.989194   
0              -420          
</BasePoints>
</Item>
</Trans>
<Trans>
6              valida        8              +Smooth+     
<Item>
<Position>
440            210           
</Position>
<BasePoints>
-45            -115           0              0              -13.893746     -26.629681    
-44.321484     -84.949512     -84.756250     -133.282813    -116.082245    -193.324303   
-130           -220          
</BasePoints>
</Item>
</Trans>
<Trans>
7              pressionado   8              +Smooth+     
<Item>
<Position>
-70            90            
</Position>
<BasePoints>
275            -55            0              0              28.804227      -8.124269     
138.476660     -39.057520     238.198438     -60.004688     351.058080     -91.836894    
380            -100          
</BasePoints>
</Item>
</Trans>
<Trans>
7              rastreio      5              +Smooth+     
<Item>
<Position>
-70            90            
</Position>
<BasePoints>
80             70             0              0              24.950981      16.633988     
67.916602      45.277734      110.784375     73.856250      155.049019     103.366012    
180            120           
</BasePoints>
</Item>
</Trans>
<Trans>
8              pressionado   7              +Smooth+     
<Item>
<Position>
310            -10           
</Position>
<BasePoints>
-285           55             0              0              -28.804227     8.124269      
-138.476660    39.057520      -238.198438    60.004688      -351.058080    91.836894     
-380           100           
</BasePoints>
</Item>
</Trans>
<Trans>
8              desliga       1              +Smooth+     
<Item>
<Position>
310            -10           
</Position>
<BasePoints>
-180           -120           0              0              -26.558988     -13.978415    
-134.421289    -70.748047     -242.309375    -127.531250    -353.441012    -186.021585   
-380           -200          
</BasePoints>
</Item>
</Trans>
<Trans>
8              rastreio      6              +Smooth+     
<Item>
<Position>
310            -10           
</Position>
<BasePoints>
45             115            0              0              13.893746      26.629681     
44.321484      84.949512      84.756250      133.282813     116.082245     193.324303    
130            220           
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAA/wAAAAAAAAADAAABaQAAAuoAAAAAAQAAAAUBAAAAAQ===  0              150            746            1              0             
361           
</VioLayout>
</VioSystem>
</Value>
</Variable>
</VariablePool>

<Functions/>
<Script>
<Parallel>
Parallel_1    1             
<Parameters>
<Vector>
botao         esteira       sensor       
</Vector>
G            
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</Parallel>
<Parallel>
Parallel_2    1             
<Parameters>
<Vector>
E1           
</Vector>
E            
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</Parallel>
<Parallel>
Parallel_3    0             
<Parameters>
G             E             K            
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</Parallel>
<SupConNB>
SupConNB_4    0             
<Parameters>
G             K             S            
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</SupConNB>
</Script>

<Simulator>

 +Supervisor+  +Plant+      
<DevFile>
"../../../Arquivos de programas/DESTool" 
</DevFile>
<SimEvents>
pressionado  
<Priority>
0             
</Priority>
liga         
<Priority>
0             
</Priority>
desliga      
<Priority>
0             
</Priority>
rastreio     
<Priority>
0             
</Priority>
conta        
<Priority>
0             
</Priority>
cont&gt;5    
<Priority>
0             
</Priority>
</SimEvents>
<Conditions/>
</Simulator>
<GuiState/>
</Project>
