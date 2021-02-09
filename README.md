# eshop

## Flutter Provider

1. Install Flutter Provider package.
2. Wrap the component with ChangeNotifierProvider.
3. Setup listener using: Provider.of<Products>(context).
4. Get data from any where using: Provider.of<Products>(context).items.

## Http Request

1. GET -> Fetch data
2. POST -> Store data
3. PATCH -> Update data
4. PUT -> Replace data
5. DELETE -> Delete data

## FutureBuilder
Use future builder to render widgets which needs to be fetched from web server. (eg. all products)

```dart 
    FutureBuilder(
        future: // a API calls for fetching of data
        builder: (ctx, dataSnapshot) {
            if(dataSnapshot.connectionState == ConnectionState.waiting){
                // Progress indicator
            }
            else{
                if(dataSnapshot.error !=  null){
                    // error handle
                }else{
                    // return widgets ListView.builder()
                }   
            }
        )
```