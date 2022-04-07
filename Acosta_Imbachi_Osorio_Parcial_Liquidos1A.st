PROGRAM Liquidos1A
  VAR
    Start : BOOL;
    Stop : BOOL;
    Reset : BOOL;
    I00_WP1 : BOOL;
    I01_WP2 : BOOL;
    I02_LS1 : BOOL;
    I03_LS2 : BOOL;
    I04_LS3 : BOOL;
    I05_LS4 : BOOL;
    I06_LS5 : BOOL;
    I07_LS6 : BOOL;
    Q00_Valve1 : BOOL;
    Q01_Valve2 : BOOL;
    Q02_Valve3 : BOOL;
    Q03_Mix : BOOL;
    IR1 : BOOL;
    DT6_Init : TON;
    DT0_Tank1 : TON;
    DT1_Tank2 : TON;
    DT2_Tank3 : TON;
    DT3_Tank3 : TON;
    DT4_Mixer : TON;
    IR2 : BOOL;
    IR3 : BOOL;
    DT5_Output : TON;
    CTU0 : CTU;
    R_TRIG1 : R_TRIG;
  END_VAR

  IF NOT(Reset) AND Start AND NOT(Stop) THEN
    I00_WP1 := FALSE; (*reset*)
  END_IF;
  IF NOT(Reset) AND Start AND NOT(Stop) THEN
    I01_WP2 := FALSE; (*reset*)
  END_IF;
  IF NOT(Reset) AND Start AND NOT(Stop) THEN
    I02_LS1 := FALSE; (*reset*)
  END_IF;
  IF NOT(Reset) AND Start AND NOT(Stop) THEN
    I03_LS2 := FALSE; (*reset*)
  END_IF;
  IF NOT(Reset) AND Start AND NOT(Stop) THEN
    I04_LS3 := FALSE; (*reset*)
  END_IF;
  IF NOT(Reset) AND Start AND NOT(Stop) THEN
    I05_LS4 := FALSE; (*reset*)
  END_IF;
  IF NOT(Reset) AND Start AND NOT(Stop) THEN
    I06_LS5 := FALSE; (*reset*)
  END_IF;
  IF NOT(Reset) AND Start AND NOT(Stop) THEN
    I07_LS6 := FALSE; (*reset*)
  END_IF;
  IR1 := NOT(Reset) AND Start AND NOT(Stop);
  IF NOT(Reset) AND Start AND NOT(Stop) THEN
    Q00_Valve1 := FALSE; (*reset*)
  END_IF;
  IF NOT(Reset) AND Start AND NOT(Stop) THEN
    Q01_Valve2 := FALSE; (*reset*)
  END_IF;
  IF NOT(Reset) AND Start AND NOT(Stop) THEN
    Q02_Valve3 := FALSE; (*reset*)
  END_IF;
  IF NOT(Reset) AND Start AND NOT(Stop) THEN
    Q03_Mix := FALSE; (*reset*)
  END_IF;
  DT6_Init(IN := IR1 AND NOT(Stop), PT := T#3000ms);
  IF DT6_Init.Q THEN
    I03_LS2 := TRUE; (*set*)
  END_IF;
  IF DT6_Init.Q THEN
    I05_LS4 := TRUE; (*set*)
  END_IF;
  IF DT6_Init.Q THEN
    I07_LS6 := TRUE; (*set*)
  END_IF;
  IF DT6_Init.Q THEN
    I00_WP1 := TRUE; (*set*)
  END_IF;
  DT0_Tank1(IN := I07_LS6 AND I05_LS4 AND I03_LS2 AND NOT(Stop), PT := T#3000ms);
  IF DT0_Tank1.Q THEN
    I00_WP1 := FALSE; (*reset*)
  END_IF;
  IF DT0_Tank1.Q THEN
    I01_WP2 := TRUE; (*set*)
  END_IF;
  IF DT0_Tank1.Q THEN
    I02_LS1 := TRUE; (*set*)
  END_IF;
  IF DT0_Tank1.Q THEN
    I03_LS2 := FALSE; (*reset*)
  END_IF;
  DT1_Tank2(IN := I07_LS6 AND I05_LS4 AND I02_LS1 AND NOT(Stop), PT := T#3000ms);
  IF DT1_Tank2.Q THEN
    I01_WP2 := FALSE; (*reset*)
  END_IF;
  IF DT1_Tank2.Q THEN
    I04_LS3 := TRUE; (*set*)
  END_IF;
  IF DT1_Tank2.Q THEN
    I05_LS4 := FALSE; (*reset*)
  END_IF;
  Q00_Valve1 := I04_LS3 AND I02_LS1 AND NOT(Stop);
  DT2_Tank3(IN := Q00_Valve1 AND NOT(Stop), PT := T#3000ms);
  IF DT2_Tank3.Q THEN
    I03_LS2 := TRUE; (*set*)
  END_IF;
  IF DT2_Tank3.Q THEN
    I02_LS1 := FALSE; (*reset*)
  END_IF;
  IF DT2_Tank3.Q THEN
    Q00_Valve1 := FALSE; (*reset*)
  END_IF;
  IF I04_LS3 AND I03_LS2 AND NOT(Stop) THEN
    Q01_Valve2 := TRUE; (*set*)
  END_IF;
  DT3_Tank3(IN := Q01_Valve2 AND NOT(Stop), PT := T#3000ms);
  IF DT3_Tank3.Q THEN
    I04_LS3 := FALSE; (*reset*)
  END_IF;
  IF DT3_Tank3.Q THEN
    I05_LS4 := TRUE; (*set*)
  END_IF;
  IF DT3_Tank3.Q THEN
    I06_LS5 := TRUE; (*set*)
  END_IF;
  IF DT3_Tank3.Q THEN
    I07_LS6 := FALSE; (*reset*)
  END_IF;
  IF DT3_Tank3.Q THEN
    Q01_Valve2 := FALSE; (*reset*)
  END_IF;
  IF I06_LS5 AND I05_LS4 AND I03_LS2 AND NOT(Stop) THEN
    Q03_Mix := TRUE; (*set*)
  END_IF;
  DT4_Mixer(IN := Q03_Mix AND NOT(Stop), PT := T#3000ms);
  IR2 := DT4_Mixer.Q;
  IF DT4_Mixer.Q THEN
    Q03_Mix := FALSE; (*reset*)
  END_IF;
  Q02_Valve3 := I06_LS5 AND IR2 AND NOT(Stop);
  DT5_Output(IN := Q02_Valve3 AND NOT(Stop));
  IF DT5_Output.Q THEN
    Q02_Valve3 := FALSE; (*reset*)
  END_IF;
  IF DT5_Output.Q THEN
    I06_LS5 := FALSE; (*reset*)
  END_IF;
  IF DT5_Output.Q THEN
    I07_LS6 := TRUE; (*set*)
  END_IF;
  IR3 := DT5_Output.Q;
  R_TRIG1(CLK := IR3);
  CTU0(CU := R_TRIG1.Q, R := Reset, PV := 5);
  Reset := CTU0.Q;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Liquidos1A;
  END_RESOURCE
END_CONFIGURATION
