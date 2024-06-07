Algoritmo SistemaCostos
	
	//Proyecto 1
	//Cohorte 15 Bootcamp Desarrollador Fullstack
	//Autor		: Rodrigo Espinoza P.
	//Fecha		: 10/06/2024
	//Versión	: 1.0
	
	Definir cantidadCarrito, cantidad, opcCupon, tipoDespacho, costoDespacho, costoPorKilo, peso, costoFinalPeso Como Entero
	Definir preguntaCupon, cupon Como Caracter
	Definir precio,precioDescuento,precioImpuesto,impuesto,descuento,costoDestino, precioFinal, descuentoPorCantidad, matriz Como Real
	
	Escribir "-----------------------------"
	Escribir "Bienvenido a la Tienda Online"
	Escribir "-----------------------------"
	
	//Asignacion de valores iniciales para las variables
	cantidadCarrito <- 0
	impuesto <- 1.19
	costoPorKilo <- 2
	
	//Ingreso de parámetros por parte del Usuario
	Escribir "¿Cuántos productos hay en su carrito de compras?:"
	Leer cantidadCarrito
	
	//Se dimensiona una cantidad de filas en función de la cantidad de productos del carrito y 10 columnas para registrar el desglose del sistema de costos.
	Dimension matriz[cantidadCarrito,10]
	
	Para i <- 1 Hasta cantidadCarrito Hacer
		
		Escribir "Ingrese el precio del producto número [" i "]: "
		Leer precio
		
		Escribir  "Ingrese la cantidad del producto [" i "]"
		Leer cantidad
		
		Escribir "Escriba el peso del producto [" i "] en Kilogramos :"
		Leer peso
		
		Escribir "¿Tiene cupon de descuento? En caso que si tenga un cupón escriba SI, en caso contrario, presione cualquier tecla para continuar:"
		Leer preguntaCupon
		
		Si preguntaCupon = "SI" O preguntaCupon = "Si" O preguntaCupon = "sI" O preguntaCupon = "si"  Entonces
			Escribir "Escriba el código de cupon para el descuento del producto [" i "] (Puede ser: BOOTCAMP5 o BOOTCAMP10 o BOOTCAMP15) : "
			Leer cupon
			
			si cupon = "BOOTCAMP5" Entonces
				opcCupon <- 1
			FinSi
			
			si cupon = "BOOTCAMP10" Entonces
				opcCupon <- 2
			FinSi
			
			si cupon = "BOOTCAMP15" Entonces
				opcCupon <- 3
			FinSi			
			
			Segun opcCupon Hacer
				caso 1:
					descuento <- 5
				caso 2:
					descuento <- 10
				caso 3:
					descuento <- 15
				De Otro Modo:
					descuento <- 0
			Fin Segun

		FinSi
		
		Escribir "Despacho - Escriba 0: para retiro en tienda, 1: despacho en Región Metropolitana, 2: Regiones, 3: Fuera de Chile:"
		Leer tipoDespacho
		
		Segun tipoDespacho Hacer
			caso 0:
				costoDespacho <- 0			
			caso 1:
				costoDespacho <- 4000
			caso 2:
				costoDespacho <- 7000
			caso 3:
				costoDespacho <- 30000
			De Otro Modo:
				Escribir "Valor ingresado no es correcto."
				costoDespacho <- 0
		Fin Segun
		
		//Aplicar el descuento al precio
		Si descuento > 0 Entonces
			precioDescuento <- precio - (precio * descuento / 100)
		FinSi
		
		//Aplicar el impuesto
		precioImpuesto <- precioDescuento * impuesto
		
		//Aplicar el descuento por cantidad
		Si cantidad = 0 Entonces
			precioImpuesto <- precioImpuesto + 0
		FinSi
		
		Si cantidad > 0 Y cantidad <= 2 Entonces
			descuentoPorCantidad <- ((precioImpuesto * 5) / 100)
		FinSi
		
		Si cantidad > 2 Y cantidad <= 10 Entonces
			descuentoPorCantidad <- ((precioImpuesto * 10) / 100)
		FinSi	
		
		Si cantidad > 11  Entonces
			descuentoPorCantidad <- ((precioImpuesto * 15) / 100)
		FinSi	
		
		//Aplicar el costo de despacho
		Si peso = 0 Entonces
			costoDestino <- costoDespacho
		FinSi
		
		si peso > 0 Y peso <= 3 Entonces
			costoDestino <- costoDespacho + (500 * peso)
		FinSi
		
		Si peso >= 4 Y peso <= 10 Entonces
			costoDestino <- costoDespacho + (600 * peso)
		FinSi
		
		Si peso >= 11 Y peso <= 50 Entonces
			costoDestino <- costoDespacho + (650 * peso)
		FinSi
		
		Si peso >= 51  Entonces
			costoDestino <- costoDespacho + (690 * peso)
		FinSi
		
		
		//Cálculo del precio final a aplicar
		precioFinal <- ((precioImpuesto - descuentoPorCantidad) * cantidad) + costoDestino
		
		//Ingresar desglose a las columnas de la matriz
		matriz[i,1] <- precio
		matriz[i,2] <- cantidad
		matriz[i,3] <- descuento
		matriz[i,4] <- precioDescuento
		matriz[i,5] <- impuesto
		matriz[i,6] <- precioImpuesto
		matriz[i,7] <- descuentoPorCantidad
		matriz[i,8] <- costoDespacho
		matriz[i,9] <- costoDestino
		matriz[i,10] <- precioFinal

	FinPara
	
	//Impresión de precio final y su desglose
	Para i = 1 Hasta cantidadCarrito Con Paso 1 Hacer
		Escribir Sin Saltar "Producto número [" i "] del carro de compra -> "
		
        Para j = 1 Hasta 10 Con Paso 1 Hacer
			Segun j Hacer
				caso 1:
					Escribir "|Precio ingresado 			: " matriz[i, j] " |"
				caso 2:
					Escribir "|Cantidad 					: " matriz[i, j] " |"					
				caso 3:
					Escribir "|Descuento (cupón) 			: " matriz[i, j] " |"
				caso 4:
					Escribir "|Precio con descuento cupón	: " matriz[i, j] " |"
				caso 5:
					Escribir "|Impuesto aplicado 			: " matriz[i, j] "% |"	
				caso 6:
					Escribir "|Precio con impuesto 		: " matriz[i, j] " |"
				caso 7:
					Escribir "|Descuento por cantidad 		: " matriz[i, j] " |"
				caso 8:
					Escribir "|Costo por despacho 			: " matriz[i, j] " |"	
				caso 9:
					Escribir "|Costo final para despacho 	: " matriz[i, j] " |"	
				caso 10:
					Escribir "|Precio Final 				: " matriz[i, j] " |"						
			Fin Segun
			
        FinPara
        Escribir ""
    FinPara
	
FinAlgoritmo
