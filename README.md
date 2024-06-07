# Sistema de Costos
## Proyecto 1 - Cohorte 15 Bootcamp Desarrollador Fullstack
### Autor: Rodrigo Espinoza P.
### Fecha: 10/06/2024
### Versión: 1.0
## 
### Descripción
El algoritmo Sistema de Costos es una aplicación interactiva que permite calcular el costo final de los productos en un carrito de compras en Pseudo Código, incluyendo descuentos por cupón, impuestos y costos de despacho. El usuario ingresa la cantidad de productos en el carrito, y para cada producto proporciona el precio, cantidad, peso, y opcionalmente un cupón de descuento. El algoritmo calcula el costo final de cada producto y proporciona un desglose detallado de los costos. Adicionalmente, se incluye una versión del algoritmo en Node.js para ejecutar en la consola (con Node.Js instalado en el equipo donde se desea ejecutar).
El objetivo del ejercicio es aplicar los conocimientos relacionados a operaciones aritméticas, comparaciones, blucles, arreglos (dimensionales y/o bidimensionales) y el uso de Git + GitHub.

### Variables
+ cantidadCarrito (Entero): Cantidad de productos en el carrito de compras.
+ cantidad (Entero): Cantidad de unidades de un producto.
+ opcCupon (Entero): Opción del cupón de descuento.
+ tipoDespacho (Entero): Tipo de despacho seleccionado.
+ costoDespacho (Entero): Costo del despacho.
+ costoPorKilo (Entero): Costo por kilogramo del producto.
+ peso (Entero): Peso del producto en kilogramos.
+ costoFinalPeso (Entero): Costo final basado en el peso.
+ preguntaCupon (Caracter): Respuesta del usuario sobre si tiene cupón de descuento.
+ cupon (Caracter): Código del cupón de descuento.
+ precio (Real): Precio del producto.
+ precioDescuento (Real): Precio del producto después de aplicar el descuento del cupón.
+ precioImpuesto (Real): Precio del producto después de aplicar el impuesto.
+ impuesto (Real): Factor de impuesto aplicado al producto. En este caso, no será ingresado por el usuario y estará como una variable global con el **19% de IVA**
+ descuento (Real): Descuento aplicado al producto.
+ costoDestino (Real): Costo del despacho final.
+ precioFinal (Real): Precio final del producto incluyendo todos los costos y descuentos.
+ descuentoPorCantidad (Real): Descuento aplicado por la cantidad de productos.
+ matriz (Real[][]): Matriz que contiene el desglose de costos para cada producto.
+ Funcionalidad
+ Inicialización: Se asignan valores iniciales a las variables del sistema, incluyendo el factor de impuesto y el costo por kilogramo.

**Ingreso de Datos:** Se solicita al usuario la cantidad de productos en su carrito de compras y se inicializa una matriz para almacenar los detalles de cada producto.

**Ingreso de Detalles del Producto:** Para cada producto en el carrito, se solicita al usuario:

+ Precio del producto.
+ Cantidad de unidades.
+ Peso del producto en kilogramos.
+ Si tiene un cupón de descuento y el código del cupón.

> Cálculo de Descuentos:

+ Descuento basado en el cupón. Es **importante destacar** que los valores admitidos son los códigos de cupón **BOOTCAMP5** (para 5 % de descuento), **BOOTCAMP10** (para 10% de descuento) y **BOOTCAMP15** (para 15% de descuento).
+ Descuento por cantidad de productos.
+ Cálculo de Impuestos: Se aplica el factor de impuesto al precio del producto después de aplicar los descuentos.

**Cálculo de Costos de Despacho:** Dependiendo del tipo de despacho y el peso del producto, se calculan los costos de envío.

**Cálculo del Precio Final:** Se calcula el precio final del producto incluyendo todos los descuentos, impuestos y costos de despacho.

**Almacenamiento en Matriz:** Los detalles y costos finales de cada producto se almacenan en la matriz.

**Desglose e Impresión de Resultados:** Se imprime un desglose detallado de los costos para cada producto en el carrito.

# Ejecución
> Para ejecutar el archivo SistemaCostos.psc:

+ Clona este repositorio en tu máquina local.
+ Abre el archivo SistemaCostos.psc en el programa PSEint.
+ Presionar el botón de ejecución.
+ Ingresar los valores solicitados en la consola.
  
> Para ejecutar el algoritmo con el archivo sistemaCostos.js, sigue estos pasos:

+ Clona este repositorio en tu máquina local.
+ Abre el archivo sistemaCostos.js en un editor de texto.
+ Asegúrate de tener Node.js instalado en tu sistema.
+ Abre una terminal y navega al directorio donde se encuentra el archivo sistemaCostos.js y ejecutar con el comando "node sistemaCostos.js".
