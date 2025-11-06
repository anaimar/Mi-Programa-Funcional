-- | Módulo: Transacciones
-- | Tema: Paso de una función como parámetro (Funciones de Orden Superior) en Haskell.
-- | Descripción: Este programa demuestra cómo una función (aplicarTasa) puede recibir otra
-- |              función (Tasa) como argumento para aplicar una lógica de negocio
-- |              (interés o comisión) de forma dinámica.
-- | Creado por: Gemini AI (Adaptación del ejemplo de la Fábrica de Transacciones).

--------------------------------------------------------------------------------
-- 1. Definición de Tipos
--------------------------------------------------------------------------------

-- | Tasa es un alias de tipo para una función que toma un 'Double' (monto) y
-- | devuelve un 'Double' (monto modificado).
type Tasa = Double -> Double

--------------------------------------------------------------------------------
-- 2. Funciones de Orden Superior (La función que recibe otra función)
--------------------------------------------------------------------------------

-- | aplicarTasa
-- | Recibe una función de tipo 'Tasa' y un 'Double' (monto base).
-- | Aplica la función 'tasaFuncion' al 'monto' para calcular el valor final.
-- | Es el núcleo del ejemplo, mostrando cómo una función se usa como parámetro.
aplicarTasa :: Tasa -> Double -> Double
aplicarTasa tasaFuncion monto = tasaFuncion monto


--------------------------------------------------------------------------------
-- 3. Funciones de Tasa Específicas (Las funciones que se pasan como parámetros)
--------------------------------------------------------------------------------

-- | interesInversion
-- | Función que calcula una tasa de interés del 5% sobre el monto.
-- | Se usa para simular un depósito o inversión.
interesInversion :: Double -> Double
interesInversion monto = monto * 1.05

-- | comisionRetiro
-- | Función que aplica una comisión fija de $1.50 por cualquier retiro.
-- | Se usa para simular la comisión de un cajero.
comisionRetiro :: Double -> Double
comisionRetiro monto = monto - 1.50

--------------------------------------------------------------------------------
-- 4. Función Principal (main)
--------------------------------------------------------------------------------

-- | main
-- | Punto de entrada del programa. Demuestra las llamadas a 'aplicarTasa'
-- | pasando diferentes funciones como argumento.
main :: IO ()
main = do
    let montoBase = 1000.0
    
    putStrLn "========================================="
    putStrLn "   FÁBRICA DE TRANSACCIONES (HASKELL)    "
    putStrLn "========================================="
    putStrLn $ "Monto Base Inicial: $" ++ show montoBase
    putStrLn "-----------------------------------------"

    -- ** DEMOSTRACIÓN 1: Usando la función 'interesInversion' **
    -- La función 'interesInversion' se pasa como primer parámetro.
    let montoConInteres = aplicarTasa interesInversion montoBase
    putStrLn $ "Operación: Depósito con Interés (5%)"
    putStrLn $ "Función utilizada: interesInversion"
    putStrLn $ "Resultado Final: $" ++ show montoConInteres
    
    putStrLn "-----------------------------------------"

    -- ** DEMOSTRACIÓN 2: Usando la función 'comisionRetiro' **
    -- La función 'comisionRetiro' se pasa como primer parámetro.
    let montoConComision = aplicarTasa comisionRetiro montoBase
    putStrLn $ "Operación: Retiro con Comisión ($1.50)"
    putStrLn $ "Función utilizada: comisionRetiro"
    putStrLn $ "Resultado Final: $" ++ show montoConComision
    
    putStrLn "-----------------------------------------"

    -- ** DEMOSTRACIÓN 3: Usando una función anónima (Lambda) **
    -- Definimos la lógica de la función directamente en el llamado con '\m -> ...'
    let montoConCargoAnonimo = aplicarTasa (\m -> m * 0.90) montoBase
    putStrLn $ "Operación: Cargo por Servicio (Lambda 10%)"
    putStrLn $ "Función utilizada: \\m -> m * 0.90"
    putStrLn $ "Resultado Final: $" ++ show montoConCargoAnonimo

    putStrLn "========================================="
