# DailySwift
开一个swift的坑，作为每日练习

------
## Day1 2016/08/10
根据 [Swift 学习指引](http://www.swiftguide.cn/)中推荐的资料开始学习。

我选择的是[梁杰numbbbbb](https://github.com/numbbbbb/)组织翻译的[The Swift Programing Language 中文版](https://github.com/numbbbbb/the-swift-programming-language-in-chinese)，目前更新到的是swift2.2。挂在极客学院的wiki：
>http://wiki.jikexueyuan.com/project/swift/

非常感谢这么一群人的贡献。

学好英语是多么重要，直接上原版 : ]

## swift代码规范
学习阅读swift的一点基本代码规范。

经过近两年的编程学习，从懵懂无知，到稍有所悟，也明白了代码规范的重要性。

Google了一下，发现这一篇[swift编码规范](http://www.cocoachina.com/swift/20141105/10145.html)，翻译自raywenderlich的[swift编程风格指南](https://github.com/raywenderlich/swift-style-guide)。

打算按照这个风格进行编码。

## Playground
下载官方的 Playground 并双击文件在 Xcode 里打开，地址如下:
>https://developer.apple.com/go/?id=swift-tour

根据这一份playground做一个快速入门。

## 基础部分
### let 和 var
swift里:

let表示常量，即它的值是不可变的;
var表示变量，即它的值为可变。

在声明常量和变量时，可以添加类型标注(type annotation)。

但是要注意，在常量名和变量名后面，加一个冒号和空格

正确的写法：

 	var welcomeMessage: String

错误的写法：

 	var welcomeMessage:String


可以在一行中，声明多个变量:

	var red, green, blue: Double

值得一提的是，在swift中，你可以用任何你喜欢的字符来给常量和变量命名，包括Unicode字符：

	let π = 3.14159
	let 你好 = "你好世界"
	let 🐶🐮 = "dogcow"
	

### print输出

和C语言一样，我们可以用print来输出常量和变量。

	var friendlyWelcome = "Hello!"
	friendlyWelcome = "Bonjour!"
	print("The current value of friendlyWelcome is \(friendlyWelcome)")

输出 ：
>"The current value of friendlyWelcome is Bonjour!"

### 类型安全
swift是一个类型安全（type safe）的语言。

它会在编译你的代码时，进行类型检查（type checks），并把不匹配的类型标记为错误。

可选（Optional）类型就是一个很好的例子:

可选类型用于处理值缺失的情况。可选，表示“那儿有一个值，并且它等于 x ”或者“那儿没有值”。

可选有点像在 Objective-C 中使用nil，但是它可以用在任何类型上，不仅仅是类。

>可选类型比 Objective-C 中的nil指针更加安全,也更具表现力，它是 Swift 许多强大特性的重要组成部分。

Swift 可以让你清楚地知道值的类型。如果你的代码期望得到一个`String`，类型安全会阻止你不小心传入一个`Int`。你可以在开发阶段尽早发现并修正错误。

### 类型检查

处理不同类型的值时，类型检查可以帮你避免错误。

当你在声明常量或者变量的时候,赋给它们一个字面量（literal value 或 literal）即可触发类型推断。

>推断浮点数的类型时，Swift 总是会选择`Double`而不是`Float`。

如果表达式中同时出现了整数和浮点数，会被推断为`Double`类型：

```
let anotherPi = 3 + 0.14159
// anotherPi 会被推测为 Double 类型
```

原因在于，原始值`3`没有显式声明类型，而表达式中出现了一个浮点字面量，所以表达式会被推断为`Double`类型。

### 整数和浮点数转换
整数和浮点数的转换必须显式指定类型：

```
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi 等于 3.14159，所以被推测为 Double 类型
```

这个例子中，常量`three`的值被用来创建一个`Double`类型的值，所以加号`两边的数类型须相同`。

如果不进行转换，两者无法相加。

浮点数到整数的反向转换同样行，整数类型可以用`Double`或者`Float`类型来初始化：

```
let integerPi = Int(pi)
// integerPi 等于 3，所以被推测为 Int 类型
```

当用这种方式来初始化一个新的整数值时，浮点值会被截断。也就是说`4.75`会变成`4`，`-3.9`会变成`-3`。

> 注意：
> 结合数字类常量和变量不同于结合数字类字面量。字面量`3`可以直接和字面量`0.14159`相加，因为数字字面量本身没有明确的类型。它们的类型只在编译器需要求值的时候被推测。



### 类型别名

类型别名（type aliases）就是给现有类型,定义另一个名字。

使用`typealias`关键字来定义类型别名。

当你想要给现有类型起一个更有意义的名字时，类型别名非常有用。假设你正在处理特定长度的外部资源的数据：

```
typealias AudioSample = UInt16
```

定义了一个类型别名之后，你可以在任何使用原始名的地方使用别名：

```
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound 现在是 0
```

本例中，`AudioSample`被定义为`UInt16`的一个别名。因为它是别名，`AudioSample.min`实际上是`UInt16.min`，所以会给`maxAmplitudeFound`赋一个初值`0`。

### 布尔值

Swift 有一个基本的布尔（Boolean）类型，叫做`Bool`。布尔值指逻辑上的值，因为它们只能是真或者假。Swift 有两个布尔常量，`true`和`false`：

```
let orangesAreOrange = true
let turnipsAreDelicious = false
```


如果你在需要使用`Bool`类型的地方使用了非布尔值，Swift 的类型安全机制会报错。
下面的例子会报告一个编译时错误：

```
let i = 1
if i {
    // 这个例子不会通过编译，会报错
}
```

然而，下面的例子是合法的：

```
let i = 1
if i == 1 {
    // 这个例子会编译成功
}
```

`i == 1`的比较结果是`Bool`类型，所以第二个例子可以通过类型检查。类似`i == 1`这样的比较，请参考[基本操作符](http://wiki.jikexueyuan.com/project/swift/chapter2/05_Control_Flow.html)。和 Swift 中的其他类型安全的例子一样，这个方法可以避免错误，并保证这块代码的意图总是清晰的。

### 元组

*元组（tuples）*把多个值组合成一个复合值。

>元组内的值可以是任意类型，并不要求是相同类型。

下面这个例子中，`(404, "Not Found")`是一个描述 *HTTP 状态码（HTTP status code）*的元组。

HTTP 状态码是当你请求网页的时候 web 服务器返回的一个特殊值。如果你请求的网页不存在就会返回一个`404 Not Found`状态码。

```
let http404Error = (404, "Not Found")
// http404Error 的类型是 (Int, String)，值是 (404, "Not Found")
```

`(404, "Not Found")`元组把一个`Int`值和一个`String`值组合起来表示 HTTP 状态码的两个部分：一个数字和一个人类可读的描述。这个元组可以被描述为: “一个类型为`(Int, String)`的元组”。

#### 元祖的内容分解

你可以将一个元组的内容分解（decompose）成单独的常量和变量，然后你就可以正常使用它们了：

    let (statusCode, statusMessage) = http404Error
    print("The status code is \(statusCode)")
    // 输出 "The status code is 404"
    print("The status message is \(statusMessage)")
    // 输出 "The status message is Not Found"
    
如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：

    let (justTheStatusCode, _) = http404Error
    print("The status code is \(justTheStatusCode)")
    // 输出 "The status code is 404"


#### 访问元祖的单个元素
你还可以通过下标来访问元组中的单个元素，下标从零开始：

```
print("The status code is \(http404Error.0)")
// 输出 "The status code is 404"
print("The status message is \(http404Error.1)")
// 输出 "The status message is Not Found"
```

你可以在定义元组的时候给单个元素命名：

```
let http200Status = (statusCode: 200, description: "OK")
```

给元组中的元素命名后，你可以通过名字来获取这些元素的值：

```
print("The status code is \(http200Status.statusCode)")
// 输出 "The status code is 200"
print("The status message is \(http200Status.description)")
// 输出 "The status message is OK"
```

PS:作为函数返回值时，元组非常有用。一个用来获取网页的函数可能会返回一个`(Int, String)`元组来描述是否获取成功。和只能返回一个类型的值比较起来，一个包含两个不同类型值的元组可以让函数的返回信息更有用。请参考[函数参数与返回值](http://wiki.jikexueyuan.com/project/swift/chapter2/06_Functions.html#Function_Parameters_and_Return_Values)。

> 注意：
> 元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。如果你的数据结构并不是临时使用，请使用类或者结构体而不是元组。请参考[类和结构体](http://wiki.jikexueyuan.com/project/swift/chapter2/09_Classes_and_Structures.html)。

----------

## Day2 2016/08/11

知易行难，在工作之余，抽出时间来学习swift，并不像之前想象的轻松。

继续基础部分之旅。

### 可选类型

使用可选类型（optionals）来处理值可能缺失的情况。

可选类型表示：

`有值，等于 x`或`没有值

>注意：
C 和 Objective-C 中并没有可选类型这个概念。

>最接近的是 Objective-C 中的一个特性，一个方法要不返回一个对象要不返回nil，nil表示“缺少一个合法的对象”。

>然而，这只对对象起作用——对于结构体，基本的 C 类型或者枚举类型不起作用。对于这些类型，Objective-C 方法一般会返回一个特殊值（比如NSNotFound）来暗示值缺失。这种方法假设方法的调用者知道并记得对特殊值进行判断。然而，Swift 的可选类型可以让你暗示_任意类型_的值缺失，并不需要一个特殊值。

例如：

	let possibleNumber = "123"
	let convertedNumber = Int(possibleNumber)
	// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"

这里Int()返回的，肯定是一个int类型的值，但如果里面转化的字符为”hello,world“这样的形式，就会转化失败。所以它返回一个可选类型（optional）Int，而不是一个Int。

一个`可选的Int`被写作`Int?`，而不是一个`Int`。

问号暗示包含的值是可选类型，也就是说：可能包含Int值，或者不包含值（如之前所说，可能有值为Int类型，或者没有。并不能包含其他任何值，比如Bool值或者String值。只能是Int或者什么都没有。）


#### nil
你可以给可选变量赋值为nil,表示它没有值

	var serverResponseCode: Int? = 404
	// serverResponseCode 包含一个可选的 Int 值 404
	serverResponseCode = nil
	// serverResponseCode 现在不包含值

>注意：

>nil不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。也就说，nil只能用于可选(optional)类型。

如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为`nil`：

	var surveyAnswer: String?
	// surveyAnswer 被自动设置为 nil

>注意：
>Swift 的nil和 Objective-C 中的nil并不一样。在 Objective-C 中，nil是一个指向不存在对象的指针。在 Swift 中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。

### if语句以及强制解析

使用if语句来判定一个可选(optional)值是否包含值。可以使用“`相等`”(==)或者"`不等`"(!=)来执行比较。




