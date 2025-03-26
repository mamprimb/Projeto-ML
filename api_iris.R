#* @apiTitle API de Regressão Logistica com o dataset iris
#* @param Petal.Length
#* @param Sepal.Length
#* @param Petal.Width
#* @param Sepal.Width
#* @get /prever
function(Petal.Length, Sepal.Length, Petal.Width, Sepal.Width) {
  Petal.Length <- as.numeric(Petal.Length)
  Sepal.Length <- as.numeric(Sepal.Length)
  Petal.Width <- as.numeric(Petal.Width)
  Sepal.Width <- as.numeric(Sepal.Width)
  if(is.na(Petal.Length) || is.na(Sepal.Length) || is.na(Petal.Width) || is.na(Sepal.Width)) {
    return(list(error = "Parâmetro inválido"))
  }
  
  dados <- data.frame(Sepal.Length,
                      Sepal.Width,
                      Petal.Length,
                      Petal.Width)
  prob <- predict(modelo_log, newdata = dados, type = "response")
  classe_prevista <- ifelse(prob > 0.5, "versicolor", "setosa")
  
  return(classe_prevista = classe_prevista)
} 
