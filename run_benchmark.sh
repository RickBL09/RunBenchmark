
echo "====================================="
echo "    EJECUTANDO BENCHMARK"
echo "====================================="

languages=("java" "javascript" "python" "c" "csharp")

for lang in "${languages[@]}"; do
    echo ""
    echo "Ejecutando $lang..."
    
    cd /app/codes/$lang
    
    docker build -t benchmark-$lang .
    echo "Contenedor $lang construido."

    time=$(docker run --rm benchmark-$lang)
    
    echo "Tiempo de ejecución en $lang: ${time} ms"
    
    cd /app/codes
done

echo ""
echo "Benchmark completado."
echo "====================================="
