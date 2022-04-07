# Automation_Process_Control_Test

2nd Term Test, Codesys File, OpenPLC File and Docuementation

# Documentacion: 

## Diseño: 

Una vez leídos y entendidos los requerimientos del gerente de la empresa, fue posible iniciar el proceso de diseño de la planta, y conocer cuales iban a ser todos los componentes y así mismo lograrlos clasificar como sensores y actuadores necesarios para esto.
Primero se realizó un bosquejo en un software de dibujo, para plasmar la información dada por el cliente y la secuencia de pasos necesarios para lograr este proceso.

![Process1](https://user-images.githubusercontent.com/57844238/162121442-0df5d6d6-3bfe-4b89-a295-9f0edcba9873.png)


En el bosquejo logramos identificar que la planta es simétrica en su comportamiento, por lo tanto, solamente se graficó una sección, y con esta nos fue más que suficiente para identificar el comportamiento de toda la planta.

## Desarrollo: 

Con el diseño ya hecho, se inició la fase de desarrollo en un software especializado para automatizar procesos, el cual es CODESYS, donde por medio de programación ladder se pudo simular el sistema de forma lógica, cumpliendo con la secuencia de pasos identificada en el proceso de diseño. 
Esto se logró gracias al uso de contactos normalmente abiertos, contactos normalmente cerrados, timer o temporizador, y finalmente un contador. 
Gracias al timer pudimos tener una simulación secuencial, para no generar ningún tipo de inconveniente al tener procesos simultáneos, y una vez cumplían su tiempo, generaban una acción para continuar con el proceso.
Y para controlar las iteraciones necesarias por la compañía para lograr su meta diaria de producción, usamos un Contador ascendente para no excederse de los 20.000L de producto al día.

## Implementación: 

Ya en la fase de implementación, se declararon las variables con base a su funcionalidad, como se encuentra documentado en el código en CODESYS. 

```bash
VAR_GLOBAL
	Start: BOOL; // Start the system
	Stop: BOOL; // Emergency Stop 
	
	// Inputs
	I00_WP1: BOOL; // WaterPump 1 
	I01_WP2: BOOL; // Waterpump 2
	I02_LS1: BOOL; // Status Level Sensor Tank 1 (Full)
	I03_LS2: BOOL; // Status Level Sensor Tank 1 (Empty)
	I04_LS3: BOOL; // Status Level Sensor Tank 2 (Full)
	I05_LS4: BOOL; // Status Level Sensor Tank 2 (Empty)
	I06_LS5: BOOL; // Status Level Sensor Tank 3 (Full)
	I07_LS6: BOOL; // Status Level Sensor Tank 3 (Empty)
	
	//Outputs
	Q00_Valve1: BOOL; // Valve Tank 1 
	Q01_Valve2: BOOL; // Valve Tank 2 
	Q02_Valve3: BOOL; // Valve Tank 3
	Q03_Mix: BOOL; // Mixed Liquid 
	
	// Timers
	DT0_Tank1: TON; // Delay time to fill tank 1 
	DT1_Tank2: TON; // Delay time to fill tank 2 
	DT2_Tank3: TON; // Delay time to fill tank 3 from tank 1
	DT3_Tank3: TON; // Delay time to fill tank 3 from tank 2
	DT4_Mixer: TON; // Delay time to mix the liquids (100 segs)
	DT5_Output: TON; // Delay time to release the mix
	DT6_Init: TON; // Delay time to initial conditions (LS2, LS4, LS6 are ON)
	
	// Internal Relays
	IR1: BOOL; // Internal Relay
	IR2: BOOL; // Internal Relay to mark mix process as completed
	IR3: BOOL; // Internal Relay to count iterations 
	Reset: BOOL; // Restart
	
	// Counter
	CI: CTU; // Incremental Counter
	
	// Time
	ET_DT0_Tank1: TIME; // Varible to show time on Visualization
	ET_DT1_Tank2: TIME; // Varible to show time on Visualization
	ET_DT2_Tank3: TIME; // Varible to show time on Visualization
	ET_DT3_Tank3: TIME; // Varible to show time on Visualization
	ET_DT4_Mixer: TIME; // Varible to show time on Visualization
	ET_DT5_Output: TIME; // Varible to show time on Visualization
	ET_DT6_Init: TIME;// Varible to show time on Visualization
	ET_CI_Init: WORD;// Varible to show iteration on Visualization
	
END_VAR
```

Se determinó que las variables de entrada correspondían a los sensores ubicados en los tanques de recolección de los líquidos, y las salidas hacían referencia a las válvulas que habilitaban el flujo de líquido de estos tanques. Se asociaron los temporizadores a los tiempos de acción de cada tarea.
 
![ActivitiesDiagram](https://user-images.githubusercontent.com/57844238/162121431-c0381733-2d8d-42d9-acf9-e68736e7769a.png)

Ya con el diagrama de actividades se realizo la conexion de circuitos necesarios para el funcionamiento del proceso, para esto se usaron leds como indicadores del estado de los tanques y como indicador del funcionamiento de la mezcladora, servo motores para la simulacion de valvulas de salida de los tanques.

El diagrama de conexiones representa el circuito implementado fisicamente


![Diagrama del circuito](https://user-images.githubusercontent.com/57844238/162249726-601db0ca-1b0a-4bf0-9ff4-23c0863aaf7a.png)

## Autores

Brayan David Acosta Gomez  
Johan Nicolas Imbachi Niño  
Valentina Osorio Lopez  
