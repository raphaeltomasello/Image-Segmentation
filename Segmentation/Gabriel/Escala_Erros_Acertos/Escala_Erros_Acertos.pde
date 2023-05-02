PImage imgSegmentada;
PImage imgGroundTruth;
PImage imgComparacao;
ArrayList<PVector> falsosPositivos = new ArrayList<PVector>();
ArrayList<PVector> falsosNegativos = new ArrayList<PVector>();

void setup() {
  size(600, 600);
  
  // Carrega a imagem segmentada e o ground truth
  imgSegmentada = loadImage("ObjetoBranco.jpg");
  imgGroundTruth = loadImage("Raphael.jpg");
  
  // Verifica as dimensões das imagens
  if (imgSegmentada.width != imgGroundTruth.width || imgSegmentada.height != imgGroundTruth.height) {
    println("Erro: as imagens possuem dimensões diferentes");
    exit();
  }
  
  // Cria uma imagem para armazenar o resultado da comparação
  imgComparacao = createImage(imgSegmentada.width, imgSegmentada.height, RGB);
  
  // Percorre as imagens pixel a pixel para comparar
  for (int x = 0; x < imgSegmentada.width; x++) {
    for (int y = 0; y < imgSegmentada.height; y++) {
      // Obtem a cor dos pixels na imagem segmentada e no ground truth
      color corSegmentada = imgSegmentada.get(x, y);
      color corGroundTruth = imgGroundTruth.get(x, y);
      
      // Verifica se os pixels são iguais (true positive) ou diferentes (false positive ou false negative)
      if (corSegmentada == corGroundTruth) {
        // Se forem iguais, seta a cor branca na imagem de comparação
        imgComparacao.set(x, y, color(255));
      } else {
        // Se forem diferentes, seta a cor vermelha na imagem de comparação e adiciona à lista de falsos positivos ou falsos negativos
        imgComparacao.set(x, y, color(255, 0, 0));
        if (corSegmentada == color(255)) {
          falsosPositivos.add(new PVector(x, y));
        } else {
          falsosNegativos.add(new PVector(x, y));
        }
      }
    }
  }
  
  // Exibe as imagens resultantes
  image(imgSegmentada, 0, 0);
  image(imgGroundTruth, imgSegmentada.width + 10, 0);
  image(imgComparacao, 0, imgSegmentada.height + 10);
  
  // Imprime o número de falsos positivos e falsos negativos encontrados
  println("Falsos positivos: " + falsosPositivos.size());
  println("Falsos negativos: " + falsosNegativos.size());
}
