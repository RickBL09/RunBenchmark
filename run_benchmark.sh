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
    
    docker build -t benchmark-$lang . > /dev/null 2>&1
    echo "Contenedor $lang construido."

    # Obtener el tiempo de ejecución en milisegundos
    time=$(docker run --rm benchmark-$lang)
    
    # Imprimir el tiempo de ejecución en la tabla
    echo -e "$lang\t\t$time"
    
    cd /app/codes
done

echo ""
echo "Benchmark completado."
echo "====================================="
