const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const pregunta = (texto) => {
    return new Promise((resolve) => {
        rl.question(texto, (respuesta) => {
            resolve(respuesta);
        });
    });
};

const main = async () => {
    console.log("-----------------------------");
    console.log("Bienvenido a la Tienda Online");
    console.log("-----------------------------");

    let cantidadCarrito = 0;
    const impuesto = 1.19;
    const costoPorKilo = 2;
    let matriz = [];

    // Ingreso de parámetros por parte del Usuario
    cantidadCarrito = parseInt(await pregunta("¿Cuántos productos hay en su carrito de compras?: "), 10);

    // Se dimensiona una cantidad de filas en función de la cantidad de productos del carrito y 10 columnas para registrar el desglose del sistema de costos.
    matriz = Array.from({ length: cantidadCarrito }, () => Array(10).fill(0));

    for (let i = 0; i < cantidadCarrito; i++) {
        const precio = parseFloat(await pregunta(`Ingrese el precio del producto número [${i + 1}]: `));
        const cantidad = parseInt(await pregunta(`Ingrese la cantidad del producto [${i + 1}]: `), 10);
        const peso = parseFloat(await pregunta(`Escriba el peso del producto [${i + 1}] en Kilogramos: `));
        const preguntaCupon = await pregunta("¿Tiene cupon de descuento? En caso que sí tenga un cupón escriba SI, en caso contrario, presione cualquier tecla para continuar: ");

        let descuento = 0;
        if (preguntaCupon.toLowerCase() === "si") {
            const cupon = await pregunta(`Escriba el código de cupon para el descuento del producto [${i + 1}] (Puede ser: BOOTCAMP5 o BOOTCAMP10 o BOOTCAMP15): `);
            switch (cupon) {
                case "BOOTCAMP5":
                    descuento = 5;
                    break;
                case "BOOTCAMP10":
                    descuento = 10;
                    break;
                case "BOOTCAMP15":
                    descuento = 15;
                    break;
                default:
                    descuento = 0;
                    break;
            }
        }

        const tipoDespacho = parseInt(await pregunta("Despacho - Escriba 0: para retiro en tienda, 1: despacho en Región Metropolitana, 2: Regiones, 3: Fuera de Chile: "), 10);
        let costoDespacho = 0;

        switch (tipoDespacho) {
            case 0:
                costoDespacho = 0;
                break;
            case 1:
                costoDespacho = 4000;
                break;
            case 2:
                costoDespacho = 7000;
                break;
            case 3:
                costoDespacho = 30000;
                break;
            default:
                console.log("Valor ingresado no es correcto.");
                costoDespacho = 0;
                break;
        }

        let precioDescuento = precio;
        if (descuento > 0) {
            precioDescuento = precio - (precio * descuento / 100);
        }

        const precioImpuesto = precioDescuento * impuesto;

        let descuentoPorCantidad = 0;
        if (cantidad === 0) {
            descuentoPorCantidad = 0;
        } else if (cantidad > 0 && cantidad <= 2) {
            descuentoPorCantidad = (precioImpuesto * 5) / 100;
        } else if (cantidad > 2 && cantidad <= 10) {
            descuentoPorCantidad = (precioImpuesto * 10) / 100;
        } else if (cantidad > 10) {
            descuentoPorCantidad = (precioImpuesto * 15) / 100;
        }

        let costoDestino = costoDespacho;
        if (peso === 0) {
            costoDestino = costoDespacho;
        } else if (peso > 0 && peso <= 3) {
            costoDestino = costoDespacho + (500 * peso);
        } else if (peso >= 4 && peso <= 10) {
            costoDestino = costoDespacho + (600 * peso);
        } else if (peso >= 11 && peso <= 50) {
            costoDestino = costoDespacho + (650 * peso);
        } else if (peso >= 51) {
            costoDestino = costoDespacho + (690 * peso);
        }

        const precioFinal = ((precioImpuesto - descuentoPorCantidad) * cantidad) + costoDestino;

        // Ingresar desglose a las columnas de la matriz
        matriz[i] = [
            precio,
            cantidad,
            descuento,
            precioDescuento,
            impuesto,
            precioImpuesto,
            descuentoPorCantidad,
            costoDespacho,
            costoDestino,
            precioFinal
        ];
    }

    // Impresión de precio final y su desglose
    for (let i = 0; i < cantidadCarrito; i++) {
        console.log(`Producto número [${i + 1}] del carro de compra ->`);
        console.log(`|Precio ingresado: ${matriz[i][0]} |`);
        console.log(`|Cantidad: ${matriz[i][1]} |`);
        console.log(`|Descuento (cupón): ${matriz[i][2]} |`);
        console.log(`|Precio con descuento cupón: ${matriz[i][3]} |`);
        console.log(`|Impuesto aplicado: ${matriz[i][4]}% |`);
        console.log(`|Precio con impuesto: ${matriz[i][5]} |`);
        console.log(`|Descuento por cantidad: ${matriz[i][6]} |`);
        console.log(`|Costo por despacho: ${matriz[i][7]} |`);
        console.log(`|Costo final para despacho: ${matriz[i][8]} |`);
        console.log(`|Precio Final: ${matriz[i][9]} |`);
    }

    rl.close();
};

main();