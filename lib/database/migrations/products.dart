import 'package:vania/vania.dart';

class Products extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('products', () {
      id();
      timeStamps();
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('products');
  }
}
