import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocation/constants.dart';
import 'package:geolocation/model/visitor_info_model.dart';
import 'package:geolocation/widgets/drop_down.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/full_screen_loader.dart';
import '../../../widgets/text_button.dart';
import '../../../widgets/textfielddecoration.dart';
import 'add_visitor_model.dart';

class AddVisitor extends StatefulWidget {
  final String visitorid;
  const AddVisitor({super.key, required this.visitorid});

  @override
  State<AddVisitor> createState() => _AddVisitorState();
}

class _AddVisitorState extends State<AddVisitor> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddVisitorModel>.reactive(
        viewModelBuilder: () => AddVisitorModel(),
        onViewModelReady: (model) =>
            model.initialise(context, widget.visitorid),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: model.isEdit == true
                  ? Text(model.visitordata.name.toString())
                  : const Text("Visitor's Form"),
            ),
            body: fullScreenLoader(
                loader: model.isBusy,
                child: SingleChildScrollView(
                  child: Form(
                    key: model.formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: model.firstnamecontroller,
                            decoration: AppInputDecorations.textFieldDecoration(
                              labelText: 'Name',
                              hintText: 'John Snow',
                              prefixIcon: Icons.person,
                            ),
                            onChanged: model.setSelectedName,
                            validator: model.validateName,
                            // When the field is submitted, move focus to the next field
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: model.agecontroller,
                            keyboardType: TextInputType.number,

                            decoration: AppInputDecorations.textFieldDecoration(
                              labelText: 'Age',
                              hintText: '12',
                              prefixIcon: Icons.person_sharp,
                            ),
                            onChanged: model.setage,
                            validator: model.validateage,
                            // Add validation logic and controller as needed
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Address',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: model.villagecontroller,
                            decoration: AppInputDecorations.textFieldDecoration(
                                labelText: 'Address Line1',
                                hintText: 'address',
                                prefixIcon: Icons.location_on_outlined),
                            onChanged: model.setaddressline,
                            validator: model.validateaddress,
                            // Add validation logic and controller as needed
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: model.talukacontroller,
                            decoration: AppInputDecorations.textFieldDecoration(
                                labelText: 'Address Line2',
                                hintText: 'address',
                                prefixIcon: Icons.location_on_outlined),
                            onChanged: model.setaddressline2,
                            validator: model.validateaddress,
                            // Add validation logic and controller as needed
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: model.pincodecontroller,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      AppInputDecorations.textFieldDecoration(
                                          labelText: 'Pincode',
                                          hintText: '001011',
                                          prefixIcon: Icons.numbers_sharp),
                                  onChanged: model.setpinocde,
                                  validator: model.validatepincode,
                                  // Add validation logic and controller as needed
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: model.statecontroller,
                                  decoration:
                                      AppInputDecorations.textFieldDecoration(
                                          labelText: 'State',
                                          hintText: 'maharashtra',
                                          prefixIcon:
                                              Icons.location_on_outlined),
                                  onChanged: model.setstate,

                                  // Add validation logic and controller as needed
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Contact',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: model.whatsappcontroller,
                            keyboardType: TextInputType.number,
                            decoration: AppInputDecorations.textFieldDecoration(
                                labelText: 'WhatsApp Number',
                                hintText: '0123456789',
                                prefixIcon: FontAwesome.whatsapp),
                            onChanged: model.setwhatsapp,
                            validator: model.validateMobileNumber,
                            // Add validation logic and controller as needed
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: model.emailcontroller,
                            decoration: AppInputDecorations.textFieldDecoration(
                                labelText: 'Email',
                                hintText: 'example@gmail.com',
                                prefixIcon: Icons.email),
                            onChanged: model.setemail,
                            validator: model.validateemail,
                            // Add validation logic and controller as needed
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Professional Details',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: model.comanynamecontroller,
                            decoration: AppInputDecorations.textFieldDecoration(
                                labelText: 'Comapany Name',
                                hintText: 'Apple',
                                prefixIcon: Icons.factory),
                            onChanged: model.setcomapany,
                            validator: model.validateComapny,
                            // Add validation logic and controller as needed
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: model.designationcontroller,
                            decoration: AppInputDecorations.textFieldDecoration(
                                labelText: 'Designation',
                                hintText: 'Director',
                                prefixIcon: Icons.person_pin_outlined),
                            onChanged: model.setdesignation,
                            validator: model.validatedesignation,
                            // Add validation logic and controller as needed
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CdropDown(
                            dropdownButton: DropdownButtonFormField<Product>(
                              isExpanded: true,
                              // Replace null with the selected value if needed
                              decoration: const InputDecoration(
                                labelText: 'Product',
                              ),
                              hint: const Text('Select Product'),
                              items: model.productList.map((val) {
                                return DropdownMenuItem<Product>(
                                  value: val,
                                  child: AutoSizeText(val.productName ?? ""),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  model.addProduct(
                                      value); // Add the selected item's productName to the products list
                                }
                              },
                            ),
                          ),
                          (model.products.isEmpty)
                              ? const SizedBox()
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SizedBox(
                                    width: getWidth(
                                        context), // Set your desired width
                                    child: DataTable(
                                      columnSpacing: 22.0,
                                      border: TableBorder.all(width: 0.5),
                                      columns: const [
                                        DataColumn(
                                          label: Text(
                                            'Product Name',
                                            style: TextStyle(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text('Description'),
                                        ),
                                        DataColumn(
                                          label: Text('Delete'),
                                          numeric: false,
                                        ),
                                      ],
                                      rows: List<DataRow>.generate(
                                        model.products.length,
                                        (int index) => DataRow(
                                          cells: [
                                            DataCell(Text(
                                              model.products[index].productName
                                                  .toString(),
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              maxLines: 2,
                                            )),
                                            DataCell(Text(
                                              model.products[index].description
                                                  .toString(),
                                              maxLines: 2,
                                            )),
                                            DataCell(IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Confirm Delete'),
                                                      content: const Text(
                                                          'Are you sure you want to delete this entry?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              'Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            // Perform the delete operation
                                                            model.deleteVisitor(
                                                                index);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              'Delete'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              icon: const Icon(Icons.delete),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            maxLines: 2,
                            controller: model.feedbackcontroller,
                            decoration: AppInputDecorations.textFieldDecoration(
                                labelText: 'Feedback',
                                hintText: 'feedback',
                                prefixIcon: Icons.feedback),
                            onChanged: model.setfeedback,

                            // Add validation logic and controller as needed
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CtextButton(
                                onPressed: () => model.onSaved(context),
                                text: 'Save',
                              ),
                              CtextButton(
                                text: 'Cancel',
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                context: context)));
  }
}
