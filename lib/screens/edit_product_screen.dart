import 'package:eshop/models/product.dart';
import 'package:eshop/providers/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = 'edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageURLController = TextEditingController();
  final _imageURLFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct =
      Product(id: '', title: '', description: '', price: 0, imgeUrl: '');
  var _isInit = true;

  @override
  void initState() {
    _imageURLFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  /*
  initState is called only once for a widget. didChangeDependencies may be called multiple times per widget lifecycle.
didChangeDependencies() Called when a dependency of this [State] object changes.
   */

  @override
  void didChangeDependencies() {
    if(_isInit){
      final productId = ModalRoute.of(context).settings.arguments as String;
      if(productId != null){
        _editedProduct = Provider.of<Products>(context, listen: false).findById(productId);
        _imageURLController.text = _editedProduct.imgeUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageURLController.dispose();
    _imageURLFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageURLFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _formSave() {
    final isValid = _form.currentState.validate();
    if(!isValid){
      return;
    }
    _form.currentState.save();
    if(_editedProduct.id != null){
      // update
      Provider.of<Products>(context, listen: false).updateProduct(_editedProduct.id, _editedProduct);
    }else{
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add / Edit Product'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: () => _formSave()),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _editedProduct.title,
                decoration: InputDecoration(
                  labelText: "Title",
                ),
                validator: (value) {
                  if(value.isEmpty){
                    return 'The field cannot be empty';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onSaved: (value) => {
                  _editedProduct = Product(
                      id: _editedProduct.id,
                      title: value,
                      description: _editedProduct.description,
                      price: _editedProduct.price,
                      imgeUrl: _editedProduct.imgeUrl),
                },
              ),
              TextFormField(
                initialValue: _editedProduct.price.toString(),
                decoration: InputDecoration(
                  labelText: "Price",
                ),
                validator: (value) {
                  if(value.isEmpty){
                    return 'The field cannot be empty';
                  }
                  if(double.tryParse(value) == null){
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onSaved: (value) => {
                  _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: double.parse(value),
                      imgeUrl: _editedProduct.imgeUrl),
                },
              ),
              TextFormField(
                initialValue: _editedProduct.description,
                decoration: InputDecoration(
                  labelText: "Description",
                ),
                maxLines: 3,
                validator: (value) {
                  if(value.isEmpty){
                    return 'The field cannot be empty';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                onSaved: (value) => {
                  _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      description: value,
                      price: _editedProduct.price,
                      imgeUrl: _editedProduct.imgeUrl),
                },
              ),
              // image
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                    width: 100,
                    child: _imageURLController.text.isEmpty
                        ? Text('Enter a URL')
                        : Image.network(_imageURLController.text),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Image URL",
                      ),
                      validator: (value) {
                        if(value.isEmpty){
                          return 'The field cannot be empty';
                        }
                        if(!value.endsWith('.png') && !value.endsWith('.jpg') && !value.endsWith('.jpeg')){
                          return 'Please enter a valid URL';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      controller: _imageURLController,
                      focusNode: _imageURLFocusNode,
                      onSaved: (value) => {
                        _editedProduct = Product(
                            id: _editedProduct.id,
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imgeUrl: value),
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
