# DailySwift
开一个swift的坑，每日更新。

前期以学语法为主，中后期代码跟进。

报了一个rxSwift的班，之后将探索它在项目中的实际使用。

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



## Day2  2016/08/11

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
你可以给可选(Optional)变量赋值为nil,表示它没有值

	var serverResponseCode: Int? = 404
	// serverResponseCode 包含一个可选的 Int 值 404
	serverResponseCode = nil
	// serverResponseCode 现在不包含值

>注意：

>nil不能用于`非可选`的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。也就说，nil只能用于可选(optional)类型。

如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为`nil`：

	var surveyAnswer: String?
	// surveyAnswer 被自动设置为 nil

>注意：
>Swift 的nil和 Objective-C 中的nil并不一样。在 Objective-C 中，nil是一个指向不存在对象的指针。在 Swift 中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。

#### if语句以及强制解析

你可以使用`if`语句和`nil`比较来判断一个可选值是否包含值。你可以使用“相等”(`==`)或“不等”(`!=`)来执行比较。

如果可选类型有值，它将不等于`nil`:

```
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// 输出 "convertedNumber contains some integer value."
```

你可以在可选(Optional)的名字后面加一个感叹号（`!`）来获取值。前提是，你得确定可选类型，这个时候是一定有值的。这被称为可选值的*强制解析（forced unwrapping）*：

```
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// 输出 "convertedNumber has an integer value of 123."
```

>注意：
>使用`!`来获取一个不存在的可选值会导致运行时错误。使用`!`来强制解析值之前，一定要确定可选包含一个非`nil`的值

#### 可选绑定

使用_可选绑定（optional binding）_来判断可选类型是否包含值.

如果包含,就把值赋给一个临时常量或者变量。可选绑定（optional binding）可以用在`if`和`while`语句中，这条语句不仅可以用来判断可选类型中是否有值，同时可以将可选类型中的值赋给一个常量或者变量。

像下面这样在`if`语句中写一个可选绑定：

```
if let constantName = someOptional {
    statements
}
```

