import 'di_container.dart';

var imagens = DiContainer.resolve<ImagensService>();

class ImagensService {
  final produtoPng = "png/produto.png";
}
