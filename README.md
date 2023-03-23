# easy_network
Getting started

The first step is to include network into your project, for example:

1.Add configuration to pubspec.yaml file
~~~
 easy_network:
    git:
      url: https://github.com/DickHoo/easy_network.git
~~~

2.lib usage
~~~
 
  Retrofit retrofit = Retrofit.getInstance()
        .getBuilder()
        .baseUrl("https://www.wanandroid.com")
        .openLog()
        .connectTimeout(Duration(seconds: connectTimeout))
        .receiveTimeout(Duration(seconds: receiveTimeout))
 
 
  var data = await retrofit.get("/article/list/0/json", data: map);
  print("$data")       
        
~~~