echo "====================================="
echo "    EJECUTANDO BENCHMARK"
echo "====================================="

languages=("java" "javascript" "python" "c" "go")

# Imprimir cabecera de la tabla
echo -e "Lenguaje\t\tTiempo de ejecución (ms)"

for lang in "${languages[@]}"; do
    echo ""
    echo "Ejecutando $lang..."
    
    cd /app/codes/$lang
    
    # Construir la imagen sin mostrar la salida en la terminal
    docker build -t benchmark-$lang . > /dev/null 2>&1
    echo "Contenedor $lang construido."

    # Usar "time" para medir el tiempo y extraer el tiempo de ejecución en milisegundos
    execution_time=$( { time docker run --rm benchmark-$lang ;} 2>&1 | grep real | awk '{print $2}' | sed 's/m/*60+/g' | bc)

    # Mostrar el tiempo en milisegundos (multiplicando por 1000 si es necesario)
    execution_time_ms=$(echo "$execution_time * 1000" | bc)
    
    # Imprimir el resultado en la tabla
    echo -e "$lang\t\t$execution_time_ms ms"
    
    cd /app/codes
done

echo ""
echo "Benchmark completado."
echo "====================================="