你可以像上面这样使用可选绑定来重写`possibleNumber`这个[例子](http://wiki.jikexueyuan.com/project/swift/chapter2/01_The_Basics.html#optionals)：

```
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}
// 输出 "'123' has an integer value of 123"
```

这段代码可以被理解为：

“如果`Int(possibleNumber)`返回的可选`Int`包含一个值，创建一个叫做`actualNumber`的新常量并将可选包含的值赋给它。”

如果转换成功，actualNumber常量可以在if语句的第一个分支中使用。它已经被可选类型 包含的 值初始化过，所以不需要再使用`!`后缀来获取它的值。

你可以包含多个可选绑定在`if`语句中，并使用`where`子句做布尔值判断。

```
if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}
// prints "4 < 42"
```

#### 隐式解析可选类型

如上所述，可选类型暗示了常量或者变量可以“没有值”。

可选(Optional)可以通过`if`语句来判断是否有值，如果`有值`的话可以通过`可选绑定`来解析值。

有时候在程序架构中，第一次被赋值之后，可以确定一个*可选类型总会有值*。在这种情况下，每次都要判断和解析可选值,是非常`低效`的，因为可以确定它总会有值。

这种类型的可选状态被定义为隐式解析可选类型（implicitly unwrapped optionals）。把想要用作可选的类型的后面的问号（`String?`）改成感叹号（`String!`）来声明一个隐式解析可选类型。

当可选类型被第一次赋值之后就可以确定之后一直有值的时候，隐式解析可选类型非常有用。隐式解析可选类型主要被用在 Swift 中类的构造过程中，请参考[无主引用以及隐式解析可选属性](http://wiki.jikexueyuan.com/project/swift/chapter2/16_Automatic_Reference_Counting.html#unowned_references_and_implicitly_unwrapped_optional_properties)。

可选类型`String`和隐式解析可选类型`String`之间的区别：

```
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要惊叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号
```

你可以把隐式解析可选类型当做一个可以自动解析的可选类型。你要做的只是声明的时候把感叹号放到类型的结尾，而不是每次取值的可选名字的结尾。

你仍然可以把`隐式解析可选类型`当做普通可选类型来判断它是否包含值：

```
if assumedString != nil {
    print(assumedString)
}
// 输出 "An implicitly unwrapped optional string."
```

你也可以在`可选绑定`中,使用`隐式解析可选类型`来检查并解析它的值：

```
if let definiteString = assumedString {
    print(definiteString)
}
// 输出 "An implicitly unwrapped optional string."
```

> 注意：
> 如果一个变量之后可能变成`nil`的话请不要使用隐式解析可选类型。如果你需要在变量的生命周期中判断是否是`nil`的话，请使用普通可选类型。

### 错误处理

你可以使用*错误处理(error handling)*来应对程序执行中可能会遇到的错误条件。

相对于可选中运用值的存在与缺失,表达函数的成功与失败，错误处理可以推断失败的原因，并传播至程序的其他部分。

当一个函数遇到错误条件，它能报错。调用函数的地方能抛出错误消息并合理处理。

```
func canThrowAnError() throws {
    // 这个函数有可能抛出错误
}
```

一个函数可以通过在声明中添加`throws`关键词来抛出错误消息。

当你的函数能抛出错误消息时, 你应该在表达式中前置`try`关键词。

```
do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch {
    // 有一个错误消息抛出
}
```

一个`do`语句创建了一个新的包含作用域,使得错误能被传播到一个或多个`catch`从句。

这里有一个错误处理如何用来应对不同错误条件的例子。

```
func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
    eatASandwich()
} catch Error.OutOfCleanDishes {
    washDishes()
} catch Error.MissingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
```

在此例中，`makeASandwich()`（做一个三明治）函数会抛出一个错误消息如果没有干净的盘子或者缺失某个原料。因为`makeASandwich()`抛出错误，函数调用被包裹在`try`表达式中。

将函数包裹在一个`do`语句中,任何被抛出的错误,都会被传播到提供的`catch`从句中。

如果没有错误被抛出, `eatASandwich()`函数会被调用。

如果一个匹配`Error.OutOfCleanDishes`的错误被抛出,`washDishes`函数会被调用。

如果一个匹配`Error.MissingIngredients`的错误被抛出，`buyGroceries(_:)`函数会被调用，并且使用`catch`所捕捉到的关联值`[String]`作为参数。

### 断言

可选类型可以让你判断值是否存在，你可以在代码中优雅地处理值缺失的情况。然而，在某些情况下，如果值缺失或者值并不满足特定的条件，你的代码可能没办法继续执行。这时，你可以在你的代码中触发一个_断言（assertion）_来结束代码运行并通过调试来找到值缺失的原因。

#### 使用断言进行调试

断言会在运行时判断一个逻辑条件是否为`true`。从字面意思来说，断言“断言”一个条件是否为真。你可以使用断言来保证在运行其他代码之前，某些重要的条件已经被满足。如果条件判断为`true`，代码运行会继续进行；如果条件判断为`false`，代码执行结束，你的应用被终止。

如果你的代码在调试环境下触发了一个断言，比如你在 Xcode 中构建并运行一个应用，你可以清楚地看到不合法的状态发生在哪里并检查断言被触发时你的应用的状态。此外，断言允许你附加一条调试信息。

你可以使用全局`assert(_:_:file:line:)`函数来写一个断言。向这个函数传入一个结果为`true`或者`false`的表达式以及一条信息，当表达式的结果为`false`的时候这条信息会被显示：

```
let age = -3
assert(age >= 0, "A person's age cannot be less than zero")
// 因为 age < 0，所以断言会触发
```
在这个例子中，只有`age >= 0`为`true`的时候(即`age`的值非负的时候),代码才会继续执行。如果`age`的值是负数，就像代码中那样，`age >= 0`为`false`，断言被触发，终止应用。

如果不需要断言信息，可以省略，就像这样：

    assert(age >= 0)


> 注意：
> 当代码使用优化编译的时候，断言将会被禁用，例如在 Xcode 中，使用默认的 target Release 配置选项来 build 时，断言会被禁用。



### 何时使用断言

当条件`可能为假`时使用断言，但是最终一定要*保证条件为真*，这样你的代码才能继续运行。断言的适用情景：

* 整数类型的下标索引,被传入一个自定义下标实现，但是下标索引值可能太小或者太大。
* 需要给函数传入一个值，但是非法的值可能导致函数不能正常执行。
* 一个可选值现在是`nil`，但是后面的代码运行需要一个非`nil`值。

请参考[下标](http://wiki.jikexueyuan.com/project/swift/chapter2/12_Subscripts.html)和[函数](http://wiki.jikexueyuan.com/project/swift/chapter2/06_Functions.html)。

> 注意：
> `断言`可能导致你的应用终止运行，应当仔细设计你的代码让`非法条件`不会出现。
> 然而，在你的应用发布之前，有时候`非法条件`可能出现，这时`断言`可以快速发现问题。


## Day1 2016/08/12
之前的许多概念，通读下来，完全的复制粘贴。
接下来试着组织语言，进行消化。
### 基本运算符
运算符分为一元、二元和三元运算符。

> 一元运算符
> 
>一元运算符，对单一操作对象操作（如 `-a`）。
>
>一元运算符分`前置运算符`和`后置运算符`。
>
>前置运算符需紧跟在操作对象之前（如 `!b`），后置运算符需紧跟在操作对象之后（如 `c!`）。
>
> 二元运算符
>
>二元运算符，操作两个操作对象（如 `2 + 3`）。
>
>二元运算符是中置的，因为它们出现在两个操作对象之间。
>
> 三元运算符
>
>三元运算符，操作三个操作对象。
>和 C 语言一样，Swift 只有一个三元运算符，就是三目运算符（`a ? b : c`）。

受运算符影响的值叫`操作数`，在表达式 `1 + 2` 中，加号 `+` 是二元运算符，它的两个操作数是值 `1` 和 `2`。

#### 赋值运算符
赋值运算符（=）`不返回值`，以防止把想要判断相等运算符（==）的地方写成赋值符导致的错误。(与之相反，加减乘除等算术运算符都会返回值)

Swift 的赋值操作并不返回任何值。以下代码是错误的：

```
if x = y {
    // 此句错误, 因为 x = y 并不返回任何值。无真无假。
}
```

这个特性使你无法把（==）错写成（=），由于 if x = y 是错误代码，Swift 能帮你避免此类错误发生。

#### 算术运算符
Swift 默认情况下,不允许在数值运算中出现溢出情况。但是你可以使用 Swift 的`溢出运算符`来实现溢出运算（如 a &+ b）。

swift中的加号运算符，可以用于字符串的拼接:

    "hello, " + "world"  // 等于 "hello, world"

#### 求余运算符
这个也是比较常见的运算符号，顾名思义，求余运算（a % b）将返回a除以b的余数。

在对负数 b 求余时，b 的符号会被忽略。这意味着 a % b 和 a % -b 的结果是相同的:

    let a = 8 % 3;
    let b = 8 % -3;
    if a==b {
        print("\(a)等于\(b)")
    }
    //输出“2等于2”

值得一提的是，swift还可以对`浮点数`进行求余运算。

    8 % 2.5   // 等于 0.5


#### 组合赋值运算符
Swift 提供把其他运算符和赋值运算（`=`）组合的组合赋值运算符，组合加运算（`+=`）是其中一个例子：

```
var a = 1
a += 2
// a 现在是 3
```

表达式 `a += 2` 是 `a = a + 2` 的简写，一个组合加运算（+=），就是把加法运算和赋值运算组合成进一个运算符里，同时完成两个运算任务。

依次类推，组合乘运算`a *= b`等于`a = a * b `:

```
var myVariable = 50
myVariable *= 2;
//此时myVariable的值为100
```

> 注意：
> 复合赋值运算，和赋值运算一样，也没有返回值。
> `let b = a += 2`这类代码是错误。这不同于上面提到的自增和自减运算符。

#### 比较运算符

当元组中的值可以比较时，你也可以使用这些运算符来比较它们的大小。

例如，因为 Int 和 String 类型的值可以比较，所以类型为 (Int, String) 的元组也可以被比较。

比较`元组大小`会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止。如果所有的值都相等，那么这一对元组我们就称它们是相等的。例如：

```
(1, "zebra") < (2, "apple")   // true，因为 1 小于 2
(3, "apple") < (3, "bird")    // true，因为 3 等于 3，但是 apple 小于 bird
(4, "dog") == (4, "dog")      // true，因为 4 等于 4，dog 等于 dog
```

>注意： Swift 标准库只能比较七个以内元素的元组比较函数。如果你的元组元素超过七个时，你需要自己实现比较运算符。

#### 空合运算符(Nil Coalescing Operator)
空合运算符（a ?? b）将对可选类型 a 进行空判断,表达式 a 必须是 Optional 类型,默认值 b 的类型必须要和 a 存储值的类型保持一致。

空合运算符是对以下代码的简短表达方法：

```
a != nil ? a! : b
```

上述代码使用了三目运算符。当可选类型 `a` 的值不为空时，进行强制解封（`a!`），访问 `a` 中的值；反之返回默认值`b`。无疑空合运算符（`??`）提供了一种更为优雅的方式去封装条件判断和解封两种行为，显得简洁以及更具可读性。

下文例子采用空合运算符，实现了在默认颜色名和可选自定义颜色名之间抉择：

```
let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"
```

`userDefinedColorName` 变量被定义为一个可选的 `String` 类型，默认值为 `nil`。由于 `userDefinedColorName` 是一个可选类型，我们可以使用空合运算符去判断其值。在上一个例子中，通过空合运算符为一个名为 `colorNameToUse`的变量赋予一个字符串类型初始值。 由于 `userDefinedColorName` 值为空，因此表达式 `userDefinedColorName ?? defaultColorName` 返回 `defaultColorName` 的值，即 `red`。

另一种情况，分配一个非空值（`non-nil`）给 `userDefinedColorName`，再次执行空合运算，运算结果为封包在`userDefaultColorName` 中的值，而非默认值。

```
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 非空，因此 colorNameToUse 的值为 "green"
```

#### 区间运算符
##### 闭区间运算符

闭区间运算符（`a...b`）定义一个包含从 `a` 到 `b`（包括 `a` 和 `b`）的所有值的区间。`a` 的值不能超过 `b`。 ‌ 闭区间运算符在迭代一个区间的所有值时是非常有用的，如在 `for-in` 循环中：

```
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
// 1 * 5 = 5
// 2 * 5 = 10
// 3 * 5 = 15
// 4 * 5 = 20
// 5 * 5 = 25
```
##### 半开区间运算符

半开区间（`a..<b`）定义一个从 `a` 到 `b` 但不包括 `b` 的区间。 之所以称为半开区间，是因为该区间包含第一个值而不包括最后的值。

半开区间的实用性在于当你使用一个从 0 开始的列表（如数组）时，非常方便地从0数到列表的长度。

```
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}
// 第 1 个人叫 Anna
// 第 2 个人叫 Alex
// 第 3 个人叫 Brian
// 第 4 个人叫 Jack
```

数组有 4 个元素，但 `0..<count` 只数到3（最后一个元素的下标），因为它是半开区间。
### 字符串和字符

#### 初始化空字符串 (Initializing an Empty String)

要创建一个空字符串作为初始值，可以将空的字符串字面量赋值给变量，也可以初始化一个新的`String`实例：

```
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法
// 两个字符串均为空并等价。
```

您可以通过检查其`Bool`类型的`isEmpty`属性来判断该字符串是否为空：

```
if emptyString.isEmpty {
    print("Nothing to see here")
}
// 打印输出："Nothing to see here"
```



#### 字符串可变性 (String Mutability)

您可以通过将一个特定字符串分配给一个变量来对其进行修改，或者分配给一个常量来保证其不会被修改：

```
var variableString = "Horse"
variableString += " and carriage"
// variableString 现在为 "Horse and carriage"

let constantString = "Highlander"
constantString += " and another Highlander"
// 这会报告一个编译错误 (compile-time error) - 常量字符串不可以被修改。
```

> 注意： 在 Objective-C 和 Cocoa 中，您需要通过选择两个不同的类(`NSString`和`NSMutableString`)来指定字符串是否可以被修改。



#### 字符串是值类型（Strings Are Value Types）

Swift 的`String`类型是值类型。 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。 任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操作。 值类型在 [结构体和枚举是值类型](http://wiki.jikexueyuan.com/project/swift/chapter2/09_Classes_and_Structures.html#structures_and_enumerations_are_value_types) 中进行了详细描述。

Swift 默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值。 很明显无论该值来自于哪里，都是您独自拥有的。 您可以确信传递的字符串不会被修改，除非你自己去修改它。

在实际编译时，Swift 编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着您将字符串作为值类型的同时可以获得极高的性能。

### 集合类型

Swift 语言提供`Arrays`、`Sets`和`Dictionaries`三种基本的集合类型用来存储集合数据。数组（Arrays）是有序数据的集。集合（Sets）是无序无重复数据的集。字典（Dictionaries）是无序的键值对的集。

#### 数组的简单语法

写 Swift 数组应该遵循像`Array`这样的形式，其中`Element`是这个数组中唯一允许存在的数据类型。我们也可以使用像`[Element]`这样的简单语法。尽管两种形式在功能上是一样的，但是推荐较短的那种，而且在本文中都会使用这种形式来使用数组。



#### 创建一个空数组

我们可以使用构造语法来创建一个由特定数据类型构成的空数组：

```
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
// 打印 "someInts is of type [Int] with 0 items."
```

注意，通过构造函数的类型，`someInts`的值类型被推断为`[Int]`。

或者，如果代码上下文中已经提供了类型信息，例如一个函数参数或者一个已经定义好类型的常量或者变量，我们可以使用空数组语句创建一个空数组，它的写法很简单：`[]`（一对空方括号）：

```
someInts.append(3)
// someInts 现在包含一个 Int 值
someInts = []
// someInts 现在是空数组，但是仍然是 [Int] 类型的。
```

#### 通过两个数组相加创建一个数组

我们可以使用加法操作符（`+`）来组合两种已存在的相同类型数组。新数组的数据类型会被从两个数组的数据类型中推断出来：

```
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
// anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
```



#### 用字面量构造数组

我们可以使用字面量来进行数组构造，这是一种用一个或者多个数值构造数组的简单方法。字面量是一系列由逗号分割并由方括号包含的数值：

`[value 1, value 2, value 3]`。

下面这个例子创建了一个叫做`shoppingList`并且存储`String`的数组：

```
var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList 已经被构造并且拥有两个初始项。
```

`shoppingList`变量被声明为“字符串值类型的数组“，记作`[String]`。 因为这个数组被规定只有`String`一种数据结构，所以只有`String`类型可以在其中被存取。 在这里，`shoppinglist`数组由两个`String`值（`"Eggs"` 和`"Milk"`）构造，并且由字面量定义。


### 控制流

### 函数

