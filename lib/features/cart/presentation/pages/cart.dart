import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:framework_challenge/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:framework_challenge/features/cart/presentation/pages/checkout_pdf.dart';
import 'package:framework_challenge/features/cart/presentation/widgets/cart_list.dart';
import 'package:framework_challenge/features/cart/presentation/widgets/cart_total.dart';
import 'package:framework_challenge/features/login/presentation/bloc/get_logged_bloc.dart';
import 'package:framework_challenge/features/login/presentation/pages/login.dart';
import 'package:framework_challenge/shared/widgets/body.dart';
import 'package:framework_challenge/shared/widgets/button.dart';
import 'package:framework_challenge/shared/widgets/space.dart';
import 'package:framework_challenge/shared/widgets/toast.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import 'dart:io';

import 'package:pdf/widgets.dart' as pw;

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    const _crossAlign = CrossAxisAlignment.stretch;

    return Body(
      child: Column(
        crossAxisAlignment: _crossAlign,
        children: [
          const VSpace(16),
          _count(),
          const VSpace(16),
          const CartList(),
          const VSpace(16),
          const CartTotal(),
          const VSpace(24),
          BlocBuilder<CartCubit, List<CartObject>>(
            builder: (context, cartState) {
              var _subtotal = 0.0;
              var _frete = 12.0;
              var _total = 0.0;

              for (var item in cartState) {
                _subtotal += item.total;
              }

              _total = _subtotal + _frete;

              return BlocBuilder<GetLoggedBloc, GetLoggedState>(
                builder: (context, loggedState) {
                  if (loggedState is GetLoggedLoaded) {
                    if (loggedState.logged) {
                      var _name = loggedState.user.username;

                      return StretchButton(
                        text: 'Checkout',
                        function: () async {
                          final pdf = pw.Document();

                          _getPdf(
                            pdf,
                            _name,
                            _subtotal,
                            _frete,
                            _total,
                            cartState,
                          );

                          var output = await getApplicationDocumentsDirectory();

                          final file = File('${output.path}/checkout.pdf');

                          file.writeAsBytesSync(List.from(await pdf.save()));

                          var bytes = file.readAsBytesSync();
                          var bytedata = ByteData.view(bytes.buffer);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutPdf(
                                pathPDF: file.path,
                                fileBytes: bytedata,
                              ),
                            ),
                          );

                          context.read<CartCubit>().onListChange(
                            [],
                            CartObject(
                              id: -1,
                              imagePath: "",
                              name: "",
                              quantity: 0,
                              value: 0,
                              total: 0,
                            ),
                          );
                        },
                      );
                    } else {
                      return StretchButton(
                        text: 'Checkout',
                        function: () {
                          CustomToast().errorToast(
                            "Faça o login primeiro!",
                            ToastGravity.BOTTOM,
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                      );
                    }
                  }

                  return const SizedBox();
                },
              );
            },
          ),
          const VSpace(24),
        ],
      ),
    );
  }

  _getPdf(
    pw.Document pdf,
    String name,
    double subtotal,
    double frete,
    double total,
    List<CartObject> cart,
  ) {
    return pdf.addPage(
      pw.MultiPage(
        margin: const pw.EdgeInsets.symmetric(horizontal: 40),
        build: (context) => <pw.Widget>[
          pw.Column(
            children: [
              _pdfHeader(),
              _pdfInformation(name),
              _pdfProductList(context, cart),
              _pdfResult(frete, total),
            ],
          ),
        ],
      ),
    );
  }

  _pdfResult(frete, total) {
    return pw.Row(
      children: [
        pw.Expanded(
          flex: 1,
          child: pw.Container(
            decoration: const pw.BoxDecoration(
              border: pw.Border(
                top: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
                bottom: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
                left: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
                right: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
              ),
            ),
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(2),
                  child: pw.Text(
                    'Frete',
                    style: const pw.TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: pw.Text(
                    "R\$${frete.toStringAsFixed(2).replaceAll('.', ',')}",
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        pw.Expanded(
          flex: 3,
          child: pw.Container(
            decoration: const pw.BoxDecoration(
              border: pw.Border(
                top: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
                bottom: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
                left: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
                right: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
              ),
            ),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(4),
                  child: pw.Text(
                    "Total R\$${total.toStringAsFixed(2).replaceAll('.', ',')}",
                    style: const pw.TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _pdfProductList(pw.Context context, List<CartObject> cart) {
    return pw.Table.fromTextArray(
      context: context,
      rowDecoration: const pw.BoxDecoration(
          border: pw.Border(
        top: pw.BorderSide(
          color: PdfColors.black,
          width: 1,
        ),
        bottom: pw.BorderSide(
          color: PdfColors.black,
          width: 1,
        ),
        left: pw.BorderSide(
          color: PdfColors.black,
          width: 1,
        ),
        right: pw.BorderSide(
          color: PdfColors.black,
          width: 1,
        ),
      )),
      cellAlignments: {
        0: pw.Alignment.center,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.centerRight,
      },
      headers: <String>['PRODUTO', 'QUANTIDADE', 'VALOR UNITÁRIO', 'TOTAL'],
      data: cart
          .map(
            (value) => <String>[
              value.name,
              value.quantity.toString(),
              "R\$${value.value.toStringAsFixed(2).replaceAll('.', ',')}",
              "R\$${value.total.toStringAsFixed(2).replaceAll('.', ',')}"
            ],
          )
          .toList(),
    );
  }

  _pdfInformation(String name) {
    return pw.Row(
      children: [
        pw.Expanded(
          flex: 3,
          child: pw.Container(
            decoration: const pw.BoxDecoration(
              border: pw.Border(
                top: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
                bottom: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
                left: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
                right: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
              ),
            ),
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(2),
                  child: pw.Text(
                    'NOME',
                    style: const pw.TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: pw.Text(
                    name,
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.Border(
              top: pw.BorderSide(
                color: PdfColors.black,
                width: 1,
              ),
              bottom: pw.BorderSide(
                color: PdfColors.black,
                width: 1,
              ),
              left: pw.BorderSide(
                color: PdfColors.black,
                width: 1,
              ),
              right: pw.BorderSide(
                color: PdfColors.black,
                width: 1,
              ),
            )),
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(2),
                  child: pw.Text(
                    'DATA',
                    style: const pw.TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: pw.Text(
                    DateFormat("dd/MM/yyyy").format(DateTime.now()),
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _pdfHeader() {
    return pw.Row(
      children: [
        pw.Expanded(
          flex: 4,
          child: pw.Container(
            decoration: const pw.BoxDecoration(
              border: pw.Border(
                top: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
                bottom: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
                left: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
                right: pw.BorderSide(
                  color: PdfColors.black,
                  width: 1,
                ),
              ),
            ),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(4),
                  child: pw.Text(
                    'RECIBO',
                    style: const pw.TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _count() {
    const _weight = FontWeight.w700;
    const _size = 24.0;

    return const Text(
      "Seu Carrinho",
      style: TextStyle(
        fontWeight: _weight,
        fontSize: _size,
      ),
    );
  }
}
