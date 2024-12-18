import 'dart:io';
import 'package:vania/vania.dart';
import 'customers.dart';
import 'vendors.dart';
import 'products.dart';
import 'orders.dart';
import 'orderitems.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();

  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }

  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
    await Customers().up();
    await Vendors().up();
    await Products().up();
    await Orders().up();
    await Orderitems().up();
  }

  dropTables() async {
    await Orderitems().down();
    await Orders().down();
    await Products().down();
    await Vendors().down();
    await Customers().down();
  }
}
