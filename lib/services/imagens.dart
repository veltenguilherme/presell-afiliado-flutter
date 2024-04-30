import 'di_container.dart';

var imagens = DiContainer.resolve<ImagensService>();

class ImagensService {
  final produtoPng = "png/produto.png";
  final requiredSvg = "assets/svg/required-field.svg";
  final textTypeSvg = "assets/svg/text_type.svg";
}
