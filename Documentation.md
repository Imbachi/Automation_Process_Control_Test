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

Ya en la fase de implementación, se declararon las variables con base a su funcionalidad, como se encuentra documentado en el código en CODESYS. Se determinó que las variables de entrada correspondían a los sensores ubicados en los tanques de recolección de los líquidos, y las salidas hacían referencia a las válvulas que habilitaban el flujo de líquido de estos tanques. Se asociaron los temporizadores a los tiempos de acción de cada tarea.
 
![ActivitiesDiagram](https://user-images.githubusercontent.com/57844238/162121431-c0381733-2d8d-42d9-acf9-e68736e7769a.png)



