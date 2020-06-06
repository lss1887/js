//声明一个方法:目的是根据id获取标签
function jQuery(selector) {
    //selector是什么样子的:"#id值"
    //1.根据选择器获取id
    var id = selector.substring(1);
    //2.根据id获取标签
    var element = document.getElementById(id);
    return element
}

$ = jQuery